import 'package:flutter/material.dart';
import '../science/science_page.dart';
import '../social_science/social_science_page.dart';
import '../calculate/calculate_score_page.dart';
import '../tips/tips_page.dart';
import '../video/video_lesson_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.menu, size: 28),
                  SizedBox(width: 10),
                  Text(
                    "Welcome To Nites App",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Start Lessons Section
              ClipRRect(
                borderRadius: BorderRadius.circular(16), // Apply border radius
                child: Image.asset(
                  'assets/images/start_lesson.jpg', // Replace with your image
                  fit: BoxFit.contain, // Ensures the image scales proportionally
                ),
              ),

              SizedBox(height: 20),

              // Category Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryCard(
                        "Maths", "assets/images/maths.png", const Color(0xFFA48DF6)),
                    _buildCategoryCard(
                        "Physics", "assets/images/physics.png", const Color(0xFF6BC6F3)),
                    _buildCategoryCard(
                        "Chemistry", "assets/images/chemistry.png", const Color(0xFFF97292)),
                    _buildCategoryCard(
                        "Biology", "assets/images/biology.png", const Color(0xFF4FD7C3)),
                    _buildCategoryCard(
                        "Khmer Literature", "assets/images/literature.png", const Color(0xFFFFD98C)),
                    _buildCategoryCard(
                        "English", "assets/images/english.png", const Color(0xFFA48DF6)),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Other Sections
              _buildSectionCard(
                context,
                "Science",
                Colors.pink.shade100,
                "assets/images/science_maths.png",
                SciencePage(),
              ),
              SizedBox(height: 10),
              _buildSectionCard(
                context,
                "Social Science",
                Colors.blue.shade100,
                "assets/images/social_science.png",
                SocialSciencePage(),
              ),
              SizedBox(height: 10),
              _buildSectionCard(
                context,
                "Calculate Score",
                Colors.purple.shade100,
                "assets/images/calculator.png",
                CalculateScorePage(),
              ),
              SizedBox(height: 10),
              _buildSectionCard(
                context,
                "Tips To Get Grade A",
                Colors.green.shade100,
                "assets/images/plus.png",
                TipsPage(),
              ),
              SizedBox(height: 10),
              _buildSectionCard(
                context,
                "Video Lesson",
                Colors.orange.shade100,
                "assets/images/video.png",
                VideoLessonsPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build category card
  Widget _buildCategoryCard(String title, String imagePath, Color boxColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        height: 120,
        width: 110,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 50,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Adjusted Helper method to build section card with navigation
  Widget _buildSectionCard(BuildContext context, String title, Color color,
      String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 40,
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
