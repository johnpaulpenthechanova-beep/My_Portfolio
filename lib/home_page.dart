import 'package:flutter/material.dart';
import 'package:my_portfolio_app/profile_section.dart';
import 'package:my_portfolio_app/projects_section.dart';
import 'package:my_portfolio_app/skills_section.dart';

class HomePage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomePage({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Allow background to extend behind AppBar
      appBar: AppBar(
        title: const Text('MY PORTFOLIO'),
        centerTitle: true,
        elevation: 0, // Flat AppBar to blend with background
        backgroundColor: const Color.fromRGBO(86, 167, 233, 1).withOpacity(0.70),
        iconTheme: IconThemeData(color: isDarkMode ? Colors.white : Colors.white),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.mode_night),
            onPressed: toggleTheme,
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: Container(
        // Background image with overlay for readability
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://tse2.mm.bing.net/th/id/OIP.S_5o5ZI6fhl8YxAnx-iO1QHaER?pid=Api&P=0&h=220'), // Replace with your image path
            fit: BoxFit.cover, // Covers entire screen
            colorFilter: ColorFilter.mode(
              Color.fromARGB(66, 248, 246, 246), // Dark overlay for better text contrast (adjust opacity as needed)
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileSection(),
                const SizedBox(height: 32.0),
                ProjectsSection(),
                const SizedBox(height: 32.0),
                const SkillsSection(),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}