import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';
import 'package:flutter_clubhouse_ui/screens/room_screen.dart';
import 'package:flutter_clubhouse_ui/widgets/avatar_icon.dart';
import 'package:flutter_clubhouse_ui/widgets/icon_button.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';
import 'package:flutter_clubhouse_ui/data.dart' as data;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButtonW(
            icon: CupertinoIcons.search,
          ),
          elevation: 0,
          actions: [
            IconButtonW(
              icon: CupertinoIcons.envelope_open,
            ),
            IconButtonW(
              icon: CupertinoIcons.calendar,
            ),
            IconButtonW(
              icon: CupertinoIcons.bell,
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 20, 10),
                child: AvatarIconW(
                  user: data.currentUser,
                  size: 36,
                ),
              ),
            )
          ],
        ),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BuildClubsTimeline(
                  rooms: data.upcomingRoomsList,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 80),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (_) => Roomscreen(
                                currentUser: data.currentUser,
                                room: data.roomsList[index],
                              ))),
                      child: BuildRoomCards(room: data.roomsList[index]));
                }, childCount: data.roomsList.length)),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.secondary.withOpacity(0.0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      style: TextButton.styleFrom(
                          backgroundColor: Palette.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.add,
                        color: Theme.of(context).primaryColor,
                      ),
                      label: Text(
                        'Start a room ',
                        style: Theme.of(context).textTheme.button!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 38,
            right: 65,
            child: GestureDetector(
              onTap: () {},
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(CupertinoIcons.circle_grid_3x3_fill),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Palette.green),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
