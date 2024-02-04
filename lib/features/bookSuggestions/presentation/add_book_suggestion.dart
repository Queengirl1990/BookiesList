import 'package:bookieslist/backend/styles/theme.dart';
import 'package:bookieslist/backend/widgets/bookieslist_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../../../backend/styles/appbar.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewBookAdd(),
    );
  }
}

class NewBookAdd extends StatefulWidget {
  @override
  _NewBookAddState createState() => _NewBookAddState();
}

class _NewBookAddState extends State<NewBookAdd> {
  TextEditingController _searchController = TextEditingController();
  List<BookInfo> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.darkRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: CustomTheme.snowWhite),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          myCircularAvatar(),
        ],
      ),
      backgroundColor: CustomTheme.darkRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Neues Buch hinzufügen",
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.normal,
              fontSize: 24,
              color: CustomTheme.snowWhite,
            ),
          ),
          const SizedBox(height: 20),
          const MyDividerWithIcons(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(color: CustomTheme.snowWhite),
                    decoration: InputDecoration(
                      hintText: 'Suche nach Büchern...',
                      hintStyle: const TextStyle(color: CustomTheme.snowWhite),
                      filled: true,
                      fillColor: CustomTheme.snowWhite.withOpacity(0.2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                    ),
                    onChanged: (value) {
                      // Eingabe verarbeiten
                    },
                    onSubmitted: (value) {
                      _searchBooks();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: CustomTheme.snowWhite),
                  onPressed: () {
                    // Suche starten
                    _searchBooks();
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                final BookInfo result = _searchResults[index];
                return ListTile(
                  leading: result.thumbnailUrl != null
                      ? Image.network(
                          result.thumbnailUrl!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : const SizedBox.shrink(),
                  title: Text(result.title,
                      style: const TextStyle(color: CustomTheme.snowWhite)),
                  // Hier können Sie die Suchergebnisse in der Liste darstellen
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _searchBooks() async {
    if (_searchController.text.isEmpty) {
      return;
    }

    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/books/v1/volumes?q=${_searchController.text}'),
    );

    if (response.statusCode == 200) {
      // Hier können Sie die Suchergebnisse verarbeiten
      List<BookInfo> searchResults =
          (json.decode(response.body)['items'] as List)
              .map((book) => BookInfo.fromApi(book))
              .take(5) // Begrenzen Sie die Anzahl der angezeigten Ergebnisse
              .toList();

      setState(() {
        _searchResults = searchResults;
      });
    } else {
      throw Exception('Failed to load books');
    }
  }
}

class BookInfo {
  final String title;
  final String? thumbnailUrl;

  BookInfo({required this.title, this.thumbnailUrl});

  factory BookInfo.fromApi(Map<String, dynamic> json) {
    return BookInfo(
      title: json['volumeInfo']['title'] as String,
      thumbnailUrl: json['volumeInfo']['imageLinks']?['thumbnail'] as String?,
    );
  }
}
