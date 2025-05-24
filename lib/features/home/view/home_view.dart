import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/assets.dart';
import '../model/service_model.dart';
import '../provider/home_provider.dart';
import 'custom_widgets/custom_card.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsyncValue = ref.watch(servicesStreamProvider);

    return Scaffold(
      backgroundColor: const Color(0xff18171C),
      body: Column(
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          const Text(
            "Hire hand-picked Pros for popular music services",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child: _buildServiceList(servicesAsyncValue)),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 340,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFFA90140), Color(0xFF550120)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              _buildSearchBar(),
              const SizedBox(height: 35),
              _buildPromoTexts(),
              const SizedBox(height: 20),
              _buildBookNowButton(),
            ],
          ),
        ),
        Positioned(
          left: -35,
          bottom: 15,
          child: Image.asset(Assets.music, height: 110, width: 110),
        ),
        Positioned(
          right: -40,
          bottom: 15,
          child: Image.asset(Assets.piano, height: 110, width: 115),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF2F2F39),
                hintText: 'Search "Punjabi Lyrics "',
                hintStyle: const TextStyle(color: Color(0xff61616B), fontSize: 15),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(Assets.search, height: 15, width: 15),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(height: 20, width: 1, color: Colors.white30),
                      const SizedBox(width: 8),
                      SvgPicture.asset(Assets.mic),
                    ],
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(Assets.profile, height: 35, width: 40),
      ],
    );
  }

  Widget _buildPromoTexts() {
    return Column(
      children: [
        const Text(
          "Claim your",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        Text(
          "Free Demo",
          style: GoogleFonts.lobster(color: Colors.white, fontSize: 45),
        ),
        const Text(
          "for custom Music Production",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildBookNowButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: const Text(
        "Book Now",
        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildServiceList(AsyncValue<List<ServiceModel>> servicesAsyncValue) {
    return servicesAsyncValue.when(
      data: (services) {
        if (services.isEmpty) {
          return const Center(
            child: Text("No services found", style: TextStyle(color: Colors.white)),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return ServiceCard(
              title: service.title,
              subtitle: service.subtitle,
              iconPath: service.iconPath,
              backgroundImage: service.backgroundImage,
            );
          },
        );
      },
      loading: () => ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: (_, __) => const ShimmerServiceCard(),
      ),
      error: (error, _) => Center(
        child: Text('Error: $error', style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
