import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/libary/read_books_datenbank.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../readBooks/presentation/read_books_screen.dart';
import 'edit_profile_screen.dart';
import 'your_genres_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const MyProfilPage(),
        '/editProfile': (context) => const EditProfilScreen(),
        '/readBooks': (context) => const ReadBooksScreen(),
        '/yourGenres': (context) => const YourGenresScreen(),
      },
      theme: CustomTheme.getAppTheme(),
      home: Container(
        decoration: CustomTheme.getBackgroundGradient(),
        child: const MyProfilPage(),
      ),
    );
  }
}

class MyProfilPage extends StatefulWidget {
  const MyProfilPage({Key? key}) : super(key: key);

  @override
  _MyProfilPageState createState() => _MyProfilPageState();
}

class _MyProfilPageState extends State<MyProfilPage> {
  int currentPageIndex = 0; // Variable für die aktuelle Seite

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [],
          title: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: CustomTheme.snowWhite,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 8),
              const Text(
                "Mein Profil",
                style: TextStyle(
                  color: CustomTheme.snowWhite,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const MyCircularAvatar(),
              const SizedBox(height: 20),
              const Text(
                "Queengirl",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomTheme.snowWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Bearbeiten",
                  style: TextStyle(
                    color: CustomTheme.darkMode,
                  ),
                ),
              ),
              const MyDividerWithIcons(),
              const SizedBox(height: 10),
              const Text(
                "Schau dir mal wieder deine Lieblinge an",
                style: TextStyle(
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: CustomTheme.snowWhite,
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: bookInfoMap.length,
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 0.4,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final bookInfo = bookInfoMap.values.elementAt(index);
                  final imagePath = bookCoverAssets[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        _showImageDialog(context, bookInfo, imagePath);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 130,
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReadBooksScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                      ),
                      side: BorderSide(color: CustomTheme.snowWhite),
                    ),
                    elevation: 10,
                  ),
                  child: const Text(
                    "Gelesene Bücher",
                    style: TextStyle(color: CustomTheme.darkMode),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const YourGenresScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(20),
                      ),
                      side: BorderSide(color: CustomTheme.snowWhite),
                    ),
                    elevation: 10,
                  ),
                  child: const Text(
                    "Deine Genres",
                    style: TextStyle(color: CustomTheme.darkMode),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
    );
  }

  void _showImageDialog(
      BuildContext context, BookInfo bookInfo, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Text('Titel: ${bookInfo.title}'),
              Text('Autor: ${bookInfo.author}'),
              Text('Genre: ${bookInfo.genre}'),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomTheme.darkRed,
                elevation: 5,
              ),
              child: Text(
                bookInfo.buttonLabel,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Schließen',
                style: TextStyle(color: CustomTheme.darkRed),
              ),
            ),
          ],
        );
      },
    );
  }
}
