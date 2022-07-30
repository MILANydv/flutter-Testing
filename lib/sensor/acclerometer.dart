import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';

class Acclerometer extends StatefulWidget {
  const Acclerometer({Key? key}) : super(key: key);

  @override
  State<Acclerometer> createState() => _AcclerometerState();
}

class _AcclerometerState extends State<Acclerometer> {
  List<double> _acclerometerValues = <double>[];

  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    _streamSubscriptions
        .add(accelerometerEvents!.listen((AccelerometerEvent event) {
      setState(() {
        _acclerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    super.initState();
  }

  @override
  void dispose() {
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> accelerometer = _acclerometerValues
        .map((double value) => value.toStringAsFixed(1))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Acclerometer'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
              "AccleroMeter:\n X: ${accelerometer[0]} Y: ${accelerometer[1]} Z: ${accelerometer[2]}"),
        ));
  }
}
