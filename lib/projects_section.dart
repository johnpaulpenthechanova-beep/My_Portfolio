import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// You might need to add font_awesome_flutter for more diverse icons if you prefer
// import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Uncomment if using Font Awesome

class Project {
  final String title;
  final String description;
  final String? githubLink;
  final Color? backgroundColor; // Added for customizable backgrounds

  Project({
    required this.title,
    required this.description,
    this.githubLink,
    this.backgroundColor, // Optional; defaults to null (transparent/white)
  });
}

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = [
  Project(
    title: 'E-commerce App',
    description: 'A full-featured e-commerce mobile application with product listings, cart management, and checkout process.',
    githubLink: 'https://github.com/johndoe/ecommerce_app',
    backgroundColor: Colors.indigo[100], // Light blue for e-commerce
  ),
  Project(
    title: 'Task Management Tool',
    description: 'A productivity app to help users organize daily tasks, set reminders, and track progress.',
    githubLink: 'https://github.com/johndoe/task_manager',
    backgroundColor: Colors.green[100], // Light green for productivity
  ),
  Project(
    title: 'Weather Forecast App',
    description: 'A simple weather application displaying real-time weather data and 5-day forecasts using a public API.',
    githubLink: 'https://github.com/johndoe/weather_app',
    backgroundColor: Colors.amber[100], // Light amber for weather
  ),
  Project(
    title: 'Weather Forecast App',
    description: 'A simple weather application displaying real-time weather data and 5-day forecasts using a public API.',
    githubLink: 'https://github.com/johndoe/weather_app',
    backgroundColor: Colors.cyan[100], // Vary colors for duplicates
  ),
  Project(
    title: 'Weather Forecast App',
    description: 'A simple weather application displaying real-time weather data and 5-day forecasts using a public API.',
    githubLink: 'https://github.com/johndoe/weather_app',
    backgroundColor: Colors.purple[100],
  ),
  Project(
    title: 'Weather Forecast App',
    description: 'A simple weather application displaying real-time weather data and 5-day forecasts using a public API.',
    githubLink: 'https://github.com/johndoe/weather_app',
    backgroundColor: Colors.orange[100],
  ),
  Project(
    title: 'Weather Forecast App',
    description: 'A simple weather application displaying real-time weather data and 5-day forecasts using a public API.',
    githubLink: 'https://github.com/johndoe/weather_app',
    backgroundColor: Colors.teal[100],
  ),
];

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // ignore: avoid_print
      print('Could not launch $uri'); // Changed to print for a more graceful failure in example
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Text(
    'Projects',
      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.values[8],  // Note: FontWeight.w900 is equivalent and more common
          fontStyle: FontStyle.normal,
            color: Colors.white,  // Add this line for text color
  ),
),
        ),
       const SizedBox(height: 16),

// Wrap PageView in SizedBox for proper height constraints
SizedBox(
  height: 400, // Fixed height to contain the PageView cards
  child: PageView.builder(
    controller: PageController(
      viewportFraction: 0.85, // Shows partial peeking of adjacent cards
    ),
    scrollDirection: Axis.horizontal, // Explicit horizontal scrolling
    itemCount: projects.length,
   itemBuilder: (context, index) {
  final project = projects[index];
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    child: Card(
      color: project.backgroundColor ?? const Color.fromARGB(255, 248, 246, 246), // Use project color or default to white
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
     child: Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(  // Centers the Text widget horizontally
        child: Text(
          project.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: project.backgroundColor != null 
                ? const Color.fromARGB(221, 7, 7, 7)
                : null,
          ),
          maxLines: 4,
          overflow: TextOverflow.fade,
        ),
      ),
            const SizedBox(height: 8),
            // Null-safe description display
            ...[
              Text(
                project.description,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: project.backgroundColor != null
                      ? const Color.fromARGB(137, 0, 0, 0) 
                      : null,
                ),
                maxLines: 4,
                overflow: TextOverflow.fade,
              ),
              const SizedBox(height: 8),
            ],
            // GitHub link button (conditional)
            if (project.githubLink != null) ...[
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: const Icon(Icons.code),
                  onPressed: () => _launchUrl(project.githubLink!),
                  tooltip: 'View on GitHub',
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
  ),
),
      ], );
  }
}