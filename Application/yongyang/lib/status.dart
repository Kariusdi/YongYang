import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:yongyang/models/sensorsVal_model.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  DatabaseReference rf = FirebaseDatabase.instance.ref().child('Sensors');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: rf.onValue,
        builder: (context, AsyncSnapshot snapshot) {
          var sensors = Sensors.fromJson(snapshot.data!.snapshot.value);
          var tempPercent = sensors.temperature / 100;
          var humiPercent = sensors.humidity / 100;
          if (snapshot.hasData) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: CircularPercentIndicator(
                        radius: 140,
                        progressColor: Color.fromARGB(170, 255, 204, 0),
                        animation: true,
                        percent: tempPercent,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${sensors.temperature}°C",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              'อุณหภูมิ',
                              style: GoogleFonts.mitr(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: CircularPercentIndicator(
                        radius: 140,
                        progressColor: Color.fromARGB(170, 110, 38, 255),
                        animation: true,
                        percent: humiPercent,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${sensors.humidity}%",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              'ความชื้น',
                              style: GoogleFonts.mitr(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return CircularPercentIndicator(radius: 50);
          }
        });
  }
}
