import 'package:flutter/material.dart';

void main() {
  runApp(const MyProfileApp());
}

class MyProfileApp extends StatelessWidget {
  const MyProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App',
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: 20,
          ),
          child: Column(
            children: const [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/14306684?v=4',
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Md Mahfuzul Amin RAJU",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Flutter Beginner & Future App Developer",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "I love building mobile apps with Flutter.\n"
                "Learning new things every day and\n"
                "enjoying the journey 🚀",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}