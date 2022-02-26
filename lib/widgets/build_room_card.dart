import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

import '../data.dart';

class BuildRoomCards extends StatelessWidget {
  final Room room;
  const BuildRoomCards({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 3, offset: Offset(0, 2)),
          ],
          color: Theme.of(context).primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: room.club.toUpperCase() + ' 🏚',
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            letterSpacing: 1,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: room.name,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          letterSpacing: 1,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          shadows: [
                            Shadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 2)
                          ])),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Container(
                      height: 65,
                      child: Stack(
                        children: [
                          Positioned(
                            child: AvatarIconW(user: room.speakers[1]),
                            bottom: 0,
                            right: 0,
                          ),
                          AvatarIconW(user: room.speakers[0]),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...room.speakers
                            .map((e) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text.rich(TextSpan(
                                    children: [
                                      TextSpan(
                                          text: e.givenName +
                                              ' ' +
                                              e.familyName +
                                              ' ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[800],
                                                  overflow:
                                                      TextOverflow.ellipsis)),
                                      WidgetSpan(
                                        child: Icon(
                                          CupertinoIcons.chat_bubble_text,
                                          color: Colors.grey[600],
                                          size: 14,
                                        ),
                                      )
                                    ],
                                  )),
                                ))
                            .toList(),
                        SizedBox(
                          height: 5,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text:
                                    '${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                            WidgetSpan(
                                child: Icon(
                              CupertinoIcons.person_solid,
                              color: Colors.grey,
                              size: 16,
                            )),
                            TextSpan(text: ' / ${room.speakers.length} '),
                            WidgetSpan(
                                child: Icon(
                              CupertinoIcons.chat_bubble_fill,
                              color: Colors.grey,
                              size: 16,
                            )),
                          ]),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
