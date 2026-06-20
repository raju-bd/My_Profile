import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatefulWidget {
  const MyProfileApp({super.key});

  @override
  State<MyProfileApp> createState() => _MyProfileAppState();
}

class _MyProfileAppState extends State<MyProfileApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      home: ProfilePage(
        toggleTheme: () {
          setState(() {
            darkMode = !darkMode;
          });
        },
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final VoidCallback toggleTheme;

  const ProfilePage({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(onPressed: toggleTheme, icon: const Icon(Icons.dark_mode)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Thanks for visiting! 🚀")),
          );
        },
        child: const Icon(Icons.favorite),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/14306684?v=4',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Md. Mahfuzul Amin RAJU",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Flutter Beginner & Future App Developer",
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                "I love building mobile apps with Flutter.\n"
                "Learning new things every day and\n"
                "enjoying the journey 🚀",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),

              infoCard(
                Icons.location_on,
                Colors.deepPurple,
                "Location",
                "Dhaka, Bangladesh",
              ),

              infoCard(
                Icons.school,
                Colors.green,
                "Education",
                "M.Com\nNational University",
              ),

              infoCard(
                Icons.code,
                Colors.blue,
                "Skills",
                "Flutter, Dart, Firebase,\nOracle,REST API, HTML, CSS",
              ),
              const SizedBox(height: 20),
              const Text(
                "Connect With Me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  socialIcon(Icons.facebook, Colors.blue),
                  socialIcon(Icons.code, Colors.black),
                  socialIcon(Icons.email, Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget infoCard(IconData icon, Color color, String title, String subtitle) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(subtitle),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget socialIcon(IconData icon, Color color) {
  return CircleAvatar(
    radius: 26,
    backgroundColor: color.withValues(alpha: 0.15),
    child: Icon(icon, color: color, size: 28),
  );
}
