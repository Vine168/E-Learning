import 'package:flutter/material.dart';
import 'package:elearning_app/screens/pdf_viewer_page.dart';

class BiologyPage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'សុីមណូស្ពែម', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'អង់ស្យូស្ពែម', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'ដំណឹកនាំនិងការលូតលាស់នៅក្នុងរុក្ខជាតិ', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'តំណបរំញោច', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'តម្រូវប្រសាទ', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'សរីរាង្គវិញ្ញាណ', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ប្រព័ន្ធអង់ដូគ្រីន', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'អាសុីតអាមីណេ', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'ប្រូតេអុីន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'អង់សុីម', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ADN ជាព័ត៌មានសេនេទិច', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ការសម្តែងចេញនៃសែន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'បច្ចេកវិទ្យាជីវៈ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ទ្រឹស្តីរបស់លោកដាវិន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ភស្តុតាងនៃការវិវត្ត', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'កំណត់ត្រាផូសុីល', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ពពួក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'អន្តរអំពើក្នុងចំណោមភាវៈរស់', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'បន្ទេរថាមពលក្នុងស្ថានប្រព័ន្ធ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'វដ្តរូបធាតុ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
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
                  'assets/images/biology.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "ជីវវិទ្យា​",
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
