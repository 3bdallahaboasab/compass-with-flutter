import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_compass/utils/src/compass_ui.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SmoothCompass(
          rotationSpeed: 200,
          height: 300,
          width: 300,
          compassAsset: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/compass.png"),
                    fit: BoxFit.cover)),
          ),
          compassBuilder: (context, AsyncSnapshot<CompassModel>? compassData,
              Widget compassAsset) {
            return compassAsset;
          },
        ),
      ),
    );
  }
}
