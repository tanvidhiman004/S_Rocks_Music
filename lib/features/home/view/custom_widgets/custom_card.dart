import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../config/assets.dart';
import '../../../servicedetail/view/service_detail_view.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final String backgroundImage;

  const ServiceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailScreen(title: title),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white24,
            width: 1.2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background image covers full container (including padding)
              Positioned.fill(
                child: Image.asset(
                  backgroundImage,
                  fit: BoxFit.cover,
                ),
              ),

              // Semi-transparent overlay
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  children: [
                    SvgPicture.asset(iconPath),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(Assets.rightArrow),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );


  }
}


class ShimmerServiceCard extends StatelessWidget {
  const ShimmerServiceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24, width: 1.2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade700,
          child: Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            color: Colors.grey.shade800,
          ),
        ),
      ),
    );
  }
}
