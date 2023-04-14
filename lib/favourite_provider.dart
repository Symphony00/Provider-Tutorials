import 'package:flutter/material.dart';

class FavouriteProviderClass with ChangeNotifier {
  List<int> _favouriteList = [];

  List<int> get favouriteList => _favouriteList;

  void addIntoList(val) {
    favouriteList.add(val);
    notifyListeners();
  }

  void removeFromList(val) {
    favouriteList.remove(val);
    notifyListeners();
  }
}
