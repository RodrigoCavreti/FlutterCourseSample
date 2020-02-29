import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skill_share_project/data/review.dart';

Future<List<Review>> fetchReviews() async {
  final url = "https://skillshare-flutter.firebaseio.com/reviews.json";

  final response = await http.get(url);
  //final List<Review> reviews = [];

  switch(response.statusCode) {

    case 200:
      {
        final reviews = (json.decode(response.body) as List).map((i) => Review.fromJson(i)).toList();
        return reviews;
      }
      break;

    default:
      {
        throw Exception('Failed to load data');
      }
      break;
  }
}

