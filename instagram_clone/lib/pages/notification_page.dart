import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';

import '../asset.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 80.0,
            width: screenSize.width,
            color: black,
            child: TabBar(
              indicatorColor: pink,
              indicatorWeight: 3,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 17.0),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'Following',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Tab(
                  child: Text(
                    'You',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CustomScrollView(
                  slivers: [
                    const SliverPadding(padding: EdgeInsets.only(top: 8.0)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          'New',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: ListTile(
                              title: SizedBox(
                                width: 80.0,
                                height: 35.0,
                                child: RichText(
                                  softWrap: true,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            '${newNotificationList[index].profileId}  ',
                                        style: const TextStyle(
                                          fontFamily: 'GB',
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: newNotificationList[index]
                                            .profileDescription,
                                        style: const TextStyle(
                                          color: grey,
                                          fontFamily: 'GS',
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: newNotificationList[index].time,
                                        style: const TextStyle(
                                          color: grey,
                                          fontFamily: 'GB',
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              trailing: newNotificationList[index].holderWidget,
                              leading: SizedBox(
                                width: 48.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Image(
                                      image: AssetImage(Asset.pointIcon),
                                    ),
                                    const SizedBox(
                                      width: 7.0,
                                    ),
                                    Image(
                                      width: 35.0,
                                      height: 35.0,
                                      image: AssetImage(
                                        newNotificationList[index]
                                            .profileImageUrl,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: newNotificationList.length,
                      ),
                    )
                  ],
                ),
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        'New',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
