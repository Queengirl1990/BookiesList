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
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Newsletter abonnieren",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Switch(
                  value: _isSubscribed,
                  onChanged: (value) {
                    setState(() {
                      _isSubscribed = value;
                      if (_isSubscribed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Erfolgreich abonniert"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Newsletter abbestellt"),
                          ),
                        );
                      }
                    });
                  },
                  activeColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
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
