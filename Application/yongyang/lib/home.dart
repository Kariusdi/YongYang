import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yongyang/devices_states.dart';
import 'package:yongyang/rubberPrice.dart';
import 'package:yongyang/status.dart';
import 'package:yongyang/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Homepage extends StatefulWidget {
  final User user;
  const Homepage({super.key, required this.user});
  // const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('สวัสดี, ${widget.user.displayName}',
                              style: GoogleFonts.mitr(
                                  fontSize: 20, color: Colors.black)),
                          const SizedBox(
                            width: 60,
                          ),
                        ],
                      ),
                      Text('Welcome to YongYang',
                          style: GoogleFonts.mitr(
                              fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle_rounded),
                    iconSize: 50,
                    color: Colors.black,
                    onPressed: () => print('${widget.user.displayName}'),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  Text("ค่าสถานะภายใน",
                      style:
                          GoogleFonts.mitr(fontSize: 15, color: Colors.black)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Status(),
              const SizedBox(
                height: 20,
              ),
              const Devicecontroller(),
              const Padding(
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
                  const SizedBox(
                    width: 10,
                  ),
                  const RubberPrice(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Weather(),
            ],
          ),
        ],
      )),
    );
  }
}
