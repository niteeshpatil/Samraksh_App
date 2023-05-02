import 'package:flutter/material.dart';
import 'secondpage/Patientinfopage.dart';
import './Welcomescreen.dart';

void main() {
  Future.delayed(const Duration(seconds: 5), () {
    runApp(Patientinfo());
  });
  runApp(const Welcomescreen());
}
