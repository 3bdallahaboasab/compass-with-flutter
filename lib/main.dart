import 'dart:math';

import 'package:compass/compass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compass/flutter_compass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCompass(),
    );
  }
}

class MyCompass extends StatefulWidget {
  const MyCompass({super.key});

  @override
  State<MyCompass> createState() => _MyCompassState();
}

class _MyCompassState extends State<MyCompass> {
  @override
  double? heading = 0;
  bool isQibla = false;
  String val = "وييين يحووب ";

  void test() {
    if (heading! < 60 || heading! > 0) {
      setState(() {
        val = "بعدك بعييد يحوووب ";
      });
    } else if (heading! < 110 || heading! > 60) {
      setState(() {
        val = " يلا قربت شد حيلك";
      });
    } else if (heading! < 0) {
      setState(() {
        val = "حوب مشان الله , ويين رايح ؟؟ ";
      });
    } else if (heading! == 120) {
      setState(() {
        val = "بااااااااااااس";
      });
    }
  }

  void initState() {
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/12be8c1f-b0b1-4783-8924-1e4f18c7199c.jfif",
              ))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Compass App"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                heading!.ceil() == 120 ? "بااااااااس " : "ويييين يحوووب",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "${heading!.ceil()}",
                style: TextStyle(
                    color: heading!.ceil() == 120 ? Colors.green : Colors.white,
                    fontSize: 30),
              )),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset("assets/com.png"),
                  Transform.rotate(
                    filterQuality: FilterQuality.high,
                    angle: ((heading ?? 0) * (pi / 180) * 1),
                    child: Image.asset("assets/compass.png"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
