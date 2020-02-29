import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:skill_share_project/data/review.dart';

class ReviewListItem extends StatefulWidget {
  final Review review;

  ReviewListItem(this.review);

  @override
  State createState() {
    return _ReviewsListItemState(review);
  }
}

class _ReviewsListItemState extends State<ReviewListItem> {
  final Review review;

  _ReviewsListItemState(this.review);

  var _badScoreButtonColor = Colors.red;
  var _mediumScoreButtonColor = Colors.yellow;
  var _goodScoreButtonColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
          width: double.infinity,
          height: 200,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(review.imageUrl),
                        maxRadius: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          review.name,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: RatingBar.readOnly(
                          filledColor: Colors.amber,
                          initialRating: review.rating,
                          isHalfAllowed: true,
                          halfFilledIcon: Icons.star_half,
                          filledIcon: Icons.star,
                          emptyIcon: Icons.star_border,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: Text(
                    review.comment,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RawMaterialButton(
                      onPressed: () => {
                        setState(() {
                          review.score = 0.0;
                          _mediumScoreButtonColor = Colors.grey;
                          _goodScoreButtonColor = Colors.grey;
                          _badScoreButtonColor = Colors.red;
                        })
                      },
                      child: Icon(
                        Icons.tag_faces,
                        color: _badScoreButtonColor,
                        size: 36,
                      ),
                      constraints: BoxConstraints(
                          minWidth: 36,
                          maxWidth: 36,
                          maxHeight: 36,
                          minHeight: 36),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () => {
                        setState(() {
                          review.score = 0.5;
                          _badScoreButtonColor = Colors.grey;
                          _goodScoreButtonColor = Colors.grey;
                          _mediumScoreButtonColor = Colors.yellow;
                        })
                      },
                      child: Icon(
                        Icons.tag_faces,
                        color: _mediumScoreButtonColor,
                        size: 36,
                      ),
                      constraints: BoxConstraints(
                          minWidth: 36,
                          maxWidth: 36,
                          maxHeight: 36,
                          minHeight: 36),
                      shape: CircleBorder(),
                    ),
                    RawMaterialButton(
                      onPressed: () => {
                        setState(() {
                          review.score = 1.0;
                          _badScoreButtonColor = Colors.grey;
                          _mediumScoreButtonColor = Colors.grey;
                          _goodScoreButtonColor = Colors.green;
                        })
                      },
                      child: Icon(
                        Icons.tag_faces,
                        color: _goodScoreButtonColor,
                        size: 36,
                      ),
                      constraints: BoxConstraints(
                          minWidth: 36,
                          maxWidth: 36,
                          maxHeight: 36,
                          minHeight: 36),
                      shape: CircleBorder(),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
