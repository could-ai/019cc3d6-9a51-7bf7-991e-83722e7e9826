import 'package:flutter/material.dart';

class PortfolioData {
  static const String name = "Alex Developer";
  static const String role = "Flutter Engineer & UI Designer";
  static const String about = "I am a passionate software engineer specializing in cross-platform mobile development with Flutter. With a keen eye for design and a drive for clean, efficient code, I turn complex problems into elegant, user-friendly solutions. When I'm not coding, I'm exploring new technologies or contributing to open source.";
  
  static const List<String> skills = [
    "Flutter", "Dart", "Firebase", "Supabase", 
    "UI/UX Design", "Git", "REST APIs", "State Management"
  ];

  static const List<Map<String, String>> projects = [
    {
      "title": "E-Commerce App",
      "description": "A full-featured shopping app with cart, payment integration, and real-time order tracking.",
      "icon": "shopping_bag"
    },
    {
      "title": "Task Manager",
      "description": "Productivity tool helping teams organize tasks with Kanban boards and progress analytics.",
      "icon": "check_circle"
    },
    {
      "title": "Social Connect",
      "description": "Social media platform focusing on community building with real-time chat and feed.",
      "icon": "people"
    },
    {
      "title": "Weather Cast",
      "description": "Beautiful weather application providing accurate forecasts with dynamic animations.",
      "icon": "cloud"
    },
  ];

  static const Map<String, String> contact = {
    "email": "hello@alexdev.com",
    "github": "github.com/alexdev",
    "linkedin": "linkedin.com/in/alexdev",
    "location": "San Francisco, CA"
  };
}

class AppColors {
  static const Color primary = Color(0xFF6C63FF);
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color accent = Color(0xFF00E5FF);
}
