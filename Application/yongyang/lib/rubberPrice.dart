import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class RubberPrice extends StatefulWidget {
  const RubberPrice({Key? key}) : super(key: key);

  @override
  State<RubberPrice> createState() => _RubberPriceState();
}

class _RubberPriceState extends State<RubberPrice> {
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launch('https://www.raot.co.th/rubber2012/menu5.php');
        // String url = 'https://www.raot.co.th/rubber2012/menu5.php';
        // _launchURL(url);
      },
      child: Container(
        height: 40,
        width: 240,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Text(
                'Click',
                style: GoogleFonts.mitr(fontSize: 15, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              child: Text(
                'ไปดูราคาที่ตลาดกลาง',
                style: GoogleFonts.mitr(fontSize: 15, color: Colors.white),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 1,
            )
          ],
        ),
      ),
    );
  }
}
