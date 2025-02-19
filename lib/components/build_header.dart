import 'package:flutter/material.dart';
import 'package:flutter_todo/components/build_dialog_modal.dart';
import 'package:flutter_todo/components/build_digital_clock.dart';
import 'package:flutter_todo/constants.dart';

class BuildHeader extends StatefulWidget {
  const BuildHeader({super.key});

  @override
  State<BuildHeader> createState() => _BuildHeaderState();
}

class _BuildHeaderState extends State<BuildHeader> {
  DateTime now = DateTime.now();
  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> greetings = [
    "Good Morning Ahmad!",
    "Good Afternoon Ahmad!",
    "Good Night Ahmad!",
  ];

  String getGreeting() {
    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return "Good morning Ahmad! ";
    } else if (hour >= 12 && hour < 18) {
      return "Good afternoon Ahmad!";
    } else {
      return "Good night Ahmad! 🌙";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeaderHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset("assets/images/day-sunny.png"),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 9, 77, 155),
                  borderRadius: BorderRadius.circular(20), // Curved border
                ),
                height: kHeaderHeight,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' ${days[now.weekday - 1]} - ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Courier',
                          ),
                        ),
                        const SizedBox(width: 10), // Correct spacing
                        BuildDigitalClock(),
                      ],
                    ),
                    Text(
                      getGreeting(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Courier',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: kHeaderHeight,

                child: FilledButton.icon(
                  onPressed: () {
                    setState(() {
                      showDialog(
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return const Align(
                            alignment: Alignment.topCenter,
                            child: BuildDialogModal(),
                          );
                        },
                      );
                    });
                  },
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text("New Task", style: TextStyle(fontSize: 20)),
                  ),
                  icon: Icon(Icons.add, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
