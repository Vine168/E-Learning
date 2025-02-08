import 'package:flutter/material.dart';
import 'science_tab_content.dart';
import 'social_science_tab_content.dart';

class CalculateScorePage extends StatefulWidget {
  @override
  _CalculateScorePageState createState() => _CalculateScorePageState();
}

class _CalculateScorePageState extends State<CalculateScorePage> {
  String selectedTab = "តារាងពិន្ទុ";  // Initial value in Khmer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA48DF6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA48DF6),
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
                  'assets/images/calculator.png', // Replace with your header image
                  height: 40,
                ),
                SizedBox(height: 10),
                Text(
                  "គណនានិទ្ទេស",  // Title in Khmer
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

          // Tab Buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton(
                    context, "តារាងពិន្ទុ", selectedTab == "តារាងពិន្ទុ"),
                _buildTabButton(
                    context, "វិទ្យាសាស្រ្ត", selectedTab == "វិទ្យាសាស្រ្ត"),
                _buildTabButton(
                    context, "វិទ្យាសាស្រ្តសង្គម", selectedTab == "វិទ្យាសាស្រ្តសង្គម"),
              ],
            ),
          ),

          // Content Area
          Expanded(
            child: Container(
              color: Colors.white,
              child: _getTabContent(),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build tab buttons
  Widget _buildTabButton(BuildContext context, String title, bool isSelected) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Color(0xFFA48DF6) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {
        setState(() {
          selectedTab = title;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper method to get tab content
  Widget _getTabContent() {
    switch (selectedTab) {
      case "តារាងពិន្ទុ":  // Changed to Khmer
        return Center(
          child: Text(
            "This is the Score Table content.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        );
      case "វិទ្យាសាស្រ្ត":  // Science Tab
        return ScienceTabContent();
      case "វិទ្យាសាស្រ្តសង្គម":  // Social Science Tab
        return SocialScienceTabContent();
      default:
        return Center(
          child: Text(
            "Content not available.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        );
    }
  }
}
