import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RubberPrice extends StatefulWidget {
  const RubberPrice({Key? key}) : super(key: key);

  @override
  State<RubberPrice> createState() => _RubberPriceState();
}

class _RubberPriceState extends State<RubberPrice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 270,
      decoration: BoxDecoration(
          color: Color(0xAACC8B65),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              'กก.ละ',
              style: GoogleFonts.mitr(fontSize: 15, color: Colors.white),
            ),
          ),
          const Text(
            '100',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Text(
              'บาท',
              style: GoogleFonts.mitr(fontSize: 15, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
