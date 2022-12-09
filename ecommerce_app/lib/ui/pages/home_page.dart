import 'package:ecommerce_app/constants/asset.dart';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var pageViewController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 60),
          child: const CustomAppBar(),
        ),
        backgroundColor: CustomColors.backgroundScreenColor,
        body: CustomScrollView(
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
            ),
            const HeaderTitle(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 180.0,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProductCard(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
