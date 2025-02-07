import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfPath;

  PdfViewerPage({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        backgroundColor: Colors.pink.shade100,
      ),
      body: SfPdfViewer.asset(
        pdfPath, // Path of the PDF passed from the MathsPage
      ),
    );
  }
}
