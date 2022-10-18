import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Prediction extends StatefulWidget {
  const Prediction({Key? key}) : super(key: key);

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(
          'assets/rubber.png',
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        Text(
          '3',
          style: TextStyle(
              fontSize: 90, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'วัน',
              style: GoogleFonts.mitr(fontSize: 20, color: Colors.white),
            ),
          ],
        )
      ]),
    );
  }
}
