// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongyang/models/sensors_model.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  DatabaseReference sensors =
      FirebaseDatabase.instance.reference().child("Sensors");

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(20)),
              border: Border.all(color: const Color(0xAAE3DCD2))),
          child: Column(
            children: [
              StreamBuilder(
                  stream: sensors.onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    var sensorsVals =
                        Sensors.fromJson(snapshot.data!.snapshot.value);
                    var tempPercent = sensorsVals.temperature / 100;
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: CircularPercentIndicator(
                          radius: 140,
                          progressColor: Color.fromARGB(170, 255, 94, 0),
                          animation: true,
                          percent: tempPercent,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "${sensorsVals.temperature}°C",
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: CircularPercentIndicator(
                          radius: 140,
                          progressColor: Color.fromARGB(255, 110, 163, 255),
                          animation: true,
                          percent: 0,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: const Text(
                            "Error",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      );
                    }
                  }),
              Container(
                width: 170,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xAAE3DCD2),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(19),
                      bottomLeft: Radius.circular(19)),
                ),
                child: Center(
                  child: Text(
                    'อุณหภูมิ',
                    style: GoogleFonts.mitr(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(const Radius.circular(20)),
              border: Border.all(color: const Color(0xAAE3DCD2))),
          child: Column(
            children: [
              StreamBuilder(
                  stream: sensors.onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    var sensorsVals =
                        Sensors.fromJson(snapshot.data!.snapshot.value);
                    var humiPercent = sensorsVals.humidity / 100;
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: CircularPercentIndicator(
                          radius: 140,
                          progressColor: Color.fromARGB(255, 110, 163, 255),
                          animation: true,
                          percent: 0.75,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "${sensorsVals.humidity}%",
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: CircularPercentIndicator(
                          radius: 140,
                          progressColor: Color.fromARGB(255, 110, 163, 255),
                          animation: true,
                          percent: 0,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: const Text(
                            "Error",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      );
                    }
                  }),
              Container(
                width: 170,
                height: 30,
                decoration: const BoxDecoration(
                  color: const Color(0xAAE3DCD2),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(19),
                      bottomLeft: const Radius.circular(19)),
                ),
                child: Center(
                  child: Text(
                    'ความชื้น',
                    style: GoogleFonts.mitr(fontSize: 15, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
