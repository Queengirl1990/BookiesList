import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/randome_generator.dart';

//aufruf mycircularavatar und divider einarbeiten

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomGeneratorScreen(),
    );
  }
}

class RandomGeneratorScreen extends StatefulWidget {
  const RandomGeneratorScreen({super.key});

  @override
  _RandomGeneratorScreenState createState() => _RandomGeneratorScreenState();
}

class _RandomGeneratorScreenState extends State<RandomGeneratorScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.darkRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Zurücknavigieren
          },
        ),
        actions: const [
          MyCircularAvatar(),
        ],
      ),
      backgroundColor: CustomTheme.darkRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 320,
            child: Divider(
              color: CustomTheme.snowWhite,
              height: 20,
              thickness: 2,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 20, color: CustomTheme.lightGrey),
              SizedBox(width: 10),
              Icon(Icons.favorite, size: 20, color: CustomTheme.lightGrey),
              SizedBox(width: 10),
              Icon(Icons.favorite, size: 20, color: CustomTheme.lightGrey),
            ],
          ),
          const SizedBox(
            width: 320,
            child: Divider(
              color: CustomTheme.snowWhite,
              height: 20,
              thickness: 2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Was möchtest du heute lesen",
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            //mehrauswahl möglich machen
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3.17,
              ),
              itemCount: 27,
              itemBuilder: (context, index) {
                return MyButton(
                  text: buttonTitles[index],
                  onPressed: () {
                    // Auswahllogik implementieren
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          MyButton(
            text: "Generator Starten",
            onPressed: () {
              // Funktion
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: currentPageIndex,
        backgroundColor: CustomTheme.darkRed,
        color: CustomTheme.darkMode,
        buttonBackgroundColor: CustomTheme.darkMode,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
            if (index == 1) {
              Navigator.pushNamed(context, '/unreadBooks');
            }
          });
        },
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.menu_book, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white),
          Icon(Icons.help_outline, size: 30, color: CustomTheme.darkRed),
        ],
      ),
    );
  }
}

class MyCircularAvatar extends StatelessWidget {
  const MyCircularAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: CustomTheme.snowWhite,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/avatar.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Container(
          width: 200,
          height: 40,
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: CustomTheme.darkMode,
            ),
          ),
        ),
      ),
    );
  }
}
