import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongyang/models/sensorsVal_model.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  DatabaseReference rf = FirebaseDatabase.instance.ref().child('Sensors');
  var count = 1;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: rf.onValue,
        builder: (context, snapshot) {
          var sensors = Sensors.fromJson(snapshot.data.snapshot.value);
          var temp = sensors.temperature.toString();
          var humi = sensors.humidity.toString();

          for (var i = 0; i < count; i++) {
            count = 0;
          }
          if (snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    buildRow(['เวลา', temp, humi], isHeader: true),
                  ],
                ),
              ),
            );
          }
          return Text('data');
        });
  }
}

TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
      children: cells.map((cell) {
        final style = GoogleFonts.mitr(
          fontSize: isHeader ? 15 : 10,
          color: Colors.black,
        );
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              cell,
              style: style,
            ),
          ),
        );
      }).toList(),
    );
