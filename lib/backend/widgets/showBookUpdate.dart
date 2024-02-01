import '../styles/theme.dart';
import 'package:flutter/material.dart';

void showBookUpdate(BuildContext context, double bookProgress,
    void Function(String) showUpdateToast) {
  TextEditingController progressController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Lesefortschritt aktualisieren'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aktueller Lesefortschritt: ${(bookProgress * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            TextField(
              controller: progressController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Neuer Lesefortschritt'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Abbrechen',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showUpdateToast(progressController.text);
            },
            style: ElevatedButton.styleFrom(
              primary: CustomTheme.darkRed,
            ),
            child: const Text(
              'Aktualisieren',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
