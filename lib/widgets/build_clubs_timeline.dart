import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';

class BuildClubsTimeline extends StatelessWidget {
  final List<Room> rooms;
  const BuildClubsTimeline({Key? key, required this.rooms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle _headerStyle = Theme.of(context).textTheme.overline!.copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 0.8,
        color: Colors.grey[600]);
    Color? _textColor = Colors.grey[600];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Column(
            children: rooms
                .map((e) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: Text(
                                e.time,
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: _textColor,
                                    ),
                              ),
                            ),
                            flex: 1,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                e.club == ''
                                    ? SizedBox.shrink()
                                    : Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: e.club.toUpperCase(),
                                            style: _headerStyle),
                                        TextSpan(
                                            text: ' 🏚', style: _headerStyle)
                                      ])),
                                e.club == ''
                                    ? SizedBox.shrink()
                                    : SizedBox(
                                        height: 5,
                                      ),
                                Text(
                                  e.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: _textColor),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
