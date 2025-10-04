import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: const NetworkImage(
                'https://scontent.fcrk1-2.fna.fbcdn.net/v/t39.30808-6/548750480_122223829730144395_5229013095809677260_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHFYOba8l7Jl6SsAJcmRtKBijc5obl9jK-KNzmhuX2Mr-AGKYio8qeQ4zRIVQP7pL0_RWIJWEZSBwQVArpmESTb&_nc_ohc=qFSjwUU-lt0Q7kNvwGfN8_j&_nc_oc=AdlNBPL9_HAyM0KqpHl_TnYwEDVISFY_hXesuVqBw8zGxhlE4SHqBf4WhA89U922Oag&_nc_zt=23&_nc_ht=scontent.fcrk1-2.fna&_nc_gid=dO1LrRHt6gzvAZhpMAy-3g&oh=00_AfaApvnH9Lxfawk_WfoK6-jQmGveI34Kf_Rssq_PBQq4UQ&oe=68E33126',
              ),
              backgroundColor: Theme.of(context).primaryColor.withAlpha(51),
            ),
            const SizedBox(height: 20),
            Text(
              'John Paul Hechanova',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Bachelor of Science and Technology - College Student',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Passionate Flutter developer with a keen eye for UI/UX design and a drive to create impactful applications.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}