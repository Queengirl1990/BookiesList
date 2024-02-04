import 'package:flutter/material.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/libary/unread_books_datenbank.dart';

//liste Teilen funktion einbauen

void main() {
  runApp(const WishListApp());
}

class WishListApp extends StatelessWidget {
  const WishListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wish List App',
      theme: ThemeData(
        backgroundColor: CustomTheme.darkRed,
      ),
      home: const WishListScreen(),
    );
  }
}

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  void addNewBook() {
    // buch hinzufügen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wunschliste",
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CustomTheme.snowWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: CustomTheme.snowWhite,
          onPressed: () {
            // pfad
          },
        ),
        actions: [
          myCircularAvatar(),
          const SizedBox(width: 16),
        ],
        backgroundColor: CustomTheme.darkRed,
        elevation: 0,
      ),
      backgroundColor: CustomTheme.darkRed,
      body: GridView.builder(
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
                  color: CustomTheme.darkRed,
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
                  child: Image.asset(
                    wishList[bookKey]!['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
