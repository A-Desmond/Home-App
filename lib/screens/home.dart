import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_app/utils/smart_device.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Padding const
  final double horizontalpadding = 45;
  final double verticalpadding = 25;

  //List of devices
  List devices = [
    ['Light', 'assets/light-bulb.png', true],
    ['AC', 'assets/air-conditioner.png', false],
    ['TV', 'assets/smart-tv.png', false],
    ['Fan', 'assets/fan.png', false],
  ];

  powerSwitchChnage(bool value, int index) {
    setState(() {
      devices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalpadding, vertical: verticalpadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/menu.png',
                    color: Colors.grey[800],
                    height: 45,
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalpadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                  Text(
                    'A. Desmond',
                    style: GoogleFonts.bebasNeue(fontSize: 50),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
              child: Text(
                ' Devices',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800]),
              ),
            ),
            Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(25),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemCount: devices.length,
                    itemBuilder: (context, index) {
                      return SmartDevice(
                        deviceName: devices[index][0],
                        iconPath: devices[index][1],
                        powerOn: devices[index][2],
                        onChanged: (value) => powerSwitchChnage(value, index),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
