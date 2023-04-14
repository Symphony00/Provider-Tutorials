import 'package:flutter/foundation.dart';

class SliderProvider with ChangeNotifier {
  double _slVal = 0;

  double get slVal => _slVal;

  void setSlVal(val) {
    _slVal = val;
    notifyListeners();
  }
}
