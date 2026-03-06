import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;

  const HeroSection({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, I'm",
            style: TextStyle(
              color: AppColors.accent,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            PortfolioData.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 64 : 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          Text(
            PortfolioData.role,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: isDesktop ? 64 : 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: isDesktop ? 600 : double.infinity,
            child: Text(
              PortfolioData.about.split('. ')[0] + '.', // Just the first sentence for hero
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 18,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              ElevatedButton(
                onPressed: onContactTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text("Get In Touch"),
              ),
              OutlinedButton(
                onPressed: () {}, // Placeholder for Resume download
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.accent,
                  side: const BorderSide(color: AppColors.accent),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text("Download Resume"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
