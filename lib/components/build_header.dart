import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_digital_clock.dart';
import 'package:flutter_todo/constants.dart';

class BuildHeader extends StatefulWidget {
  const BuildHeader({super.key});

  @override
  State<BuildHeader> createState() => _BuildHeaderState();
}

class _BuildHeaderState extends State<BuildHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeaderHeight,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 300,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset("assets/images/day-sunny.png"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    spacing: 40,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WED -",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Courier',
                        ),
                      ),
                      BuildDigitalClock(),
                    ],
                  ),
                  Text(
                    "Good Morning Ahmad!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Courier',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
