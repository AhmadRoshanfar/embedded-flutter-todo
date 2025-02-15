import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildDigitalClock extends StatefulWidget {
  const BuildDigitalClock({super.key});

  @override
  State<BuildDigitalClock> createState() => _BuildDigitalClockState();
}

class _BuildDigitalClockState extends State<BuildDigitalClock> {
  late Timer _timer;
  String _time = DateFormat('HH:mm:ss').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time = DateFormat('HH:mm:ss').format(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _time,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Courier',
        ),
      ),
    );
  }
}
