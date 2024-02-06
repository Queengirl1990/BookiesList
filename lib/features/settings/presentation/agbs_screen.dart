import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/appbar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../home/presentation/home_screen.dart';

//noch Anpassen ist zum Teil nur als Platzhalter

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.getAppTheme(),
      home: Scaffold(
        body: Container(
          decoration: CustomTheme.getBackgroundGradient(),
          child: const AGBScreen(),
        ),
      ),
    );
  }
}

class AGBScreen extends StatefulWidget {
  const AGBScreen({Key? key}) : super(key: key);

  @override
  _AGBScreenState createState() => _AGBScreenState();
}

class _AGBScreenState extends State<AGBScreen> {
  bool shareList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: buildCustomAppBar(),
      ),
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "AGB`s",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'DancingScript',
              ),
            ),
            const SizedBox(height: 20),
            const MyDividerWithIcons(),
            const SizedBox(height: 20),
            Container(
              width: 320,
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "Die BookiesList UG (haftungsbeschränkt) stellt dem/der NutzerIn eine Applikation (nachfolgend „BookiesList“ oder „BookiesList – App“ genannt) zur Verfügung, mit der Bücher gefunden und verwaltet werden können. Nach Maßgabe der nachfolgenden Geschäftsbedingungen bietet BookiesList folgende Leistungen:\n\nBookiesList stellt eine Datenbank mit Büchern zur Verfügung.\nNutzerInnen können eine virtuelle Bibliothek mit Bücher-Listen erstellen.\nNutzerInnen erhalten personalisierte Buchempfehlungen.\nNutzerInnen können Beiträge zu Büchern in Form von Video-, Bild- oder Textbeiträgen erstellen und einsehen.\nNutzerInnen erhalten weiterführende Affiliate-Links zu den Onlineshops.\nDie Vision von BookiesList ist es, jeden Menschen zu einer Buchliebhaberin oder einem Buchliebhaber zu machen, indem wirklich passende Bücher empfohlen werden. Passende Bücher entfachen nicht nur die Lust am Lesen, sondern bieten eine (Kopf-)Pause im stressigen Alltag und schenken Hoffnung, Mut und Verständnis.\n\nDabei legt BookiesList höchsten Wert auf Datenschutz und Datensicherheit. Mehr dazu steht in der BookiesList-Datenschutzerklärung, die unter https://bookieslist.com/datenschutz zu finden ist.\n\nGeltungsbereich\n\n",
                    ),
                    TextSpan(
                      text:
                          "Die folgenden Regelungen über den Vertragsabschluss gelten für",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          ":\n\ndie Absendung des ausgefüllten Registrierungsformulars\ndas Abschließen eines Abonnements\nIm Falle des Vertragsschlusses kommt der Vertrag mit:\n\nBookiesList UG (Haftungsbeschränkt)\nGeschäftsführer: Anja Brühl\nMusterstraße 4\nD-12345 Musterstadt\nRegisternummer 000000\nRegistergericht\n\nzustande.\n\nGewährleistung\n\nEs gelten die gesetzlichen Gewährleistungsregelungen.\n\nVertragssprache\n\nAls Vertragssprache steht ausschließlich Deutsch zur Verfügung.\n\nKundendienst\n\nUnser Kundendienst für Fragen, Reklamationen und Beanstandungen steht Ihnen werktags von 10:00 Uhr bis 17:00 Uhr unter:\n\nE-Mail: bookieslist.app@gmail.com\n\nzur Verfügung.",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Speichern
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(0),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: const Text(
                  'Speichern',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.transparent,
        color: CustomTheme.darkMode,
        buttonBackgroundColor: CustomTheme.darkMode,
        onTap: (int index) {
          if (index == 0) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false,
            );
          }
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

  Widget buildCustomAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Row(
          children: [
            const Icon(
              Icons.add,
              color: Colors.white,
            ),
            myCircularAvatar(),
          ],
        ),
      ],
    );
  }
}
