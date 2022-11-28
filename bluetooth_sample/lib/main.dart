import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    flutterBlue.startScan(timeout: Duration(seconds: 4));
                    var subscription =
                        flutterBlue.scanResults.listen((results) {
                      for (ScanResult r in results) {
                        print('${r.device.name} found! rssi: ${r.rssi}');
                      }
                    });
                  },
                  child: Text('scan devices'))),
        ),
      ),
    );
  }
}
