import 'package:flutter/material.dart';
import 'package:elearning_app/screens/pdf_viewer_page.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'ប្រទេសកម្ពុជាក្រោមអាណានិគមបារាំង (1863 - 1953)', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'របបសង្គមរាស្ត្រនិយម (1955 - 1970)', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'សាធារណរដ្ឋខ្មែរ (1970 - 1975)', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'កម្ពុជាប្រជាធិបតេយ្យ (1975 - 1979)', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'សាធារណរដ្ឋប្រជាមានិតកម្ពុជានិងរដ្ឋកម្ពុជា (1979 - 1993)', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'សហរដ្ឋអាមេរិក (1860 - 1990)', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ចក្រភពអង់គ្លេស', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'សាធារណរដ្ឋបារាំង', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'សហព័ន្ធអាល្លឺម៉ង់ (1945 - 1991)', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រទេសអុីតាលី', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សហភាពសូវៀត (1945 - 1991)', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សាធារណរដ្ឋប្រជាធិបតេយ្យអាល្លឺម៉ង់', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រទេសឆេកូស្លូវ៉ាគី', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រទេសប៉ូឡូញ', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'សហព័ន្ធយូហ្គោស្លាវី', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'បញ្ហាទូទៅក្នុងពិភពលោក', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ដំណើរវិវត្តន៍សកលភាវូបនីយកម្ម', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'បម្រែបម្រួលសង្គមអាស៊ីអាគ្នេយ៍ក្រោយសង្គ្រាមលោកលើកទី2', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'ប្រទេសវៀតណាម', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រទេសថៃ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'បណ្តាប្រទេសនៅតំបន់មជ្ឈិមបូព៌ា', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រទេសអ៊ីស្រាអែល', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
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
                  'assets/images/history.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "ប្រវត្តិវិទ្យា​",
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

