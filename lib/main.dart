import 'package:flutter/material.dart';
import 'secondpage/Patientinfopage.dart';
import './Welcomescreen.dart';

void main() {
  Future.delayed(const Duration(seconds: 8), () {
    runApp(Patientinfo());
  });
  runApp(const Welcomescreen());
}
