import 'package:flutter/foundation.dart';

class CountAndTimeProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void addCount() {
    _count++;
    notifyListeners();
  }
}
