import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../backend/styles/theme.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: CustomTheme.darkRed,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/onboarding_book.png",
                height: 250,
              ),
              const SizedBox(height: 40),
              Image.asset(
                "assets/images/logo.png",
                height: 100,
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            "Verliere nie wieder die Übersicht",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'DancingScript',
                              fontSize: 24.0,
                              fontWeight: FontWeight.normal,
                              color: CustomTheme.snowWhite,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            "über deine Bücherstapel",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'DancingScript',
                              fontSize: 24.0,
                              fontWeight: FontWeight.normal,
                              color: CustomTheme.snowWhite,
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "● ",
                          style: TextStyle(
                              fontSize: 30, color: CustomTheme.lightGrey),
                        ),
                        Text(
                          "● ",
                          style: TextStyle(
                              fontSize: 30, color: CustomTheme.snowWhite),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const ProviderScope(child: OnBoardingScreen()));
}
