import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String routeName;
  final IconData image;

  MenuItem(this.title, this.subTitle, this.routeName, this.image);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(image, size: 24),
              title: Text(title),
              subtitle: Text(subTitle),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
      },
    );
  }
}