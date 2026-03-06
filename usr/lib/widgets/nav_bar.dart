import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/portfolio_data.dart';

class NavBar extends StatelessWidget {
  final Function(String) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      color: AppColors.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "PORTFOLIO.",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          if (isDesktop)
            Row(
              children: [
                _NavButton(title: "Home", onTap: () => onNavTap('Home')),
                _NavButton(title: "About", onTap: () => onNavTap('About')),
                _NavButton(title: "Skills", onTap: () => onNavTap('Skills')),
                _NavButton(title: "Projects", onTap: () => onNavTap('Projects')),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => onNavTap('Contact'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Contact Me"),
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.surface,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(title: const Text("Home", style: TextStyle(color: Colors.white)), onTap: () { Navigator.pop(context); onNavTap('Home'); }),
                      ListTile(title: const Text("About", style: TextStyle(color: Colors.white)), onTap: () { Navigator.pop(context); onNavTap('About'); }),
                      ListTile(title: const Text("Skills", style: TextStyle(color: Colors.white)), onTap: () { Navigator.pop(context); onNavTap('Skills'); }),
                      ListTile(title: const Text("Projects", style: TextStyle(color: Colors.white)), onTap: () { Navigator.pop(context); onNavTap('Projects'); }),
                      ListTile(title: const Text("Contact", style: TextStyle(color: Colors.white)), onTap: () { Navigator.pop(context); onNavTap('Contact'); }),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
