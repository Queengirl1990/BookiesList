import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shimmer/shimmer.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/libary/read_books_datenbank.dart';
import '../../home/presentation/home_screen.dart';

void main() {
  runApp(const ReadBooksApp());
}

class ReadBooksApp extends StatelessWidget {
  const ReadBooksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Read Books App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const ReadBooksScreen(),
    );
  }
}

class ReadBooksScreen extends StatefulWidget {
  const ReadBooksScreen({Key? key}) : super(key: key);

  @override
  _ReadBooksScreenState createState() => _ReadBooksScreenState();
}

class _ReadBooksScreenState extends State<ReadBooksScreen> {
  int currentPageIndex = 1;
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

  void addNewBook() {
    // navigation einbauen zu entsprechendem screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: CustomTheme.getBackgroundGradient(),
        child: Column(
          children: [
            AppBar(
              title: const Text(
                "Gelesene Bücher",
                style: TextStyle(
                  color: CustomTheme.snowWhite,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                color: CustomTheme.snowWhite,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Zurücknavigieren
                },
              ),
              actions: [
                myCircularAvatar(),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 80 / 100,
                ),
                itemCount: readBooksList.length + 1,
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
                                color: CustomTheme.snowWhite,
                              ),
                              Text(
                                "Neues Buch hinzufügen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: CustomTheme.snowWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    final bookKey = readBooksList.keys.elementAt(index - 1);
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
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    width: 80,
                                    height: 100,
                                    color: CustomTheme.darkRed,
                                  ),
                                )
                              : Image.asset(
                                  readBooksList[bookKey]!['image']!,
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
        index: currentPageIndex,
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
