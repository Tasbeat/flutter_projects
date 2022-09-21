import 'package:flutter/material.dart';
import 'package:instagram_clone/data/data.dart';
import 'package:instagram_clone/data/model/models.dart';

class CustomNotificagtionList extends StatelessWidget {
  final Widget leadingIconWidget;
  final List<Content> notificationList;
  const CustomNotificagtionList(
      {Key? key,
      required this.leadingIconWidget,
      required this.notificationList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
                        text: '${notificationList[index].profileId}  ',
                        style: const TextStyle(
                          fontFamily: 'GB',
                          fontSize: 12.0,
                        ),
                      ),
                      TextSpan(
                        text: notificationList[index].profileDescription,
                        style: const TextStyle(
                          color: grey,
                          fontFamily: 'GS',
                          fontSize: 12.0,
                        ),
                      ),
                      TextSpan(
                        text: notificationList[index].time,
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
              trailing: notificationList[index].holderWidget,
              leading: SizedBox(
                width: 48.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    leadingIconWidget,
                    const SizedBox(
                      width: 7.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image(
                        width: 35.0,
                        height: 35.0,
                        image: AssetImage(
                          notificationList[index].profileImageUrl,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        childCount: notificationList.length,
      ),
    );
  }
}
