import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

import '../data.dart';

class Roomscreen extends StatefulWidget {
  final User currentUser;
  final Room room;
  const Roomscreen({Key? key, required this.currentUser, required this.room})
      : super(key: key);

  @override
  _RoomscreenState createState() => _RoomscreenState();
}

class _RoomscreenState extends State<Roomscreen> {
  static Color _color = Colors.black87.withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: Container(
          width: 50,
          child: TextButton.icon(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                CupertinoIcons.chevron_down,
                color: _color,
              ),
              label: Text(
                'All rooms',
                style: TextStyle(color: _color, fontWeight: FontWeight.bold),
              )),
        ),
        elevation: 0,
        actions: [
          IconButtonW(
            icon: CupertinoIcons.doc,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 20, 10),
              child: AvatarIconW(
                user: currentUser,
                size: 36,
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.room.club.toUpperCase() + ' 🏚',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(fontSize: 14)),
                  IconButtonW(icon: CupertinoIcons.ellipsis)
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Text(widget.room.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            SliverGrid.count(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                children: widget.room.speakers
                    .map(
                      (e) => AvatarIconW(
                        user: e,
                        ver: 2,
                        isnew: Random().nextBool(),
                        micOff: Random().nextBool(),
                      ),
                    )
                    .toList()),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Followed by speakers',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey[500], fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverGrid.count(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                children: widget.room.followedBySpeakers
                    .map(
                      (e) => AvatarIconW(
                        user: e,
                        ver: 2,
                        isnew: Random().nextBool(),
                      ),
                    )
                    .toList()),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Others in room',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey[500], fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SliverGrid.count(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                children: widget.room.others
                    .map(
                      (e) => AvatarIconW(
                        user: e,
                        ver: 2,
                        isnew: Random().nextBool(),
                      ),
                    )
                    .toList()),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 60,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  '✌ Leave quietly',
                  style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: Colors.black87,
                      size: 32,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[300], shape: BoxShape.circle),
                    child: Icon(
                      CupertinoIcons.hand_raised,
                      color: Colors.black87,
                      size: 32,
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
