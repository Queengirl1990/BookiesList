import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/widgets/randome_generator.dart';
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
          decoration: CustomTheme.getBackgroundGradient(),
          child: const BookSuggestionScreen(),
        ),
      ),
    );
  }
}

class BookSuggestionScreen extends StatefulWidget {
  const BookSuggestionScreen({Key? key}) : super(key: key);

  @override
  _BookSuggestionScreenState createState() => _BookSuggestionScreenState();
}

class _BookSuggestionScreenState extends State<BookSuggestionScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            myCircularAvatar(),
          ],
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
                "Deine Vorschläge",
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
      body: Container(
        child: Center(
          child: SizedBox(
            width: 320,
            child: ListView.builder(
              itemCount: bookSuggestion.length,
              itemBuilder: (context, index) {
                final bookData = bookSuggestion[index];
                final bookTitle = bookData.title;
                final bookAuthor = bookData.author;
                final bookGenre = bookData.genre;
                final bookYear = bookData.year;
                final bookImage = bookData.image;
                final bookBlurb = bookData.blurb;

                return Column(
                  children: [
                    const MyDividerWithIcons(),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              Image.asset(bookImage, width: 100, height: 150),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookTitle,
                                style: const TextStyle(
                                  fontFamily: 'DancingScript',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: CustomTheme.snowWhite,
                                ),
                              ),
                              Text(
                                'Autor: $bookAuthor',
                                style: const TextStyle(
                                  color: CustomTheme.snowWhite,
                                ),
                              ),
                              Text(
                                'Genre: $bookGenre',
                                style: const TextStyle(
                                  color: CustomTheme.snowWhite,
                                ),
                              ),
                              Text(
                                'Veröffentlichung: $bookYear',
                                style: const TextStyle(
                                  color: CustomTheme.snowWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        bookBlurb,
                        style: const TextStyle(
                          color: CustomTheme.snowWhite,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Funktion
                      },
                      style: ElevatedButton.styleFrom(
                        onPrimary: CustomTheme.darkMode,
                        primary: CustomTheme.snowWhite,
                        elevation: 5,
                      ),
                      child: const Text("Auswählen"),
                    ),
                  ],
                );
              },
            ),
          ),
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
