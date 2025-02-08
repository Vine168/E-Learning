import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MoralCivicePage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'បញ្ញា', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'ការបង្កើតថ្មី', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'ល្បិចទូទៅនៃគំនិត', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'ទំនោរធម្មជាតិនៃមនុស្ស', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'ឆន្ទៈ', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'តម្លៃនិងសីលវិជ្ជា', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ចិត្តញាណនិងសីលញាណ', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'ទំនួលខុសត្រូវនិងវិបាកវិនិច្ឆ័យ', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'គុណធម៌', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សិទ្ធិនិងច្បាប់', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'យុត្តិធម៌', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'មង្គល ៣៨ប្រការ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ភាពចុះសម្រងរវាងសាសនាទាំងឡាយ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សីលធម៌សកល', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'កំណើតសិទ្ធិមនុស្ស', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'ច្បាប់អន្តរជាតិអំពីសិទ្ធិមនុស្ស', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ទំនាក់ទំនងសេដ្ឋកិច្ចនិងសកលភាវូបនីតកម្ម', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'សេចក្តីប្រកាសអំពីសិទ្ធិក្នុងការអភិវឌ្ឍអង្គការសហប្រជាជាតិ', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'សិទ្ធិមនុស្សតាមទស្សនវិស័យពុទ្ធសាសនា', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សិទ្ធិជនជាតិផ្សេងៗនៅកម្ពុជា', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សិទ្ធិនារី', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សិទ្ធិកុមារ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ការផ្តន្ទាទោសលើបទឧក្រិដ្ឋប្រល័យពូជសាសន៍', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'បញ្ហាចិត្ត- សង្គម', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'រាជរដ្ឋាភិបាល', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'ស្ថាប័ននីតិប្រតិបត្តិនៃព្រះរាជាណាចក្រកម្ពុជា', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'រដ្ឋបាលមូលដ្ឋាន', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'ស្ថាប័នតុលាការនៃព្រះរាជាណាចក្រកម្ពុជា', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'ចំណោទក្នុងសហគមន៍និងដំណោះស្រាយ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សារៈសំខាន់នៃការធ្វើជំរឿន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'របបគ្រប់គ្រងនៅប្រទេសមួយចំនួន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ច្បាប់អន្តោប្រវេសន៍', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ច្បាប់សញ្ជាតិ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សេដ្ឋកិច្ចពិភពលោក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'បរិស្ថានពិភពលោក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ពលរដ្ឋពិភពលោក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
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
                  'assets/images/moral.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "សីលធម៌ ពលរដ្ឋ​",
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
