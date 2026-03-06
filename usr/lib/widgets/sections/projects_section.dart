import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/portfolio_data.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1000;
    final isTablet = size.width > 600 && size.width <= 1000;

    int gridCount = isDesktop ? 3 : (isTablet ? 2 : 1);

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Featured Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 60,
            height: 4,
            margin: const EdgeInsets.only(top: 8, bottom: 32),
            color: AppColors.primary,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: gridCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 1.1,
            ),
            itemCount: PortfolioData.projects.length,
            itemBuilder: (context, index) {
              final project = PortfolioData.projects[index];
              return _ProjectCard(project: project);
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, String> project;

  const _ProjectCard({required this.project});

  IconData _getIcon(String? iconName) {
    switch (iconName) {
      case 'shopping_bag': return Icons.shopping_bag_outlined;
      case 'check_circle': return Icons.check_circle_outline;
      case 'people': return Icons.people_outline;
      case 'cloud': return Icons.cloud_outlined;
      default: return Icons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getIcon(project['icon']),
              color: AppColors.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            project['title']!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              project['description']!,
              style: const TextStyle(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  "View Project ->",
                  style: TextStyle(color: AppColors.accent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
