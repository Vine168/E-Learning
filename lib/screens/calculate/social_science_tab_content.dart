import 'package:flutter/material.dart';

class SocialScienceTabContent extends StatefulWidget {
  @override
  _SocialScienceTabContentState createState() =>
      _SocialScienceTabContentState();
}

class _SocialScienceTabContentState extends State<SocialScienceTabContent> {
  // Map to hold scores and grades
  final Map<String, TextEditingController> _controllers = {
    "Khmer Literature": TextEditingController(),
    "Maths": TextEditingController(),
    "History": TextEditingController(),
    "Geography": TextEditingController(),
    "Moral/Civics": TextEditingController(),
    "Earth Science": TextEditingController(),
    "English": TextEditingController(),
  };

  final Map<String, String> _grades = {
    "Khmer Literature": "",
    "Maths": "",
    "History": "",
    "Geography": "",
    "Moral/Civics": "",
    "Earth Science": "",
    "English": "",
  };

  String result = "";
  String grade = "";
  int total = 0;

  String _calculateGrade(String subject, int score) {
    switch (subject) {
      case "Khmer Literature":
        return _determineGrade(score, [62, 75, 87, 100, 112]);
      case "Maths":
      case "History":
      case "Geography":
      case "Moral/Civics":
        return _determineGrade(score, [37, 45, 52, 60, 67]);
      case "Earth Science":
        return _determineGrade(score, [25, 30, 35, 40, 45]);
      case "English":
        return _determineGrade(score, [13, 15, 18, 20, 23]);
      default:
        return "";
    }
  }

  String _determineGrade(int score, List<int> thresholds) {
    if (score >= thresholds[4]) return "A";
    if (score >= thresholds[3]) return "B";
    if (score >= thresholds[2]) return "C";
    if (score >= thresholds[1]) return "D";
    if (score >= thresholds[0]) return "E";
    return "F";
  }

  String _getSubjectImagePath(String subject) {
    switch (subject) {
      case "Khmer Literature":
        return "assets/images/literature.png"; // Replace with your actual image paths
      case "Maths":
        return "assets/images/maths.png";
      case "History":
        return "assets/images/history.png";
      case "Geography":
        return "assets/images/geography.png";
      case "Moral/Civics":
        return "assets/images/morality.png";
      case "Earth Science":
        return "assets/images/earth_science.png";
      case "English":
        return "assets/images/english.png";
      default:
        return "assets/images/default.png";
    }
  }

  void _findResult() {
    int sum = 0;
    bool pass = true;

    _controllers.forEach((subject, controller) {
      int score = int.tryParse(controller.text) ?? 0;
      String grade = _calculateGrade(subject, score);
      sum += score;
      if (["D", "E", "F"].contains(grade)) pass = false;
      _grades[subject] = grade;
    });

    setState(() {
      total = sum;
      result = pass ? "ជាប់" : "ធ្លាក់";
      grade = _determineGrade(sum ~/ _controllers.length, [37, 45, 52, 60, 67]);
    });
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      // appBar: AppBar(
      //   title: Text("Calculate Score"),
      //   backgroundColor: Color(0xFF9376E0),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Section
              Center(
                child: Text(
                  "បញ្ចូលពិន្ទុរបស់អ្នក",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A4A4A),
                  ),
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: _controllers.keys.map((subject) {
                  // Use a corresponding image path for each subject
                  String imagePath = _getSubjectImagePath(subject);
                  return _buildSubjectCard(
                      subject, _controllers[subject]!, imagePath);
                }).toList(),
              ),

              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _findResult,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA48DF6),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "ស្វែងរកលទ្ធផល",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              // Result Section
              Center(
                child: Column(
                  children: [
                    Text(
                      "លទ្ធផលរបស់អ្នក",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A4A4A),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildResultCard("លទ្ធផល", result),
                        _buildResultCard("ចំណាត់ថ្នាក់", grade),
                        _buildResultCard("ពិន្ទុសរុប", total.toString()),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _controllers.values
                              .forEach((controller) => controller.clear());
                          result = "";
                          grade = "";
                          total = 0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "លុប",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for subject card
  Widget _buildSubjectCard(String subject, TextEditingController controller, String imagePath) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 3,
    child: Container(
      height: 200, // Adjust this height as needed
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 35, // Adjust the image height as needed
            fit: BoxFit.contain,
          ),
          SizedBox(height: 5),
          Text(
              subject == "Khmer Literature" ? "អក្សរសាស្ត្រខ្មែរ" :
              subject == "Maths" ? "គណិតវិទ្យា" :
              subject == "History" ? "ប្រវត្តិវិទ្យា" :
              subject == "Geography" ? "ភូមិវិទ្យា" :
              subject == "Moral/Civics" ? "សីលធម៌ ពលរដ្ឋ" :
              subject == "Earth Science" ? "ផែនដីវិទ្យា" :
              subject == "English" ? "ភាសាអង់គ្លេស" :
              subject,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 10),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "បញ្ចូលពិន្ទុ",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            _grades[subject] ?? "",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    ),
  );
}


  // Widget for result cards
  Widget _buildResultCard(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
