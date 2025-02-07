import 'package:flutter/material.dart';
import 'maths_page.dart';
import 'physics_page.dart';
import 'chemistry_page.dart';
import 'biology_page.dart';
import 'khmer_literature_page.dart';
import 'english_page.dart';
import 'history_page.dart';
import 'exam_paper_page.dart';

class SciencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF97292),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF97292),
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
                  'assets/images/science.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "Science",
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
                    _buildCategoryTile(context, "Maths", "assets/images/maths.png", MathsPage()),
                    _buildCategoryTile(context, "Physics", "assets/images/physics.png", PhysicsPage()),
                    _buildCategoryTile(context, "Chemistry", "assets/images/chemistry.png", ChemistryPage()),
                    _buildCategoryTile(context, "Biology", "assets/images/biology.png", BiologyPage()),
                    _buildCategoryTile(context, "Khmer Literature", "assets/images/literature.png", KhmerLiteraturePage()),
                    _buildCategoryTile(context, "English", "assets/images/english.png", EnglishPage()),
                    _buildCategoryTile(context, "History", "assets/images/history.png", HistoryPage()),
                    _buildCategoryTile(context, "Exam Paper", "assets/images/exam.png", ExamPaperPage()),
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
          color: Colors.pink.shade50,
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
