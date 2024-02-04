import 'package:flutter/material.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/showDialog.dart'; //showDialog-Datei
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/libary/unread_books_datenbank.dart'; //buchdaten

void main() {
  runApp(const GiveAwayScreen());
}

class GiveAwayScreen extends StatelessWidget {
  const GiveAwayScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Give Away Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: CustomTheme.darkRed,
        ),
      ),
      home: const GiveAwayPage(),
    );
  }
}

class GiveAwayPage extends StatefulWidget {
  const GiveAwayPage({Key? key});

  @override
  _GiveAwayPageState createState() => _GiveAwayPageState();
}

class _GiveAwayPageState extends State<GiveAwayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Verschenken",
          style: TextStyle(
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: CustomTheme.snowWhite,
          ),
        ),
        backgroundColor: CustomTheme.darkRed,
        elevation: 0,
        leading: IconButton(
          color: CustomTheme.snowWhite,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          myCircularAvatar(),
        ],
      ),
      backgroundColor: CustomTheme.darkRed,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 80 / 100,
        ),
        itemCount: giveAway.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                showAddBookDialog(
                    context); // Verwende die Funktion aus der separaten Datei
              },
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
            final bookKey = giveAway.keys.elementAt(index - 1);
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
                    giveAway[bookKey]!['image']!,
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
