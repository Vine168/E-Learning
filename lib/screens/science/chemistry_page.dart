import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ChemistryPage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'ល្បឿនប្រតិកម្ម', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'កត្តាជះឥទ្ធិពលលើល្បឿនប្រតិកម្ម', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'សមាសធាតុក្នុងសូលុយស្យុងទឹក', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'កម្លាំងអន្តរម៉ូលេគុល', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'ទ្រឹស្តីអាសុីតនិងបាស', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'ប្រតិកម្មអាស៊ីតនិងបាស', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'សូលុយស្យុងទឹកនិងpH', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'អត្រាកម្មអាសុីតបាស', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'ធម្មជាតិនៃលំនឹងគីមី', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ការរំកិលលំនឹង', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'លំនឹងអាសុីត បាស និងអំបិល', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'លក្ខណៈឧស្ម័ន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ច្បាប់ឧស្ម័ន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សមាសភាពម៉ូលេគុលឧស្ម័ន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'អេស្នែ ខ្លាញ់និងប្រេង', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ស្រឡាយអាលីផាទិចអាសូត', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សមាសធាតុប្រហើរ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'កាបូនអុីដ្រាតនិងលីពីត', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
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
                  'assets/images/chemistry.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "គីមីវិទ្យា​",
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
