import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double gaugeValue = 45;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SfRadialGauge(
                            enableLoadingAnimation: true,
                            axes: <RadialAxis>[
                              RadialAxis(
                                interval: 45,
                                minimum: 0,
                                maximum: 180,
                                ranges: <GaugeRange>[
                                  GaugeRange(
                                      startValue: 0,
                                      endValue: 180,
                                      gradient: SweepGradient(colors: [
                                        Colors.green,
                                        Colors.orange,
                                        Colors.red
                                      ], stops: const <double>[
                                        0.0,
                                        0.5,
                                        1
                                      ])),
                                ],
                                pointers: <GaugePointer>[
                                  NeedlePointer(
                                      value: gaugeValue,
                                      needleLength: 0.8,
                                      enableAnimation: true,
                                      animationType: AnimationType.ease,
                                      knobStyle: KnobStyle(
                                        knobRadius: 0.1,
                                        borderColor: Colors.blue,
                                        borderWidth: 0.009,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () => {
                                    setState(() {
                                      if (gaugeValue == 0) {
                                        gaugeValue = 45;
                                      } else if (gaugeValue == 45) {
                                        gaugeValue = 0;
                                      }
                                    }),
                                  },
                              child: Text("+")),
                          Container(
                            height: 100,
                            width: displayWidth,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: Text("-")),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}