import 'package:flutter/material.dart';

class SensorApp extends StatefulWidget {
  const SensorApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SensorApp> createState() => _SensorAppState();
}

class _SensorAppState extends State<SensorApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: centerX,
            top: centerY,
            child: Container(
              color: Colors.red,
              width: 100,
              height: 100,
            ),
          ),
          // StreamBuilder<AccelerometerEvent>(
          //     stream: SensorsPlatform.instance.accelerometerEvents,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         posX = posX + (snapshot.data!.x * 10);
          //         if (posX > width) {
          //           posX = width - 60;
          //         } else if (posX < 0) {
          //           posX = 0;
          //         }
          //         posY = posY + (snapshot.data!.y * 10);
          //         if (posY > height) {
          //           posY = height - 100;
          //         } else if (posY < 0) {
          //           posY = 0;
          //         }
          //       }
          //       return Transform.translate(
          //         offset: Offset(posX, posY),
          //         child: const CircleAvatar(
          //           radius: 30,
          //           backgroundColor: Colors.red,
          //         ),
          //       );
          //     }),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text('Accelerometer: $posX,$posY'),
          // ),
        ],
      ),
    );
  }
}
