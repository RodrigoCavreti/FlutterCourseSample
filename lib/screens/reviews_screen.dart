import 'package:flutter/material.dart';
import 'package:skill_share_project/data/review.dart';
import 'package:skill_share_project/network/review_service.dart';
import 'package:skill_share_project/widgets/review_list_Item.dart';

// ignore: must_be_immutable
class ReviewsScreen extends StatelessWidget {
  static const routeName = '/reviews-screen';
  
  List<Review> _reviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () => {
              print("${_reviews[0].score}")
            },
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Review>>(
          future: fetchReviews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _reviews = snapshot.data;
              return ListView(
                itemExtent: 200,
                children:
                _reviews.map((element) => ReviewListItem(element)).toList(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
