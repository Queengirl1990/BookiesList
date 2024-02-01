import 'package:flutter/material.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/libary/unread_books_datenbank.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/widgets/showDialog.dart';

void main() {
  runApp(const LimitedEdition());
}

class LimitedEdition extends StatelessWidget {
  const LimitedEdition({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Limited Edition',
      theme: ThemeData(
        backgroundColor: CustomTheme.darkRed,
      ),
      home: const LimitedEditionScreen(),
    );
  }
}

class LimitedEditionScreen extends StatefulWidget {
  const LimitedEditionScreen({Key? key});

  @override
  _LimitedEditionScreenState createState() => _LimitedEditionScreenState();
}

class _LimitedEditionScreenState extends State<LimitedEditionScreen> {
  void addNewBook() {
    // neues Buch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: CustomTheme.snowWhite,
          onPressed: () {
            // Pfad
          },
        ),
        title: const Text(
          "Limited Edition",
          style: TextStyle(
            color: CustomTheme.snowWhite,
            fontFamily: 'DancingScript',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          myCircularAvatar(),
        ],
        backgroundColor: CustomTheme.darkRed,
        elevation: 0,
      ),
      backgroundColor: CustomTheme.darkRed,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //Raster
          crossAxisCount: 3,
          childAspectRatio: 80 / 100,
        ),
        itemCount: limitedEdition.length + 1,
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
            final bookKey = limitedEdition.keys.elementAt(index - 1);
            return GestureDetector(
              onTap: () {
                showAddBookDialog(context);
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                child: SizedBox(
                  width: 80,
                  height: 100,
                  child: Image.asset(
                    limitedEdition[bookKey]!['image']!,
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
