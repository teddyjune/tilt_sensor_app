import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double posX = MediaQuery.of(context).size.width / 2 - 50;
    double posY = MediaQuery.of(context).size.height / 2 - 50;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: StreamBuilder<AccelerometerEvent>(
          stream: SensorsPlatform.instance.accelerometerEvents,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              posX = posX + (snapshot.data!.x * 10);
              if (posX > width) {
                posX = width-40;
              } else if (posX < 0) {
                posX = 0;
              }
              posY = posY + (snapshot.data!.y * 10);
              if (posY > height) {
                posY = height-40;
              } else if (posY < 0) {
                posY = 0;
              }
            }
            return Transform.translate(
              offset: Offset(posX, posY),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.red,
              ),
            );
          }),
    );
  }
}

// class DrawCircle extends CustomPaint {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint();
//     paint.color = Colors.red;
//     canvas.drawCircle(Offset(posX, posY), 50, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     //false : paint call might be optimized away.
//     return false;
//   }
// }
