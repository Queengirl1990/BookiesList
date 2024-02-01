//fürs Karussel

Map<String, Map<String, String>> readBooks = {
  'Außerhalb der Schatten I': {
    'title': 'Außerhalb der Schatten I',
    'author': 'MJ Hard',
    'year': '2020',
    'image': 'assets/bookimages/das-ist-erst.jpg',
  },
  'Vampires of Vensaya': {
    'title': 'Vampires of Vensaya',
    'author': 'Michael Jeremy Hard',
    'year': '2020',
    'image': 'assets/bookimages/vampires_of_vensaya.jpeg',
  },
  'Das Biest in ihm': {
    'title': 'Das Biest in ihm',
    'author': 'Serena Valentino',
    'year': '2019',
    'image': 'assets/bookimages/das-biest.jpeg',
  },
  'Keep my silent heart': {
    'title': 'Keep my silent heart',
    'author': 'Sazou G.',
    'year': '2022',
    'image': 'assets/bookimages/keep-my.jpg',
  },
  'Ravenhall Academy I': {
    'title': 'Ravenhall Academy I',
    'author': 'Julia Kuhn',
    'year': '2023',
    'image': 'assets/bookimages/verborgene-magie.jpeg',
  },
};

//buchinfocontainer fürs profil
class BookInfo {
  final String title;
  final String author;
  final String genre;
  final String buttonLabel;

  BookInfo(this.title, this.author, this.genre, this.buttonLabel);
}

final Map<String, BookInfo> bookInfoMap = {
  'Außerhalb der Schatten I': BookInfo(
      'Außerhalb der Schatten I', 'Mandy J. Hard', 'Fantasy', 'Jetzt Lesen'),
  'Fourth Wings I':
      BookInfo('Fourth Wings I', 'Rebecca Yarros', 'Fantasy', 'Jetzt Lesen'),
  'Huskyküsse zu Weihnachten': BookInfo(
      'Huskyküsse zu Weihnachten', 'Maria Winter', 'Romantik', 'Jetzt Lesen'),
  'Keep my silent Heart':
      BookInfo('Keep my silent Heart', 'Sazou G.', 'Romantik', 'Jetzt Lesen'),
  'Wicca Creed I':
      BookInfo('Wicca Creed I', 'Marah Woolf', 'Fantasy', 'Jetzt Lesen'),
  'Ravenhall Academy II':
      BookInfo('Ravenhall Academy II', 'Julia Kuhn', 'Fantasy', 'Jetzt Lesen'),
  'Bad At Love':
      BookInfo('Bad At Love', 'Julia Kuhn', 'New Adult Roman', 'Jetzt Lesen'),
};

final List<String> bookCoverAssets = [
  'assets/bookimages/das-ist-erst.jpg',
  'assets/bookimages/Fourth_wings.jpg',
  'assets/bookimages/Huskyküsse.jpg',
  'assets/bookimages/keep-my.jpg',
  'assets/bookimages/wiccacreed.jpeg',
  'assets/bookimages/erwachte-magie.jpg',
  'assets/bookimages/bad-at-love.jpeg',
];

// gelesene Bücher Screen
Map<String, Map<String, String>> readBooksList = {
  'WiccaCreed I Schuld & Sünde': {
    'title': 'WiccaCreed I',
    'author': 'Marah Woolf',
    'year': '2023',
    'image': 'assets/bookimages/wiccacreed.jpeg',
  },
  'Außerhalb der Schatten I Das ist erst der Anfang': {
    'title': 'Außerhalb der Schatten I',
    'author': 'MJ Hard',
    'year': '2020',
    'image': 'assets/bookimages/das-ist-erst.jpg',
  },
  'Fourth Wings I Flammengeküsst': {
    'title': 'Fourth Wings I',
    'author': 'Rebecca Yarros',
    'year': '2023',
    'image': 'assets/bookimages/Fourth_wings.jpg',
  },
  'Vampires of Vensaya': {
    'title': 'Vampires of Vensaya',
    'author': 'Michael Jeremy Hard',
    'year': '2020',
    'image': 'assets/bookimages/vampires_of_vensaya.jpeg',
  },
  'Keep my silent Heart: A Christmas Story': {
    'title': 'Keep my silent Heart',
    'author': 'Sazou G.',
    'year': '2022',
    'image': 'assets/bookimages/keep-my.jpg',
  },
  'Huskyküsse zu Weihnachten': {
    'title': 'Huskyküsse zu Weihnachten',
    'author': 'Maria Winter',
    'year': '2022',
    'image': 'assets/bookimages/Huskyküsse.jpg',
  },
  'Das Biest in ihm': {
    'title': 'Das Biest in ihm',
    'author': 'Serena Valentino',
    'year': '2019',
    'image': 'assets/bookimages/das-biest.jpeg',
  },
  'Ravenhall Academy II Erwachte Magie': {
    'title': 'Ravenhall Academy II',
    'author': 'Julia Kuhn',
    'year': '2023',
    'image': 'assets/bookimages/erwachte-magie.jpg',
  },
  'Ravenhall Academy I': {
    'title': 'Ravenhall Academy I',
    'author': 'Julia Kuhn',
    'year': '2023',
    'image': 'assets/bookimages/verborgene-magie.jpeg',
  },
  'Destroyed Souls I': {
    'title': 'Destroyed Souls I',
    'author': 'Annie Tears',
    'year': '2020',
    'image': 'assets/bookimages/destroyed-souls-1.jpeg',
  },
  'Rise & Doom III Königin des blutroten Throns': {
    'title': 'Rise & Doom III',
    'author': 'Ina Taus',
    'year': '2019',
    'image': 'assets/bookimages/rise-doom-3.jpg',
  },
  'Rise & Doom II Prinz unter dem blutroten Mond': {
    'title': 'Rise & Doom 2',
    'author': 'Ina Taus',
    'year': '2019',
    'image': 'assets/bookimages/rise&doom.jpeg',
  },
  'Rise & Doom I Prinzessin der blutroten Wüste': {
    'title': 'Rise & Doom I',
    'author': 'Ina Taus',
    'year': '2019',
    'image': 'assets/bookimages/rise-doom.webp',
  },
  'Die Tribute von Panem X Das Lied von Vogel und Schlange': {
    'title': 'Die Tribute von Panem X',
    'author': 'Suzanne Collins',
    'year': '2020',
    'image': 'assets/bookimages/panem-x.jpeg',
  },
  'Die Tribute von Panem II Gefährliche Liebe': {
    'title': 'Die Tribute von Panem II',
    'author': 'Suzanne Collins',
    'year': '2022',
    'image': 'assets/bookimages/panem-2.jpeg',
  },
  'Die Tribute von Panem I Tödliche Spiele': {
    'title': 'Die Tribute von Panem I',
    'author': 'Suzanne Collins',
    'year': '2020',
    'image': 'assets/bookimages/panem-1.jpeg',
  },
  'Belle Morte I Rot wie Blut': {
    'title': 'Belle Morte I',
    'author': 'Bella Higgin',
    'year': '2023',
    'image': 'assets/bookimages/belle-morte.webp',
  }
};
