import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderBanner extends StatelessWidget {
  const SliderBanner({
    Key? key,
    required this.pageViewController,
  }) : super(key: key);

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
