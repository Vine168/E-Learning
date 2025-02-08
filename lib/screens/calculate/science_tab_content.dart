import 'package:flutter/material.dart';

class ScienceTabContent extends StatefulWidget {
  @override
  _ScienceTabContentState createState() => _ScienceTabContentState();
}

class _ScienceTabContentState extends State<ScienceTabContent> {
  // Map to hold scores and grades
  final Map<String, TextEditingController> _controllers = {
    "Maths": TextEditingController(),
    "Khmer Literature": TextEditingController(),
    "Physics": TextEditingController(),
    "Chemistry": TextEditingController(),
    "Biology": TextEditingController(),
    "History": TextEditingController(),
    "English": TextEditingController(),
  };

  final Map<String, String> _grades = {
    "Maths": "",
    "Khmer Literature": "",
    "Physics": "",
    "Chemistry": "",
    "Biology": "",
    "History": "",
    "English": "",
  };

  String result = "";
  String grade = "";
  int total = 0;

  String _calculateGrade(String subject, int score) {
    switch (subject) {
      case "Maths":
        return _determineGrade(score, [62, 75, 87, 100, 112]);
      case "Khmer Literature":
      case "Physics":
      case "Chemistry":
      case "Biology":
        return _determineGrade(score, [37, 45, 52, 60, 67]);
      case "History":
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
      case "Maths":
        return "assets/images/maths.png";
      case "Khmer Literature":
        return "assets/images/literature.png";
      case "Physics":
        return "assets/images/physics.png";
      case "Chemistry":
        return "assets/images/chemistry.png";
      case "Biology":
        return "assets/images/biology.png";
      case "History":
        return "assets/images/history.png";
      case "English":
        return "assets/images/english.png";
      default:
        return "";
    }
  }

  void _findResult() {
    int sum = 0;
    bool pass = true;

    _controllers.forEach((subject, controller) {
      int score = int.tryParse(controller.text) ?? 0;
      String grade = _calculateGrade(subject, score);
      sum += score;
      if (["F"].contains(grade)) pass = false;
      _grades[subject] = grade;
    });

    setState(() {
      total = sum;
      result = pass ? "ជាប់" : "ធ្លាក់";  // "Pass" / "Fail" in Khmer
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Section
              Center(
                child: Text(
                  "បញ្ចូលពិន្ទុរបស់អ្នក",  // "Input Your Score" in Khmer
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
                    "ស្វែងរកលទ្ធផល",  // "Find Result" in Khmer
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
                      "លទ្ធផលរបស់អ្នក",  // "Your Result" in Khmer
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
                        _buildResultCard("លទ្ធផល", result),  // "Result" in Khmer
                        _buildResultCard("ចំណាត់ថ្នាក់", grade),  // "Grade" in Khmer
                        _buildResultCard("ពិន្ទុសរុប", total.toString()),  // "Total" in Khmer
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
                        "លុប",  // "Delete" in Khmer
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
  Widget _buildSubjectCard(
      String subject, TextEditingController controller, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 35,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 5),
            Text(
              subject == "Maths" ? "គណិតវិទ្យា" :
              subject == "Khmer Literature" ? "អក្សរសាស្ត្រខ្មែរ" :
              subject == "Physics" ? "រូបវិទ្យា" :
              subject == "Chemistry" ? "គីមីវិទ្យា" :
              subject == "Biology" ? "ជីវវិទ្យា" :
              subject == "History" ? "ប្រវត្តិវិទ្យា" :
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
                labelText: "បញ្ចូលពិន្ទុ",  // "Score" in Khmer
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
            )
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
