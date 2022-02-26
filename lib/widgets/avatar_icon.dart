import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';

class AvatarIconW extends StatelessWidget {
  final User user;
  final double size;
  final int ver;
  final bool isnew;
  final bool micOff;
  const AvatarIconW(
      {required this.user,
      this.size = 48,
      this.ver = 1,
      Key? key,
      this.isnew = false,
      this.micOff = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ver == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.network(
          user.imageUrl,
          width: size,
          height: size,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.imageUrl),
                radius: size,
              ),
              isnew
                  ? Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 0))
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Center(child: Text('🎉'))),
                    )
                  : SizedBox.shrink(),
              micOff
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 0))
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Icon(CupertinoIcons.mic_slash_fill))),
                    )
                  : SizedBox.shrink()
            ]),
            SizedBox(
              height: 5,
            ),
            Text(
              '${user.givenName}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.grey[600]),
            ),
          ],
        ),
      );
    }
  }
}
