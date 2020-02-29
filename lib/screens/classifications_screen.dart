import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_share_project/data/classification.dart';
import 'package:skill_share_project/network/classification_service.dart';
import 'package:skill_share_project/widgets/classification_list_item.dart';

class ClassificationsScreen extends StatefulWidget {
  static const routeName = '/classifications-screen';

  @override
  State createState() {
    return _ClassificationScreenState();
  }
}

class _ClassificationScreenState extends State<ClassificationsScreen> {
  Future<List<Classification>> _futureClassifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: FutureBuilder<List<Classification>>(
        future: _futureClassifications,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ListView(
                children: snapshot.data
                    .map((element) => ClassificationListItem(element))
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _futureClassifications = fetchClassifications();
  }
}
