import 'dart:math';
import 'package:flutter/material.dart';

class FetchProvider extends ChangeNotifier {
  int rnum = 0;

  int get randomNumber => rnum;

  // Method to generate a random number
  void generateRandomNumber() {
    rnum = Random().nextInt(10) + 1;
    notifyListeners();
  }
}
