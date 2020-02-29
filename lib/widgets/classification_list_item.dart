
import 'package:flutter/material.dart';
import 'package:skill_share_project/data/classification.dart';

class ClassificationListItem extends StatelessWidget {

  final Classification classification;

  ClassificationListItem(this.classification);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 8, top: 8, bottom: 8),
        child: Column(
          children: [
            Row(
              children: [
                _loadImageByCategory(classification.category),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(classification.name, style: TextStyle(fontSize: 16),),
                ),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.grey[300],
            )
          ],
        ),
      ),
    );
  }

  Image _loadImageByCategory(String category) {

    switch(category) {

      case "bad": return Image.asset("assets/evil_face.png", width: 24, height: 24,);

      case "good": return Image.asset("assets/good_face.png", width: 24, height: 24,);

      default: return Image.asset("assets/good_face.png", width: 24, height: 24,);
    }
  }
}