import 'dart:async';

import 'package:flutter/material.dart';

class CharacterNotifier extends ChangeNotifier {
  static CharacterNotifier? _instance;

  CharacterNotifier._private();

  static CharacterNotifier get instance =>
      _instance ??= CharacterNotifier._private();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setIsLoading(bool value, {bool shouldNotify = true}) {
    _isLoading = value;
    notifyListeners();
  }

  ///Used for better user experience to know when to focus/unfocus and similiar things
  bool isSearchActive = false;

  ///Search controller for the search field
  TextEditingController searchController = TextEditingController();

  ///Focus node for the search field
  FocusNode searchFocusNode = FocusNode();

  ///Sets the value of the isSearchActive variable to the provided value
  void setSearchActive(bool value) {
    isSearchActive = value;
    notifyListeners();
  }

  ///Used for rebuilding when searching
  void resetState() {
    notifyListeners();
  }

  List<dynamic> _allCharacters = []; // Separate list to store all characters

  int _currentPage = 1;

  int get currentPage => _currentPage;

  Future<void> loadMoreCharacters() async {
    // Increment the page number and notify listeners
    _currentPage++;
    notifyListeners();
  }
}
