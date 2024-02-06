import 'package:bookieslist/features/currentlyBook/presentation/currently_reading_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/widgets/bookInfoContainer.dart';
import '../../profil/presentation/profile_screen.dart';

import '../../../backend/styles/theme.dart';
import '../../unreadBooks/presentation/sub_screen.dart';
import '../../unreadBooks/presentation/give_away_screen.dart';
import '../../unreadBooks/presentation/limited_edition_screen.dart';
import '../../unreadBooks/presentation/new_list_screen.dart';
import '../../unreadBooks/presentation/wishlist_screen.dart';
import '../../randomegenerator/presentation/randome_generator_screen.dart';
import '../../settings/presentation/settings_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            CustomTheme.loginGradientStart,
            CustomTheme.loginGradientEnd,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/unreadBooks': (context) => const UnreadBooksApp(),
          '/wishList': (context) => const WishListScreen(),
          '/limitedEdition': (context) => const LimitedEditionScreen(),
          '/giveAway': (context) => const GiveAwayScreen(),
          '/newList': (context) => const NewListScreen(),
          '/randomGenerator': (context) => const RandomGeneratorScreen(),
          '/currentlyReading': (context) => const CurrentlyReadingScreen(),
          // '/settings': (context) => const SettingsScreen(),
        },
        theme: ThemeData.light().copyWith(
          primaryColor: CustomTheme.darkRed,
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyProfilPage()),
              );
            },
            child: myCircularAvatar(),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        index: currentPageIndex,
        backgroundColor: Colors.transparent,
        color: CustomTheme.darkMode,
        buttonBackgroundColor: CustomTheme.darkMode,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
            switch (index) {
              case 0:
                // Home Icon - Zu HomeScreen navigieren
                Navigator.pushNamed(context, '/');
                break;
              case 1:
                // Menu Book - Zu UnreadBooks navigieren
                Navigator.pushNamed(context, '/unreadBooks');
                break;
              case 2:
                // Settings - Zum SettingsScreen navigieren
                Navigator.pushNamed(context, '/settings');
                break;
              case 3:
                // Help Outline - Zum RandomGeneratorScreen navigieren
                Navigator.pushNamed(context, '/randomGenerator');
                break;
            }
          });
        },
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.menu_book, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
          Icon(Icons.help_outline, size: 30, color: Colors.white),
        ],
      ),
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              CustomTheme.loginGradientStart,
              CustomTheme.loginGradientEnd
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            stops: <double>[0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          "Aktueller Lesestoff",
                          style: TextStyle(
                            fontFamily: 'DancingScript',
                            fontWeight: FontWeight.normal,
                            fontSize: 26,
                            color: CustomTheme.snowWhite,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CurrentlyInfoContainer(
                        bookProgress: 0.5, // Dummy-Wert
                        onUpdatePressed: () {}, // Dummy-Funktion
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    buttonMinWidth: 320,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/unreadBooks');
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Center(
                          child: Text(
                            "Stapel ungelesener Bücher",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/wishList');
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Center(
                          child: Text(
                            "Wunschliste",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/limitedEdition');
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Center(
                          child: Text(
                            "Sonderband",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/giveAway');
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          foregroundColor:
                              MaterialStateProperty.all(CustomTheme.darkMode),
                        ),
                        child: const Center(
                          child: Text(
                            "Verschenken",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/newList');
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          foregroundColor:
                              MaterialStateProperty.all(CustomTheme.darkMode),
                        ),
                        child: const Center(
                          child: Text(
                            "Neue Liste anlegen",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/randomGenerator');
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                          foregroundColor:
                              MaterialStateProperty.all(CustomTheme.darkMode),
                        ),
                        child: const Center(
                          child: Text(
                            "Zufallsgenerator",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
