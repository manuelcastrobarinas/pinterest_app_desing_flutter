import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {

  int _selectedItem = 0;
  int get selectedItem  => _selectedItem;
  
  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }
}