import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class GeographyPage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'ទម្រង់ប្រជាសាស្ត្រកម្ពុជា', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'បម្លាស់លំនៅនៃប្រជាជនកម្ពុជា', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'វិសមភាពចំពោះសុខភាព', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'វិសមភាពចំពោះការអប់រំ', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'វិសមភាពនៃការប្រើប្រាស់សេវាមូលដ្ឋាន', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'កសិកម្មកម្ពុជា', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ឧស្សាហកម្មកម្ពុជា', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'គមនាគមន៍កម្ពុជា', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'ពាណិជ្ជកម្មកម្ពុជា', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ទេសចរកម្ពុជា', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'បញ្ហាមិននៅកម្ពុជា', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សិក្សាអនុគមន៍', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'លក្ខខណ្ឌប្រវត្តិសាស្ត្រនៃការអភិវឌ្ឍទីក្រុង', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សេដ្ឋកិច្ចតំបន់និងការបែងចែកប្រភេទខេត្តក្រុង', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'កំណើននគរូបនីយកម្មនិងបញ្ហាបរិស្ថាន', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'មជ្ឈមណ្ឌលជំរុញសេដ្ឋកិច្ចមួយ', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'អំណាចសេដ្ឋកិច្ចពិភពលោក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រព័ន្ធសេដ្ឋកិច្ច រដ្ឋបាល និងនយោជយហរដ្ឋអាមេរិក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សហរដ្ឋអាមេរិកគ្រប់គ្រងលំហ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រជាជនសហរដ្ឋអាមេរិក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'លំហសេដ្ឋកិច្ចសហរដ្ឋអាមេរិក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'គ្រឹះនៃមហាអំណាចជប៉ុន', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ជប៉ុនដណ្តើមទីផ្សារពិភពលោក', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'តំបន់រៀបចំតាមលំដាប់និងតំបន់កំពុងកសាង', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'អានុភាពសេដ្ឋកិច្ចសហភាពអឺរ៉ុប', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'នានាភាពនៃលំហសេដ្ឋកិច្ចសហភាពអឺរ៉ុប', 'pdf': 'assets/pdfs/vector_analysis.pdf'},

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
                  'assets/images/geography.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "ភូមិវិទ្យា​",
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
