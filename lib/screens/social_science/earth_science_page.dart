import 'package:flutter/material.dart';

class EarthSciencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maths"),
      ),
      body: Center(
        child: Text(
          "Welcome to the Maths Section!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
