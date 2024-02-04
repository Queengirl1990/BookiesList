import 'package:flutter/material.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/widgets/randome_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BookSuggestionScreen(),
    );
  }
}

class BookSuggestionScreen extends StatefulWidget {
  const BookSuggestionScreen({super.key});

  @override
  _BookSuggestionScreenState createState() => _BookSuggestionScreenState();
}

class _BookSuggestionScreenState extends State<BookSuggestionScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.darkRed,
        elevation: 0,
        leading: IconButton(
          color: CustomTheme.snowWhite,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Zurücknavigieren
          },
        ),
        title: const Text(
          'Deine Vorschläge',
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        actions: [
          myCircularAvatar(),
        ],
      ),
      backgroundColor: CustomTheme.darkRed,
      body: Center(
        child: SizedBox(
          width: 320,

          //auswahl aus 3 Büchern
          //könnte man noch auslagern
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
                        child: Image.asset(bookImage, width: 100, height: 150),
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
                      // funktion
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: CustomTheme.darkMode,
                      backgroundColor: CustomTheme.snowWhite,
                      elevation: 5,
                    ),
                    child: const Text("Auswählen"),
                    //auswahllogik
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
