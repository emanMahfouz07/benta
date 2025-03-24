import 'package:benta/core/utils/constants.dart';
import 'package:benta/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SmallCounter extends StatefulWidget {
  const SmallCounter({super.key});

  @override
  State<SmallCounter> createState() => _SmallCounterState();
}

class _SmallCounterState extends State<SmallCounter> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        width: screenSize.width * (56 / 375),
        height: screenSize.height * 0.03,
        decoration: BoxDecoration(
          color: Color(0xff73888A),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: increment,
              child: Container(
                width: 12,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                ),
                child: Icon(Icons.add, color: kPrimaryColor, size: 10),
              ),
            ),
            Text(
              '$count',
              style: Styles.style14.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: decrement,
              child: Container(
                width: 12,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.white,
                ),
                child: Icon(Icons.remove, color: kPrimaryColor, size: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
