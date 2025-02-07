import 'package:flutter/material.dart';

class VideoLessonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Lessons"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          "Video Lessons Content",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
