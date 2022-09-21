import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/asset.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/widgets/widgets.dart';

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
                    _getNewNotificationsTitle(context),
                    _getNewNotificationList(),
                    const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
                    _getTodayNotificationTitle(context),
                    _getTodayNotificationList(),
                    const SliverPadding(padding: EdgeInsets.only(top: 30.0)),
                    _getThisWeekNotificationTitle(context),
                    _getThisWeekNotificationList(),
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

  CustomNotificagtionList _getThisWeekNotificationList() {
    return CustomNotificagtionList(
      leadingIconWidget: SvgPicture.asset(
        Asset.pointIcon,
        color: black,
      ),
      notificationList: thisWeekNotificationList,
    );
  }

  SliverToBoxAdapter _getThisWeekNotificationTitle(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Text(
          'This week',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  SliverToBoxAdapter _getTodayNotificationTitle(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Text(
          'Today',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  SliverToBoxAdapter _getNewNotificationsTitle(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Text(
          'New',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  CustomNotificagtionList _getTodayNotificationList() {
    return CustomNotificagtionList(
      leadingIconWidget: SvgPicture.asset(
        Asset.pointIcon,
        color: black,
      ),
      notificationList: todayNotificationList,
    );
  }

  CustomNotificagtionList _getNewNotificationList() {
    return CustomNotificagtionList(
      leadingIconWidget: SvgPicture.asset(
        Asset.pointIcon,
        color: pink,
      ),
      notificationList: newNotificationList,
    );
  }
}
