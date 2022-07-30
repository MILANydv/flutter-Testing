import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';

class Proximity extends StatefulWidget {
  const Proximity({Key? key}) : super(key: key);

  @override
  State<Proximity> createState() => _ProximityState();
}

class _ProximityState extends State<Proximity> {
  double _proximityValues = 0;

  final List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    _streamSubscriptions.add(proximityEvents!.listen((ProximityEvent event) {
      setState(() {
        _proximityValues = event.proximity;
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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Proximity'),
          centerTitle: true,
        ),
        body: Center(
          child: _proximityValues >= 4
              ? const Text("Object is Far")
              : const Text("Object is Near"),
        ));
  }
}
