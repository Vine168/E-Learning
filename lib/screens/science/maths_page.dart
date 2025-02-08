import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MathsPage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'ចំនួនកុំផ្លិច', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'លីមីតនៃអនុគមន៍', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'ភាពជាប់នៃអនុគមន៍', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'ដេរីវេនៃអនុគមន៍', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'ព្រិមីទីវ និងអាំងតេក្រាលមិនកំណត់', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'អាំងតេក្រាលកំណត់', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'សមីការឌីផេរ៉ង់ស្យែល', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'ប៉ារ៉ាបូល', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'អេលីប', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'អ៊ីពែបូល', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'វុីចទ័រក្នុងលំហ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សិក្សាអនុគមន៍', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រូបាប៊ីលីតេ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
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
                  'assets/images/maths.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "គណិតវិទ្យា​",
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
                              PDFViewerPage(pdfPath: topics[index]['pdf']!),
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

class PDFViewerPage extends StatelessWidget {
  final String pdfPath;

  PDFViewerPage({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        backgroundColor: const Color(0xFFF97292),
      ),
      body: SfPdfViewer.asset(pdfPath),
    );
  }
}
