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

  double posX = 180, posY = 350;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: StreamBuilder<GyroscopeEvent>(
          stream: SensorsPlatform.instance.gyroscopeEvents,
          builder: (context, snapshot) {
            // print("");
            if (snapshot.hasData) {
              posX = posX + (snapshot.data!.x * 10);
              if (posX > width) {
                posX = width;
              } else if (posX < 0) {
                posX = 0;
              }
              posY = posY + (snapshot.data!.y * 10);
              if (posY > height) {
                posY = height;
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
