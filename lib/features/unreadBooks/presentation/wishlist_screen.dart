import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/libary/unread_books_datenbank.dart';
import '../../home/presentation/home_screen.dart';

void main() {
  runApp(const WishListApp());
}

class WishListApp extends StatelessWidget {
  const WishListApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wish List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: CustomTheme.darkRed,
        ),
      ),
      home: const WishListScreen(),
    );
  }
}

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key});

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  void addNewBook() {
    // Buch hinzufügen
  }

  bool _showShimmer = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted) {
        setState(() {
          _showShimmer = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: _showShimmer
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[300]!,
                    Colors.grey[100]!,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              )
            : CustomTheme.getBackgroundGradient(),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                "Wunschliste",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  // Zurücknavigieren
                },
              ),
              actions: [
                myCircularAvatar(),
                const SizedBox(width: 16),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 80 / 100,
                ),
                itemCount: wishList.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return GestureDetector(
                      onTap: addNewBook,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: CustomTheme.loginGradientStart,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.0,
                          ),
                        ),
                        child: const SizedBox(
                          width: 80,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.white,
                              ),
                              Text(
                                "Neues Buch hinzufügen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    final bookKey = wishList.keys.elementAt(index - 1);
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: SizedBox(
                          width: 80,
                          height: 100,
                          child: _showShimmer
                              ? Shimmer.fromColors(
                                  baseColor: Colors.transparent,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 80,
                                    height: 100,
                                    color: CustomTheme.darkRed,
                                  ),
                                )
                              : Image.asset(
                                  wishList[bookKey]!['image']!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: CustomTheme.loginGradientStart,
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
