//Button Zufallsgenerator
List<String> buttonTitles = [
  "Krimi",
  "Fantasy",
  "Thriller",
  "Liebesroman",
  "Science Fiction",
  "Young Adult",
  "Familienroman",
  "Reiseroman",
  "Erotik",
  "Horror",
  "New Adult",
  "Romantasy",
  "High Fantasy",
  "Ratgeber",
  "Biographie",
  "Humor",
  "Tatsachen",
  "Fanfiction",
  "Gesellschaft",
  "Historisches",
  "Sachbuch",
  "Abenteuer",
  "Gedichte",
  "Zeitgeschichte",
  "Anime",
  "Comic",
  "Fachbuch",
  "Selfpublishing"
];

//buchvorschlag
class BookData {
  final String title;
  final String author;
  final String genre;
  final String year;
  final String image;
  final String blurb;

  BookData({
    required this.title,
    required this.author,
    required this.genre,
    required this.year,
    required this.image,
    required this.blurb,
  });
}

List<BookData> bookSuggestion = [
  BookData(
    title: 'The Princes and the Beast I',
    author: 'Sally Dark',
    genre: 'Dark Romance',
    year: '2020',
    image: 'assets/bookimages/princess-and-beast.jpeg',
    blurb:
        'Um gleich eins klarzustellen. Das hier ist weder ein zuckersüßes Märchen noch eine harmlose Lovestory. Meine Geschichte ist nichts für schwache Nerven. Mein Leben besteht aus Gewalt, Tod, Drogen und Sex. Hier gibt es keine Moral. Ich bin auch kein verschissener Ritter in strahlender Rüstung. Ich bin ein Monster, das sich nimmt, was es will und tötet, wer ihm im Weg steht. Will ich dich töten oder nur mit dir spielen? Ich bin der Hunter und du meine Beute. Was auch immer ich mit dir vorhabe, ich verspreche dir, dass es dich fesseln wird. Also, traust du dich in meine Welt?',
  ),
  BookData(
    title: 'A STRANGE WORLD',
    author: 'Miamo Zesi',
    genre: 'Dark Romance',
    year: '2023',
    image: 'assets/bookimages/miamo-zesi.webp',
    blurb:
        'Glück im Job, Pech in der Liebe - eine Aussage, die für die selbstbewusste Beth vollkommen zutreffend zu sein scheint. Im Berufsleben hat sie es schnell geschafft, Fuß zu fassen, doch längere Beziehungen sind für sie ein Buch mit sieben Siegeln. Bis jetzt ist es ihr einfach nie gelungen, einen Mann kennenzulernen, der sie wirklich fasziniert. Aus einer Laune heraus meldet sie sich in einem Chatroom an, mit dem ersten Namen, der ihr in den Sinn kommt: Sklavinchen. Eine Aktion, von der Beth sich nichts verspricht, bis sie mit Steven ins Gespräch kommt. Der erfolgreiche, selbstbewusste Geschäftsmann offenbart ihr eine neue, eine dunkle Seite. Er entführt sie in eine fremde Welt, in der Beth sich ihren geheimsten Fantasien hingeben kann. Steven scheint zu wissen, was sie braucht, um endlich die Erfüllung finden zu können, nach der sie sich so lange gesehnt hat. Doch kann sich mit einem so geheimnisvollen Mann wirklich alles zum Guten wenden?',
  ),
  BookData(
    title: 'Destroyed Hearts II',
    author: 'Annie Tears',
    genre: 'Dark Romance',
    year: '2021',
    blurb:
        'Kaycee - Ich bin verloren. Wir sind zerbrochen – du und ich. Dein Betrug ist mehr, als ich ertragen kann, und doch komme ich nicht von dir los. Meine Liebe kann ich nicht einfach herausreißen und kaputtmachen, so wie du es mit meinem Herz getan hast. Ich will dir aus dem Weg gehen, doch dann bist du plötzlich da ... James - Was habe ich dir angetan, Kaycee? Ich wollte dich von mir fernhalten, damit genau so etwas nicht passiert. Ich habe einen Fehler gemacht, den ich nicht mehr korrigieren kann. Wenn du nur die Wahrheit wüsstest, Kay ... Würdest du mir dann glauben? Du willst vor mir fliehen, aber ich muss in deiner Nähe bleiben. Denn ohne meinen Schutz wirst du zur Zielscheibe meiner Feinde ...',
    image: 'assets/bookimages/destroyed-hearts.jpeg',
  ),
];
