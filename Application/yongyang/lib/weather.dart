import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongyang/services/weather_api_client.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  Future<void> getData() async {
    data = (await client.getCurrentWeather('Bangkok')) as Weather?;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 22 / 100,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color(0xAAE3DCD2),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            print("$data");
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Image.asset(
                          'assets/sun.png',
                          height: 130,
                          width: 130,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45,
                                  color: Colors.black),
                            ),
                            Row(
                              children: [
                                Text(
                                  'ฝนอาจจะตก',
                                  style: GoogleFonts.mitr(
                                      fontSize: 15, color: Colors.black),
                                ),
                                const Text(
                                  ' 10%',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'ความชื้น ',
                                    style:
                                        GoogleFonts.mitr(color: Colors.black),
                                  ),
                                  const TextSpan(
                                      text: '46% | ความดัน 1008 Pa',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
