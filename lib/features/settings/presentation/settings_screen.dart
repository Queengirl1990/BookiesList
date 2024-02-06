import 'package:bookieslist/features/settings/presentation/agbs_screen.dart';
import 'package:bookieslist/features/settings/presentation/contact_support_screen.dart';
import 'package:bookieslist/features/settings/presentation/data_privacy_screen.dart';
import 'package:bookieslist/features/settings/presentation/impressum_screen.dart';
import 'package:bookieslist/features/settings/presentation/licenses_screen.dart';
import 'package:bookieslist/features/settings/presentation/newsletter_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../home/presentation/home_screen.dart';

//navigation noch unsauber bei Support und Impressum
// hintergrund implementierung überarbeiten AGB, Datenschutz, Lizenzen, Newsletter

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/agb': (context) => const AGBScreen(),
        '/support': (context) => const SupportScreen(),
        '/privacy': (context) => const PrivacyScreen(),
        '/impressum': (context) => const ImpressumScreen(),
        '/licenses': (context) => const LicensesScreen(),
        '/newsLetter': (context) => const NewsLetterScreen(),
      },
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
          child: const SettingsScreen(),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isSubscribed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Einstellungen",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'DancingScript',
              ),
            ),
            const SizedBox(height: 20),
            const MyDividerWithIcons(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/agb');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all(CustomTheme.snowWhite),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Center(
                child: Text(
                  "AGB",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/support');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all(CustomTheme.snowWhite),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Center(
                child: Text(
                  "Support",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/privacy');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all(CustomTheme.snowWhite),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Center(
                child: Text(
                  "Datenschutz",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/impresssum');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all(CustomTheme.snowWhite),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Center(
                child: Text(
                  "Impressum",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/licenses');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all(CustomTheme.snowWhite),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Center(
                child: Text(
                  "Lizenzen",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/newsLetter');
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all(CustomTheme.snowWhite),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Center(
                child: Text(
                  "Newsletter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
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
}
