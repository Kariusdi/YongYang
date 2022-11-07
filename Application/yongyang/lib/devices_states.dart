import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongyang/models/deviceStates_model.dart';

class Devicecontroller extends StatefulWidget {
  const Devicecontroller({Key? key}) : super(key: key);

  @override
  State<Devicecontroller> createState() => _DevicecontrollerState();
}

class _DevicecontrollerState extends State<Devicecontroller> {
  DatabaseReference rf = FirebaseDatabase.instance.reference().child('States');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: rf.onValue,
        builder: (context, AsyncSnapshot snapshot) {
          var states = States.fromJson(snapshot.data.snapshot.value);
          if (snapshot.hasData) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    states.fan1 == 1
                        ? Container(
                            decoration: BoxDecoration(
                                color: Color(0xAA013328),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)),
                                border:
                                    Border.all(color: const Color(0xAAE3DCD2))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'พัดลม 1',
                                        style: GoogleFonts.mitr(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'สถานะ : ',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: 'เปิด',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.air_rounded,
                                    size: 50,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Color(0xAACC8B65),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)),
                                border:
                                    Border.all(color: const Color(0xAAE3DCD2))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'พัดลม 1',
                                        style: GoogleFonts.mitr(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'สถานะ : ',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: 'ปิด',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.air_rounded,
                                    size: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 10,
                    ),
                    states.fan2 == 1
                        ? Container(
                            decoration: BoxDecoration(
                                color: Color(0xAA013328),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)),
                                border:
                                    Border.all(color: const Color(0xAAE3DCD2))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'พัดลม 2',
                                        style: GoogleFonts.mitr(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'สถานะ : ',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: 'เปิด',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.air_rounded,
                                    size: 50,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Color(0xAACC8B65),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)),
                                border:
                                    Border.all(color: const Color(0xAAE3DCD2))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'พัดลม 2',
                                        style: GoogleFonts.mitr(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'สถานะ : ',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: 'ปิด',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.air_rounded,
                                    size: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    states.heater == 1
                        ? Container(
                            decoration: BoxDecoration(
                                color: Color(0xAA013328),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)),
                                border:
                                    Border.all(color: const Color(0xAAE3DCD2))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'ตัวทำความร้อน',
                                        style: GoogleFonts.mitr(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'สถานะ : ',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: 'เปิด',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.heat_pump_rounded,
                                    size: 50,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Color(0xAACC8B65),
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)),
                                border:
                                    Border.all(color: const Color(0xAAE3DCD2))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'ตัวทำความร้อน',
                                        style: GoogleFonts.mitr(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'สถานะ : ',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: 'ปิด',
                                                style: GoogleFonts.mitr(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.heat_pump_rounded,
                                    size: 50,
                                  )
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      width: 155,
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Text('Error');
          }
        });
  }
}
