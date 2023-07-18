import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(color: Colors.red),
        height: 400,
        width: 300,
        child: Stack(
          children: [
            Material(
              shadowColor: Colors.blueGrey,
              type: MaterialType.button,
              surfaceTintColor: Colors.green,
              child: Container(
                height: 400,
                width: 300,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    transform: GradientRotation(5),
                    colors: [
                      Color.fromARGB(255, 237, 246, 255),
                      Color.fromARGB(255, 229, 242, 255),
                      Color.fromARGB(255, 194, 215, 237),
                      Color.fromARGB(255, 103, 152, 201),
                      Color.fromARGB(255, 97, 171, 245),
                    ],
                  ),
                ),
              ),
            ),
            const Column(
              children: [],
            )
          ],
        ));
  }
}
