import 'package:flutter/material.dart';
import 'package:yongyang/prediction.dart';
import 'package:yongyang/rubber_price.dart';
import 'package:yongyang/status.dart';
import 'package:yongyang/weather.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.accessibility_new_rounded,
            color: Colors.white,
          ),
          centerTitle: true,
          title: Text("โยงยาง",
              style: GoogleFonts.mitr(fontSize: 20, color: Colors.white)),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: Text(
                      "สถานะโยงยางของคุณ",
                      style:
                          GoogleFonts.mitr(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Status(),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "ราคายางวันนี้",
                      style:
                          GoogleFonts.mitr(fontSize: 15, color: Colors.white),
                    ),
                    RubberPrice(),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                    child: Text(
                      "คาดการณ์ว่าจะสามารถเก็บยางได้ภายใน",
                      style:
                          GoogleFonts.mitr(fontSize: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Prediction(),
              const SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                    child: Weather(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 125,
                        decoration: const BoxDecoration(
                            color: Color(0xAACC8B65),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            "สภาพอากาศ",
                            style: GoogleFonts.mitr(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
