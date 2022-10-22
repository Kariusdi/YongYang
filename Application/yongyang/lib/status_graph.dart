import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StatusGraph extends StatefulWidget {
  const StatusGraph({Key? key}) : super(key: key);

  @override
  State<StatusGraph> createState() => _StatusGraphState();
}

class _StatusGraphState extends State<StatusGraph> {
  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
}
