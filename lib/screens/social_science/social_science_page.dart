import 'package:flutter/material.dart';
import '../science/maths_page.dart';
import '../science/khmer_literature_page.dart';
import '../science/english_page.dart';
import '../science/history_page.dart';
import '../science/exam_paper_page.dart';
import 'moral_civice.dart';
import 'earth_science_page.dart';
import 'geography_page.dart';


class SocialSciencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6BC6F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6BC6F3),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/social_science.png', // Replace with your header image
                  height: 30,
                ),
                SizedBox(height: 10),
                Text(
                  "វិទ្យាសាស្រ្តសង្គម",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Categories Grid
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildCategoryTile(context, "អក្សរសាស្រ្តខ្មែរ", "assets/images/literature.png", KhmerLiteraturePage()),
                    _buildCategoryTile(context, "គណិតវិទ្យា", "assets/images/maths.png", MathsPage()),
                    _buildCategoryTile(context, "ប្រវត្តវិទ្យា", "assets/images/history.png", HistoryPage()),
                    _buildCategoryTile(context, "ភូមិវិទ្យា", "assets/images/geography.png", GeographyPage()),
                    _buildCategoryTile(context, "ផែនដីវិទ្យា", "assets/images/earth_science.png", EarthSciencePage()),
                    _buildCategoryTile(context, "សីលធម៌​ ពលរដ្ឋ", "assets/images/morality.png", MoralCivicePage()),
                    _buildCategoryTile(context, "ភាសាអង់គ្លេស", "assets/images/english.png", EnglishPage()),
                    _buildCategoryTile(context, "វិញ្ញាសា", "assets/images/exam.png", ExamPaperPage()),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for building category tiles with navigation
  Widget _buildCategoryTile(BuildContext context, String title, String imagePath, Widget destinationPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
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
            SizedBox(height: 8),
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
}
