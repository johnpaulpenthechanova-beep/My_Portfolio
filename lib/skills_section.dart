import 'package:flutter/material.dart';

class Skill {
  final String name;
  final IconData icon;

  Skill({required this.name, required this.icon});
}

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final List<Skill> technicalSkills = [
    Skill(name: 'Flutter', icon: Icons.mobile_friendly),
    Skill(name: 'Dart', icon: Icons.code),
    Skill(name: 'Firebase', icon: Icons.cloud_queue),
    Skill(name: 'REST APIs', icon: Icons.http),
    Skill(name: 'SQL', icon: Icons.storage),
    Skill(name: 'Git', icon: Icons.merge_type),
    Skill(name: 'UI/UX Design', icon: Icons.design_services),
  ];

  final List<Skill> softSkills = [
    Skill(name: 'Problem Solving', icon: Icons.lightbulb_outline),
    Skill(name: 'Teamwork', icon: Icons.people),
    Skill(name: 'Communication', icon: Icons.chat),
    Skill(name: 'Adaptability', icon: Icons.autorenew),
    Skill(name: 'Time Management', icon: Icons.timer),
  ];

  Widget _buildSkillChip(Skill skill) {
    return Chip(
      avatar: Icon(skill.icon, size: 18),
      label: Text(skill.name),
      backgroundColor: Theme.of(context).primaryColor.withAlpha(25),
      labelStyle: Theme.of(context).textTheme.bodySmall,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Text(
    'Skills',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.values[8],  // Note: FontWeight.w900 is equivalent and more common
              fontStyle: FontStyle.normal,
             color: Colors.white,  // Add this line for text color
  ),
),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Technical Skills',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: technicalSkills.map(_buildSkillChip).toList(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'Soft Skills',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Wrap(
                        spacing: 30.0,
                        runSpacing: 8.0,
                        children: softSkills.map(_buildSkillChip).toList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}