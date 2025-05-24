import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music/features/news/news_view.dart';
import 'package:music/features/projects/projects_view.dart';
import 'package:music/features/trackbox/track_box_view.dart';

import '../../../../config/assets.dart';
import '../../provider/home_provider.dart';
import '../home_view.dart';


class CustomBottomNavExample extends ConsumerWidget {
  const CustomBottomNavExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final pages = [
       HomeView(),
      NewsView(),
      TrackBoxView(),
      ProjectsView(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF18171C),
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xFF18171C),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          border: Border(
            top: BorderSide(color: Colors.white24, width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(ref, 0, Assets.home, 'Home', isLogo: true),
            _buildNavItem(ref, 1, Assets.news, 'News'),
            _buildNavItem(ref, 2, Assets.musicBar, 'TrackBox'),
            _buildNavItem(ref, 3, Assets.project, 'Projects'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      WidgetRef ref,
      int index,
      String icon,
      String label, {
        bool isLogo = false,
      }) {
    final isSelected = ref.watch(bottomNavIndexProvider) == index;
    return GestureDetector(
      onTap: () => ref.read(bottomNavIndexProvider.notifier).state = index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLogo)
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'S',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF141214),
                  ),
                ),
              ),
            )
          else
            Image.asset(
              icon,
              color: isSelected ? Colors.white : Colors.white54,
              height: 24,
              width: 24,
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Colors.white54,
            ),
          )
        ],
      ),
    );
  }
}
