import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/bookieslist_widgets.dart';
import '../../../backend/libary/api_key.dart';

//Api Anbindung prüfen, eventuell austauschen
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewBookScann(),
    );
  }
}

class NewBookScann extends StatefulWidget {
  const NewBookScann({Key? key}) : super(key: key);

  @override
  _NewBookScannState createState() => _NewBookScannState();
}

class _NewBookScannState extends State<NewBookScann> {
  String scannedCode = '';
  BookInfo? bookInfo;

  Future<void> scanBarcode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Abbrechen',
      true,
      ScanMode.BARCODE,
    );

    if (!mounted) return;

    setState(() {
      scannedCode = code;
      // Logik gescannten Buches implementieren
      fetchBookInfo(scannedCode);
    });
  }

  Future<void> fetchBookInfo(String isbn) async {
    try {
      final apiKey = googleBooksApiKey; //seperat in versteckter datei
      final apiUrl = 'https://www.googleapis.com/books/v1/volumes?q=$isbn';

      final response = await http.get(Uri.parse(apiUrl), headers: {
        'Authorization': 'Bearer $apiKey',
      });

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          bookInfo = BookInfo.fromJson(data);
        });
      } else {
        // Fehlerbehandlung, wenn die API-Anfrage fehlschlägt
        print('Fehler bei der API-Anfrage: ${response.statusCode}');
      }
    } catch (error) {
      // Allgemeine Fehlerbehandlung
      print('Fehler bei der API-Anfrage: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomTheme.darkRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          myCircularAvatar(),
        ],
      ),
      backgroundColor: CustomTheme.darkRed,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Neues Buch hinzufügen",
            style: TextStyle(
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.normal,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              'assets/images/scanner-logo.png',
              width: 100,
              height: 100,
            ),
          ),
          const MyDividerWithIcons(),
          ElevatedButton(
            onPressed: () async {
              await scanBarcode();
              // Ladeanzeige
            },
            child: const Text('Barcode scannen'),
          ),
          // Buchinformationen
          if (bookInfo != null)
            Column(
              children: [
                Text('Titel: ${bookInfo!.title}'),
                Text('Autor: ${bookInfo!.author}'),
              ],
            ),
          if (bookInfo == null) CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class BookInfo {
  final String title;
  final String author;

  BookInfo({required this.title, required this.author});

  factory BookInfo.fromJson(Map<String, dynamic> json) {
    return BookInfo(
      title: json['title'],
      author: json['author'],
    );
  }
}
