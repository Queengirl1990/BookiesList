import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../styles/theme.dart';

void showMoveBookDialog(
    BuildContext context, Function(String) onActionSelected) {
  Alert(
    context: context,
    title: "Buch verschieben",
    content: Column(
      children: [
        const Text("Wähle die Aktion:"),
        const SizedBox(height: 10),
        DropdownButton<String>(
          isExpanded: true,
          hint: const Text("Aktion auswählen"),
          items: [
            "Neue Liste anlegen",
            "Stapel ungelesener Bücher",
            "Gelesene Bücher",
            "Sonderband",
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? selectedAction) {
            if (selectedAction != null) {
              onActionSelected(selectedAction);
            }
          },
        ),
      ],
    ),
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        child: const Text(
          "Abbrechen",
          style: TextStyle(color: CustomTheme.snowWhite),
        ),
      ),
    ],
  ).show();
}
