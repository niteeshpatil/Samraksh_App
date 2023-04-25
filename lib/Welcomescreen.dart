import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'loading Sreen',
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool _isWelcomeAnimated = false;
  bool _isinitdelay = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        _isinitdelay = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      setState(() {
        _isWelcomeAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(250, 83, 76, 129),
              Color.fromARGB(250, 96, 41, 106),
              Color.fromARGB(240, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(240, 0, 0, 0),
              Color.fromARGB(250, 96, 41, 106),
              Color.fromARGB(250, 83, 76, 129),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250.0),
                  _isinitdelay
                      ? AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              '',
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 243, 155, 83),
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CastoroTitling',
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 1000),
                          onFinished: () {
                            setState(() {
                              _isWelcomeAnimated = true;
                            });
                          },
                        )
                      : const SizedBox(),
                  const SizedBox(height: 200.0),
                  _isWelcomeAnimated
                      ? AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Samraksh',
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 243, 155, 83),
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CastoroTitling',
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 1000),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              top: 370,
              right: 0,
              child: Image.asset(
                'assets/images/app_logo.png',
                height: 100.0,
                width: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
