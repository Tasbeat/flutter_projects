import 'package:ecommerce_app/constants/colors.dart';
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
      backgroundColor: CustomColors.backgroundScreenColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SliderBanner(pageViewController: pageViewController),
            ),
            SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  color: Colors.transparent,
                  height: 120,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const CategoryItem();
                    },
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

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Container(
            width: 56.0,
            height: 56.0,
            decoration: ShapeDecoration(
              shadows: const [
                BoxShadow(
                  color: CustomColors.red,
                  blurRadius: 30,
                  spreadRadius: -6,
                  offset: Offset(0.0, 10.0),
                )
              ],
              color: CustomColors.red,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            child: const Icon(
              Icons.mouse,
              color: Colors.white,
            ),
          ),
        ),
        Text('data')
      ],
    );
  }
}

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
