import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            width: screenSize.width,
            height: 100.0,
            child: ListView.builder(
              itemCount: storyList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 5.0,
                      ),
                      child: Container(
                        width: 64.0,
                        height: 64.0,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(17.0),
                          ),
                          border: Border.all(
                            width: 3.0,
                            color: index == 0
                                ? white
                                : storyList[index].borderColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            child: Image(
                              image: AssetImage(
                                storyList[index].imageUrl,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    SizedBox(
                      width: 55.0,
                      child: Flexible(
                        child: Text(
                          index == 0
                              ? 'Your Story'
                              : storyList[index].profileId,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
