import 'package:flutter/material.dart';

class ScoreInputCard extends StatefulWidget {
  final String subject;
  final int maxScore;
  final Function(int) onScoreChanged;

  const ScoreInputCard({
    required this.subject,
    required this.maxScore,
    required this.onScoreChanged,
  });

  @override
  _ScoreInputCardState createState() => _ScoreInputCardState();
}

class _ScoreInputCardState extends State<ScoreInputCard> {
  int score = 0;
  String grade = "F";

  void calculateGrade() {
    double percentage = (score / widget.maxScore) * 100;

    if (percentage >= 90) {
      grade = "A";
    } else if (percentage >= 80) {
      grade = "B";
    } else if (percentage >= 70) {
      grade = "C";
    } else if (percentage >= 60) {
      grade = "D";
    } else if (percentage >= 50) {
      grade = "E";
    } else {
      grade = "F";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/${widget.subject.toLowerCase().replaceAll(" ", "_")}.png',
              height: 30,
            ),
            SizedBox(height: 8),
            Text(
              widget.subject,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "0 - ${widget.maxScore}",
              ),
              onChanged: (value) {
                int inputScore = int.tryParse(value) ?? 0;
                if (inputScore <= widget.maxScore) {
                  setState(() {
                    score = inputScore;
                    calculateGrade();
                  });
                  widget.onScoreChanged(score);
                }
              },
            ),
            SizedBox(height: 8),
            Text(
              "Grade: $grade",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: grade == "F" ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
