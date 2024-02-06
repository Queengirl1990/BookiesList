import 'package:bookieslist/backend/widgets/showBookUpdate.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookInfoContainer.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/styles/appbar.dart';
import '../../profil/presentation/profile_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            CustomTheme.loginGradientStart,
            CustomTheme.loginGradientEnd,
          ],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 1.0),
          stops: <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: MaterialApp(
        home: const CurrentlyReadingScreen(),
        theme: ThemeData.light().copyWith(
          primaryColor: CustomTheme.darkRed,
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}

class CurrentlyReadingScreen extends StatefulWidget {
  const CurrentlyReadingScreen({Key? key}) : super(key: key);

  @override
  _CurrentlyReadingScreenState createState() => _CurrentlyReadingScreenState();
}

class _CurrentlyReadingScreenState extends State<CurrentlyReadingScreen> {
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
                initialRating: 0.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30.0,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: CustomTheme.guelden,
                ),
                onRatingUpdate: (rating) {},
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
