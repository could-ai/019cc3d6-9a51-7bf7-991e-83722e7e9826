import 'package:flutter/material.dart';
import 'package:couldai_user_app/data/portfolio_data.dart';
import 'package:couldai_user_app/widgets/sections/hero_section.dart';
import 'package:couldai_user_app/widgets/sections/about_section.dart';
import 'package:couldai_user_app/widgets/sections/skills_section.dart';
import 'package:couldai_user_app/widgets/sections/projects_section.dart';
import 'package:couldai_user_app/widgets/sections/contact_section.dart';
import 'package:couldai_user_app/widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  
  // Keys to scroll to specific sections
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(
            onNavTap: (section) {
              switch (section) {
                case 'Home': _scrollToSection(_heroKey); break;
                case 'About': _scrollToSection(_aboutKey); break;
                case 'Skills': _scrollToSection(_skillsKey); break;
                case 'Projects': _scrollToSection(_projectsKey); break;
                case 'Contact': _scrollToSection(_contactKey); break;
              }
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeroSection(key: _heroKey, onContactTap: () => _scrollToSection(_contactKey)),
                  AboutSection(key: _aboutKey),
                  SkillsSection(key: _skillsKey),
                  ProjectsSection(key: _projectsKey),
                  ContactSection(key: _contactKey),
                  const SizedBox(height: 50), // Footer padding
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "© 2024 Built with Flutter",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
