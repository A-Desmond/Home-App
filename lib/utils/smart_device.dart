import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDevice extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;
  SmartDevice({
    super.key,
    required this.deviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(iconPath,
                height: 65, color: powerOn ? Colors.white : Colors.black),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    deviceName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: powerOn ? Colors.white : Colors.black),
                  ),
                )),
                Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onChanged,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
