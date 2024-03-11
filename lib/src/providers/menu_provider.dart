import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {

  int _selectedItem = 0;
  bool _showMenu = true;

  int   get selectedItem  => _selectedItem;
  bool  get showMenu => _showMenu;

  set selectedItem(int index) {
    _selectedItem = index;
    notifyListeners();
  }

  set showMenu(bool showMenu) {
    _showMenu = showMenu;
    notifyListeners();
  }
}