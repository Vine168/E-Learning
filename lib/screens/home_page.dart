import 'package:flutter/material.dart';

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
                  fit:
                      BoxFit.contain, // Ensures the image scales proportionally
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
                    _buildCategoryCard("Maths", "assets/images/maths.png", const Color(0xFFA48DF6)),
                    _buildCategoryCard("Physic", "assets/images/physics.png",const Color(0xFF6BC6F3)),
                    _buildCategoryCard("Chemistry", "assets/images/chemistry.png", const Color(0xFFF97292)),
                    _buildCategoryCard("Biology", "assets/images/biology.png", const Color(0xFF4FD7C3)),
                    _buildCategoryCard("Khmer Literature", "assets/images/literature.png", const Color(0xFFFFD98C)),
                    _buildCategoryCard("English", "assets/images/english.png", const Color(0xFFA48DF6)),
                    _buildCategoryCard("History", "assets/images/history.png", const Color(0xFF6BC6F3)),
                    _buildCategoryCard("Geography", "assets/images/geography.png", const Color(0xFFF97292)),
                    _buildCategoryCard("Earth SCience", "assets/images/earth_science.png", const Color(0xFF4FD7C3)),
                    _buildCategoryCard("Moral-Civics", "assets/images/morality.png", const Color(0xFFFFD98C)),
                    _buildCategoryCard("Home Economics", "assets/images/home_economic.png", const Color(0xFFA48DF6)),
                    // _buildCategoryCard("Geography", "assets/images/chemistry.png"),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Other Sections
              _buildSectionCard("Science", Colors.pink.shade100, "assets/images/science_maths.png"),
              SizedBox(height: 10),
              _buildSectionCard("Social Science", Colors.blue.shade100, "assets/images/social_science.png"),
              SizedBox(height: 10),
              _buildSectionCard("Calculate Score", Colors.purple.shade100, "assets/images/calculator.png"),
              SizedBox(height: 10),
              _buildSectionCard("Tips To Get Grade A", Colors.green.shade100, "assets/images/plus.png"),
              SizedBox(height: 10),
              _buildSectionCard("Video Lesson", Colors.orange.shade100, "assets/images/video.png"),
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
      height: 120, // Increased height to accommodate text
      width: 110,
      decoration: BoxDecoration(
        color: boxColor, // Custom box color
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
        mainAxisAlignment: MainAxisAlignment.center, // Centers everything in the box
        children: [
          Image.asset(
            imagePath, // Image for the category
            height: 50,
          ),
          const SizedBox(height: 8), // Space between image and text
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black, // Text color (adjust as needed)
            ),
            textAlign: TextAlign.center, // Center the text
          ),
        ],
      ),
    ),
  );
}
  // Helper method to build section card
  Widget _buildSectionCard(String title, Color color, String imagePath) {
    return Container(
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
    );
  }
}
