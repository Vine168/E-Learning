import 'package:flutter/material.dart';
import 'package:elearning_app/screens/pdf_viewer_page.dart';

class EarthSciencePage extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'ធនធានរ៉ែ', 'pdf': 'assets/pdfs/complex_number.pdf'},
    {'title': 'សិលា', 'pdf': 'assets/pdfs/limit_of_function.pdf'},
    {'title': 'ដំណើរពុកផុយនិងកំណកំណើតដី', 'pdf': 'assets/pdfs/continuity_of_function.pdf'},
    {'title': 'សំណឹកនិងការចាក់បង្គរ', 'pdf': 'assets/pdfs/derivative_of_function.pdf'},
    {'title': 'ភពផែនដី', 'pdf': 'assets/pdfs/integral_definite.pdf'},
    {'title': 'ទីតាំងផែនដីនិងព្រះអាទិត្យ', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ទំនាញសកលនិងចលនាភព', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'ព្រះចន្ទរបស់ផែនដី', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'ព្រះអាទិត្យ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ភពក្នុងប្រព័ន្ធព្រះអាទិត្យ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'អង្គតូចក្នុងប្រព័ន្ធព្រះអាទិត្យនិងពពកអត៍', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ប្រវត្តិប្រព័ន្ធព្រះអាទិត្យ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ការស្រាវជ្រាវពីសកល', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'តារានឹង', 'pdf': 'assets/pdfs/differential_function.pdf'},
    {'title': 'ប្រព័ន្ធតារានិងកាឡាក់ស៊ី', 'pdf': 'assets/pdfs/logarithmic_function.pdf'}, 
    {'title': 'ការរីកនៃសកល', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'វដ្តជីវភូគព្ភគីមី', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ឥន្ធនៈផូស៊ីល', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ថាមពលអុស', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ថាមពលផ្សេងៗ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'កំណើនកម្ដៅលើពិភពលោក', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'កំណើនប្រជាជន', 'pdf': 'assets/pdfs/probability.pdf'},
    {'title': 'ការបំពុលឬកង្វក់', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'ការបំផ្លាញស្រទាប់អូសូន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'សំណល់', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'និរន្តរភាពបរិស្ថាន', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
    {'title': 'កិច្ចសហប្រតិបត្តិការ', 'pdf': 'assets/pdfs/vector_analysis.pdf'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6BC6F3),
      appBar: AppBar(
        backgroundColor: const Color(0xFF6BC6F3),
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
                  'assets/images/earth_science.png', // Replace with your header image
                  height: 50,
                ),
                SizedBox(height: 10),
                Text(
                  "ផែនដីវិទ្យា​",
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
                          backgroundColor: const Color(0xFF6BC6F3),
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

