import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';

class Gyroscope extends StatefulWidget {
  const Gyroscope({Key? key}) : super(key: key);

  @override
  State<Gyroscope> createState() => _GyroscopeState();
}

class _GyroscopeState extends State<Gyroscope> {
  List<double> _gyroscopeValues = <double>[];

  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    _streamSubscriptions.add(gyroscopeEvents!.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
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
    final List<String> gyroscope = _gyroscopeValues
        .map((double value) => value.toStringAsFixed(1))
        .toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gyroscope'),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
              "Gyroscope:\n X: ${gyroscope[0]} Y: ${gyroscope[1]} Z: ${gyroscope[2]}"),
        ));
  }
}
