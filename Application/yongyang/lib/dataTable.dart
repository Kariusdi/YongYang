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
          var time = DateTime.now();
          var now = DateTime.now();

          String Date = '${now.year}-${now.month}-${now.day}';
          String Time = '${now.hour}:${now.minute}:${now.second}';
          String sixT = '',
              sixH = '',
              twelveT = '',
              twelveH = '',
              eightteenT = '',
              eightteenH = '',
              twenoneT = '',
              twenoneH = '';

          if (now.hour == 6) {
            sixT = temp;
            sixH = humi;
          } else if (now.hour == 12) {
            twelveT = temp;
            twelveH = humi;
          } else if (now.hour == 18) {
            eightteenT = temp;
            eightteenH = humi;
          } else if (now.hour == 21) {
            twenoneT = temp;
            twenoneH = humi;
          } else if (0 < now.hour && now.hour < 5) {
            sixT = '-';
            sixH = '-';
            twelveT = '-';
            twelveH = '-';
            eightteenT = '-';
            eightteenH = '-';
            twenoneT = '-';
            twenoneH = '-';
          }
          // for (var i = 0; i < count; i++) {
          //   count = 0;
          // }
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError) {
            return CircularProgressIndicator(
              color: Colors.black,
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 115, 72),
                          borderRadius:
                              BorderRadius.all(const Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ตารางแสดงค่าในแต่ละช่วงเวลา',
                            style: GoogleFonts.mitr(
                                fontSize: 14, color: Colors.white)),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('อัพเดทล่าสุด',
                        style:
                            GoogleFonts.mitr(fontSize: 12, color: Colors.grey)),
                    Text(
                      '${Date}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // const Icon(
                    //   Icons.sunny,
                    //   color: Colors.deepOrange,
                    // ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Table(
                      border: TableBorder.all(),
                      children: [
                        buildRow(['เวลา', 'อุณหภูมิ', 'ความชื้น'],
                            isHeader: true),
                        buildRow(['6.00', '27.8', '64.2']),
                        buildRow(['12.00', '63.9', '15.3']),
                        buildRow(['18.00', '57.4', '22.2']),
                        // buildRow(['21.00', temp, humi]),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return Text('data');
        });
  }
}

TableRow buildRow(List<String> cells, {bool isHeader = false}) => TableRow(
      children: cells.map((cell) {
        final style = GoogleFonts.mitr(
          fontSize: isHeader ? 15 : 12,
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
