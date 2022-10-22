import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongyang/devices_states.dart';
import 'package:yongyang/rubberPrice.dart';
import 'package:yongyang/status.dart';
import 'package:yongyang/weather.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.accessibility_new_rounded),
          color: Colors.black,
          onPressed: () => print('press'),
        ),
        centerTitle: true,
        title: Text("โยงยาง",
            style: GoogleFonts.mitr(fontSize: 20, color: Colors.black)),
        elevation: 0,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Text("ค่าสถานะภายใน",
                      style:
                          GoogleFonts.mitr(fontSize: 15, color: Colors.black)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Status(),
              SizedBox(
                height: 20,
              ),
              Devicecontroller(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(
                  thickness: 2.0,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ราคายางวันนี้",
                      style:
                          GoogleFonts.mitr(fontSize: 15, color: Colors.black)),
                  SizedBox(
                    width: 10,
                  ),
                  RubberPrice(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Weather()
            ],
          ),
        ],
      )),
    );
  }
}
