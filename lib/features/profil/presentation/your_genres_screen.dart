import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../backend/styles/theme.dart';
import '../../../backend/widgets/randome_generator.dart';
import '../../profil/presentation/profile_screen.dart';

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
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: CustomTheme.loginGradientStart,
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
          ),
          BoxShadow(
            color: CustomTheme.loginGradientEnd,
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
          ),
        ],
      ),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: CustomTheme.darkRed,
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const YourGenresScreen(),
      ),
    );
  }
}

class YourGenresScreen extends StatefulWidget {
  const YourGenresScreen({Key? key}) : super(key: key);

  @override
  _YourGenresScreenState createState() => _YourGenresScreenState();
}

class _YourGenresScreenState extends State<YourGenresScreen> {
  late List<String> selectedGenres = [];
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadSelectedGenres();
  }

  _loadSelectedGenres() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedGenres = prefs.getStringList('selectedGenres') ?? [];
    });
  }

  _saveSelectedGenres() async {
    await prefs.setStringList('selectedGenres', selectedGenres);
  }

  _navigateToProfilePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyProfilPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: CustomTheme.snowWhite,
            ),
            onPressed: () {
              _saveSelectedGenres();
              Navigator.pop(context);
            },
          ),
          title: const Text(
            "Deine Genres bearbeiten",
            style: TextStyle(
              color: CustomTheme.snowWhite,
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Wähle deine Lieblingsgenres aus, dies kann dem Zufallsgenerator bei der Suche helfen, wenn du die Suche nicht verfeinerst",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: CustomTheme.snowWhite,
                  fontSize: 16,
                ),
              ),
            ),
            YourBodyWidget(selectedGenres: selectedGenres),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            _saveSelectedGenres();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Auswahl gespeichert!'),
              ),
            );
            _navigateToProfilePage();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadowColor: CustomTheme.darkMode,
            elevation: 5,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: Text('Speichern'),
          ),
        ),
      ),
    );
  }
}

class YourBodyWidget extends StatefulWidget {
  final List<String> selectedGenres;

  const YourBodyWidget({Key? key, required this.selectedGenres})
      : super(key: key);

  @override
  _YourBodyWidgetState createState() => _YourBodyWidgetState();
}

class _YourBodyWidgetState extends State<YourBodyWidget> {
  void _toggleGenre(String genre) {
    if (widget.selectedGenres.contains(genre)) {
      widget.selectedGenres.remove(genre);
    } else {
      widget.selectedGenres.add(genre);
    }
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildAnimatedButton(String genre, bool isSelected) {
    return GestureDetector(
      onTap: () {
        _toggleGenre(genre);
      },
      child: Container(
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          color: isSelected ? CustomTheme.darkRed : Colors.white,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            const BoxShadow(
              color: CustomTheme.darkMode,
              offset: Offset(2, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            genre,
            style: TextStyle(
              fontSize: 16,
              color: isSelected ? CustomTheme.snowWhite : CustomTheme.darkMode,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          (buttonTitles.length / 2).ceil(),
          (rowIndex) {
            final startIdx = rowIndex * 2;
            final endIdx = (rowIndex + 1) * 2;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                endIdx - startIdx,
                (index) {
                  final genreIndex = startIdx + index;
                  if (genreIndex < buttonTitles.length) {
                    final genre = buttonTitles[genreIndex];
                    final isSelected = widget.selectedGenres.contains(genre);

                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildAnimatedButton(genre, isSelected),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
