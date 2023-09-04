import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConainterAnimation extends StatefulWidget {
  const ConainterAnimation({super.key});

  @override
  State<ConainterAnimation> createState() => _ConainterAnimationState();
}

class _ConainterAnimationState extends State<ConainterAnimation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    margin: EdgeInsets.all(20),
                    duration: Duration(milliseconds: 900),
                    width: (index == _selectedIndex) ? 100 : 50,
                    height: 100,
                    color:
                        (index == _selectedIndex) ? Colors.green : Colors.red,
                    child: AnimatedScale(
                        duration: Duration(seconds: 1),
                        scale: (index == _selectedIndex) ? 1 : 0,
                        child: Center(child: Text('قرمز'))),
                  ),
                );
              })),
        ),
      ),
    );
  }
}
