import 'package:flutter/material.dart';
import '../styles/theme.dart';
import '../../features/bookSuggestions/presentation/add_book_suggestion.dart';

void showAddBookDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: CustomTheme.snowWhite,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Neues Buch hinzufügen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomTheme.darkMode,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewBookAdd()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: CustomTheme.snowWhite,
                onPrimary: CustomTheme.darkMode,
                side: const BorderSide(color: CustomTheme.lightGrey),
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Buch suchen oder scannen',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // navigiert zu Buch hinzufügen
              },
              style: ElevatedButton.styleFrom(
                primary: CustomTheme.snowWhite,
                onPrimary: CustomTheme.darkMode,
                side: const BorderSide(color: CustomTheme.lightGrey),
                elevation: 5,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Aus vorhandener Liste importieren',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Aktion für "Aus vorhandener Liste importieren"
              },
              style: ElevatedButton.styleFrom(
                primary: CustomTheme.lightGrey,
                onPrimary: CustomTheme.darkMode,
                side: const BorderSide(color: CustomTheme.lightGrey),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Abbrechen',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
