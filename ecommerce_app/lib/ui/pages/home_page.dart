import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var pageViewController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: 200.0,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: PageView.builder(
                  itemCount: 3,
                  controller: pageViewController,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: Container(
                        height: 200.0,
                        color: Colors.blue,
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SmoothPageIndicator(
                  controller: pageViewController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    expansionFactor: 4,
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.black,
                    activeDotColor: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
