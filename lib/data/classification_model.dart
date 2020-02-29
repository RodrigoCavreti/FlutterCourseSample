import 'package:flutter/foundation.dart';
import 'package:skill_share_project/data/classification.dart';

class ClassificationModel extends ChangeNotifier {

  final List<Classification> _list = [];

  void add(Classification classification) {
    _list.add(classification);

    notifyListeners();
  }

  List<Classification> get() {
    return _list;
  }

}