import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookInfoContainer.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/styles/appbar.dart';
import '../../profil/presentation/profile_screen.dart';
import '../../../backend/widgets/showBookUpdate.dart';

class CurrentlyReadingScreen extends StatefulWidget {
  const CurrentlyReadingScreen({Key? key}) : super(key: key);

  @override
  _CurrentlyReadingScreenState createState() => _CurrentlyReadingScreenState();
}

class _CurrentlyReadingScreenState extends State<CurrentlyReadingScreen> {
  double rating = 0.0;

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  void _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rating = prefs.getDouble('rating') ?? 0.0;
    });
  }

  void _saveRating(double newRating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('rating', newRating);
  }

  double bookProgress = 0.85;

  void showMoveBookDialog() {
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
                bookMoved(selectedAction);
              }
              Navigator.pop(context);
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

  void bookMoved(String destination) {
    print("Buch wurde in $destination verschoben");
  }

  void showBookUpdateDialog() {
    _showBookUpdateDialog();
  }

  void _showBookUpdateDialog() {
    showBookUpdate(context, bookProgress, showBookUpdateToast);
  }

  void showBookUpdateToast(String progress) {
    print('Lesefortschritt aktualisiert: $progress');
  }

  void showDeleteWarningDialog() {
    Alert(
      context: context,
      title: "Buch löschen",
      desc:
          "Achtung, du bist dabei dein Buch zu löschen. Beim Löschen gehen auch alle Lesefortschrittsdaten verloren.",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Abbrechen",
            style: TextStyle(color: CustomTheme.snowWhite),
          ),
        ),
        DialogButton(
          onPressed: () {
            // Hier die Aktion für das tatsächliche Löschen einfügen
            Navigator.pop(context);
          },
          color: CustomTheme.darkRed,
          child: const Text(
            "Löschen",
            style: TextStyle(color: CustomTheme.snowWhite),
          ),
        ),
      ],
    ).show();
  }

  int currentPageIndex =
      0; // Hinzufügen des Index für die aktuelle Seite im bottomNavigationBar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Aktueller Lesestoff",
              style: TextStyle(
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.normal,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const MyDividerWithIcons(),
            const SizedBox(height: 20),
            Container(
              child: bookInfoContainer(bookProgress, showBookUpdateDialog),
            ),
            const SizedBox(height: 20),
            Center(
              child: RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30.0,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: CustomTheme.guelden,
                ),
                onRatingUpdate: (rating) {
                  _saveRating(rating);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fortsetzung der fantastischen Saga um Wicca, Hexen und Strigoi\n\nDie Große Göttin gibt uns nur das, wofür wir auch zu kämpfen bereit sind. Valea hat ihr Bestes gegeben, um den Prinzipien der Wicca treu zu bleiben. Sie hat gekämpft, ihr wurde das Herz gebrochen und sie verlor mehr, als sie ertragen konnte. Doch nun sind fast zwei Jahre seit den verheerenden Ereignissen in Ardeal vergangen. Zwei Jahre, in denen sie sich in der Welt der Menschen versteckt und gehofft hat, dass niemand sie findet. Aber manche Hoffnungen erfüllen sich nicht. Und jetzt stehen alte Freunde vor ihrer Tür und bitten sie, um ihre Hilfe. Sie muss sich entscheiden, ob sie ihren Zorn hinter sich lässt, um gemeinsam mit denen zu kämpfen, die sie im Stich gelassen und verraten haben. Denn das Böse ist endgültig nach Ardeal zurückgekehrt.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showMoveBookDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Buch verschieben"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDeleteWarningDialog();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Buch löschen"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
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
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: CustomTheme.snowWhite,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyProfilPage()),
            );
          },
          child: myCircularAvatar(),
        ),
      ],
    );
  }
}
