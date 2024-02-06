import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../home/presentation/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.getAppTheme(),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                CustomTheme.loginGradientStart,
                CustomTheme.loginGradientEnd,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const PrivacyScreen(),
        ),
      ),
    );
  }
}

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  _PrivacyScreenState createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool shareList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: buildCustomAppBar(),
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Datenschutz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'DancingScript',
              ),
            ),
            const SizedBox(height: 20),
            const MyDividerWithIcons(),
            const SizedBox(height: 20),
            Container(
              width: 320,
              child: const Text(
                "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        backgroundColor: Colors.transparent,
        color: CustomTheme.darkMode,
        buttonBackgroundColor: CustomTheme.darkMode,
        onTap: (int index) {
          if (index == 0) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false,
            );
          }
        },
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.menu_book, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
          Icon(Icons.help_outline, size: 30, color: Colors.white),
        ],
      ),
    );
  }

  Widget buildCustomAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Row(
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            myCircularAvatar(),
          ],
        ),
      ],
    );
  }
}
