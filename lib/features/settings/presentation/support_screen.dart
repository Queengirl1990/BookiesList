import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/styles/appbar.dart';
import 'package:email_validator/email_validator.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../home/presentation/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.getAppTheme(),
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              CustomTheme.loginGradientStart,
              CustomTheme.loginGradientEnd,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          appBar: customAppBar(context),
          body: const SupportScreen(),
          bottomNavigationBar: CurvedNavigationBar(
            index: 2,
            backgroundColor: CustomTheme.loginGradientStart,
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
        ),
      ),
    );
  }
}

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  String? selectedSubject;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final List<String> subjects = [
    "Fehler melden",
    "Feature Wunsch",
    "Lob/Kritik",
    "Anderes"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            width: 320,
            child: DropdownButtonFormField<String>(
              value: selectedSubject,
              onChanged: (value) {
                setState(() {
                  selectedSubject = value;
                });
              },
              items: subjects.map((String subject) {
                return DropdownMenuItem<String>(
                  value: subject,
                  child: Text(subject),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Betreff',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 320,
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                fillColor: Colors.white,
                filled: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 320,
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'Nachricht',
                fillColor: Colors.white,
                filled: true,
              ),
              maxLines: 4,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (EmailValidator.validate(_emailController.text)) {
                    print('Betreff: $selectedSubject');
                    print('Email is valid');
                    print('Message: ${_messageController.text}');
                  } else {
                    print('Invalid email address');
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  minimumSize: const Size(150, 50),
                ),
                child: const Text('Senden'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
