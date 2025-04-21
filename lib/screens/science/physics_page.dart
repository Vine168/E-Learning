import 'package:flutter/material.dart';
import 'package:elearning_app/screens/pdf_viewer_page.dart';

class PhysicsPage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'ទ្រឹស្តីស៊ីនេទិចនៃឧស្ម័ន', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'ច្បាប់ទី១ទែម៉ូឌីណាមិច', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'ម៉ាស៊ីន', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'គោលការណ៍តម្រួតនៃរលកនិងរលកជញ្រ្ជាំ', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'អាំងទែផេរ៉ង់និងឌីប្រាក់ស្យុង', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'ដែននិងកម្លាំងម៉ាញេទិច', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'អាំងឌុចស្យុងអេឡិចត្រូម៉ាញេទិច', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'អូតូអាំងឌុចស្យុង', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'សៀគ្វីចរន្តឆ្លាស់', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'រលកអេឡិចត្រូម៉ាញេទិច', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'រូបវិទ្យានៃអង្គធាតុរឹង', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ទម្រង់អាតូម', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'រូបវិទ្យានុយក្លេអ៊ែ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ភាគល្អិតនៃផង់', 'pdf': 'assets/pdfs/vector_analysis.pdf'},

  ];

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
                  'assets/images/physics.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "រូបវិទ្យា",
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
          // Topics List Section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PdfViewerPage(pdfPath: topics[index]['pdf']!),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xFFF97292),
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          topics[index]['title']!,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

