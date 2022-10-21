import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongyang/devices_control.dart';
import 'package:yongyang/status.dart';

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
                    width: 25,
                  ),
                  Text("ค่าเซ็นเซอร์ภายใน",
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
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Text("แผงควบคุมอุปกรณ์ภายใน",
                      style:
                          GoogleFonts.mitr(fontSize: 15, color: Colors.black)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Devicecontroller(),
            ],
          ),
        ],
      )),
    );
  }
}
