import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../../backend/styles/theme.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({Key? key}) : super(key: key);

  @override
  _EditProfilScreenState createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [],
          title: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: CustomTheme.snowWhite,
                ),
                onPressed: () {
                  print("Back Button Pressed");
                  Navigator.pushReplacementNamed(context, '/profilScreen');
                },
              ),
              const SizedBox(width: 8),
              const Text(
                "Mein Profil",
                style: TextStyle(
                  color: CustomTheme.snowWhite,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                const MyCircularAvatar(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Queengirl",
                      style: TextStyle(
                        fontFamily: 'DancingScript',
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                      iconSize: 18,
                      onPressed: () {
                        // Icon Logik
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _showImagePicker(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomTheme.snowWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Bild bearbeiten",
                    style: TextStyle(
                      color: CustomTheme.darkMode,
                    ),
                  ),
                ),
              ],
            ),
          ),
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

  void _showImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Logik
    }
  }
}

class MyCircularAvatar extends StatelessWidget {
  const MyCircularAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: CustomTheme.snowWhite,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/avatar.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
