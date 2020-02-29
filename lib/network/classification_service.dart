import 'dart:convert';
import 'package:skill_share_project/utils/constants.dart' as Constants;
import 'package:skill_share_project/data/classification.dart';
import 'package:http/http.dart' as http;
import 'package:skill_share_project/data/enums/request_status.dart';

Future<RequestStatus> createClassification(
    Classification classification) async {
  final http.Response response = await http.post(
    "${Constants.BASE_URL}classifications.json",
    body: jsonEncode(<String, String>{
      'category': classification.category,
      'name': classification.name
    }),
  );

  if (response.statusCode == 200)
    return RequestStatus.success;
  else
    return RequestStatus.error;
}

Future<List<Classification>> fetchClassifications() async {
  final url = "${Constants.BASE_URL}classifications.json";

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final classifications = (jsonDecode(response.body) as List)
        .map((i) => Classification.fromJson(i))
        .toList();
    return classifications;
  } else {
    throw Exception('Failed to load data');
  }
}
