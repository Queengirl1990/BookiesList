import 'package:flutter/material.dart';
import '../styles/theme.dart';
import 'package:percent_indicator/percent_indicator.dart';

//Abtrennung
class MyDividerWithIcons extends StatelessWidget {
  const MyDividerWithIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          width: 320,
          child: Divider(
            color: CustomTheme.snowWhite,
            height: 20,
            thickness: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 20, color: CustomTheme.snowWhite),
            SizedBox(width: 10),
            Icon(Icons.favorite, size: 20, color: CustomTheme.snowWhite),
            SizedBox(width: 10),
            Icon(Icons.favorite, size: 20, color: CustomTheme.snowWhite),
          ],
        ),
        SizedBox(
          width: 320,
          child: Divider(
            color: CustomTheme.snowWhite,
            height: 20,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}

//aktuelles buch Container
Widget bookInfoContainer(double bookProgress, VoidCallback onUpdatePressed) {
  return Center(
    child: Container(
      width: 320,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: CustomTheme.snowWhite,
        border: Border.all(color: Colors.grey),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "WiccaCreed II Schuld & Sünde",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: CustomTheme.darkMode,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Marah Woolf",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: CustomTheme.darkMode,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Kategorie",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: CustomTheme.darkMode,
                ),
              ),
              const Text(
                "Romantasysaga",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: CustomTheme.darkMode,
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                child: LinearPercentIndicator(
                  width: 150,
                  lineHeight: 14.0,
                  percent: bookProgress,
                  center: Text('${(bookProgress * 100).toStringAsFixed(0)}%'),
                  progressColor: CustomTheme.guelden,
                  barRadius: const Radius.circular(7.0),
                  backgroundColor: const Color.fromARGB(255, 230, 228, 228),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onUpdatePressed,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(CustomTheme.snowWhite),
                ),
                child: const Text(
                  'Aktualisieren',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: CustomTheme.darkMode,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                height: 120,
                child: Image.asset('assets/bookimages/wiccacreed-2.jpeg'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
