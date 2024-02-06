import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../home/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

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
          child: const LicensesScreen(),
        ),
      ),
    );
  }
}

class LicensesScreen extends StatefulWidget {
  const LicensesScreen({Key? key}) : super(key: key);

  @override
  _LicensesScreenState createState() => _LicensesScreenState();
}

class _LicensesScreenState extends State<LicensesScreen> {
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
              "Lizenzen",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLicenseEntry(
                    "curved_navigation_bar - 0.3.6",
                    "MIT License",
                    "https://github.com/bkdev98/curved_navigation_bar/blob/master/LICENSE",
                  ),
                  buildLicenseEntry(
                    "google_fonts - 2.1.0",
                    "Apache License 2.0",
                    "https://github.com/material-foundation/google-fonts-flutter/blob/master/LICENSE",
                  ),
                  buildLicenseEntry(
                    "percent_indicator - 3.0.1+2",
                    "MIT License",
                    "https://github.com/diegoveloper/flutter_percent_indicator/blob/master/LICENSE",
                  ),
                  // Add more license entries here
                ],
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

  Widget buildLicenseEntry(
      String packageName, String licenseType, String licenseUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            packageName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            "Lizenz: $licenseType",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          TextButton(
            onPressed: () {
              // mehr
            },
            child: Text(
              licenseUrl,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
