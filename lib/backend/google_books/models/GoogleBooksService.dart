import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class GoogleBooksService {
  Future<List<Book>> getBooks(String url, String index, String max) async {
    final uri = Uri.https('books.googleapis.com', '/books/v1/volumes', {
      'q': 'intitle:$url|inauthor:$url',
      'startIndex': index,
      'maxResults': max,
      'fields': 'totalItems,items(volumeInfo(title,publisher,authors,categories,'
          'description,publishedDate,infoLink,averageRating,imageLinks/smallThumbnail,'
          'industryIdentifiers(identifier,type),ratingsCount,pageCount),accessInfo(embeddable))',
    });

    final res = await get(uri);

    if (res.statusCode == 200) {
      return _parseBookJson(res.body);
    } else {
      throw Exception('Error: ${res.statusCode}');
    }
  }

  List<Book> _parseBookJson(String jsonStr) {
    final jsonMap = json.decode(jsonStr);

    if (jsonMap['totalItems'] != 0) {
      var formatter = NumberFormat('#,##,##0');

      final x = (jsonMap['items'] as List).map(
        (result) {
          final volumeInfo = result['volumeInfo'];
          final accessInfo = result['accessInfo'];

          return Book(
            totalItems: jsonMap['totalItems'],
            items: (jsonMap['items'] as List).map((item) {
              return Item(
                volumeInfo: VolumeInfo.fromJson(item['volumeInfo'] ?? {}),
                accessInfo: AccessInfo.fromJson(item['accessInfo'] ?? {}),
              );
            }).toList(),
            title: volumeInfo['title'] ?? 'No Title',
            authors: (volumeInfo['authors'] as List?)?.join(', ') ??
                'Unknown Author',
            thumbnailUrl:
                volumeInfo['imageLinks']?['smallThumbnail'] ?? 'No Thumbnail',
            averageRating: volumeInfo['averageRating']?.toDouble() ?? 0.0,
            categories:
                (volumeInfo['categories'] as List?)?.cast<String>() ?? [],
            isbn13: volumeInfo['industryIdentifiers']?[0]['identifier'] ??
                'Unknown ISBN',
            description: volumeInfo['description'] ?? 'No Description',
            ratingCount: formatter.format(volumeInfo['ratingsCount'] ?? 0),
            pageCount: volumeInfo['pageCount']?.toString() ?? '0',
            publishedDate: volumeInfo['publishedDate'] ?? 'Unknown Date',
            publisher: volumeInfo['publisher'] ?? 'Unknown Publisher',
            infoLink: volumeInfo['infoLink'] ?? 'No Info Link',
            embeddable: accessInfo['embeddable'] ?? false,
          );
        },
      ).toList();

      return x;
    }
    return [Book(totalItems: 0, items: [])];
  }
}

class Book {
  final List<Item> items;
  final int totalItems;

  Book({required this.items, required this.totalItems});

  factory Book.fromJson(String source) {
    final parsedJson = json.decode(source) as Map<String, dynamic>;
    final List<dynamic> itemList = parsedJson['items'] as List;

    return Book(
      items: itemList.map((i) => Item.fromJson(i)).toList(),
      totalItems: parsedJson['totalItems'] as int,
    );
  }
}

class Item {
  final VolumeInfo volumeInfo;
  final AccessInfo accessInfo;

  Item({required this.volumeInfo, required this.accessInfo});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
      volumeInfo: VolumeInfo.fromJson(parsedJson['volumeInfo'] ?? {}),
      accessInfo: AccessInfo.fromJson(parsedJson['accessInfo'] ?? {}),
    );
  }
}

class ImageLinks {
  final String? thumb;

  ImageLinks({this.thumb});

  factory ImageLinks.fromJson(Map<String, dynamic>? parsedJson) {
    return ImageLinks(thumb: parsedJson?['smallThumbnail'] as String? ?? '');
  }
}

class ISBN {
  final String iSBN13;
  final String type;

  ISBN({required this.iSBN13, required this.type});

  factory ISBN.fromJson(Map<String, dynamic> parsedJson) {
    return ISBN(
      iSBN13: parsedJson['identifier'] as String,
      type: parsedJson['type'] as String,
    );
  }
}

class AccessInfo {
  final bool embeddable;

  AccessInfo({required this.embeddable});

  factory AccessInfo.fromJson(Map<String, dynamic> parsedJson) {
    return AccessInfo(
      embeddable: parsedJson['embeddable'] as bool,
    );
  }
}

class VolumeInfo {
  final String? title;
  final List<String>? authors;
  final ImageLinks? imageLinks;
  final String? description;
  final List<IndustryIdentifier>? industryIdentifiers;
  final double? averageRating;
  final int? ratingsCount;
  final List<String>? categories;
  final String? pageCount;
  final String? publishedDate;
  final String? publisher;
  final String? infoLink;

  VolumeInfo({
    this.title,
    this.authors,
    this.imageLinks,
    this.description,
    this.industryIdentifiers,
    this.averageRating,
    this.ratingsCount,
    this.categories,
    this.pageCount,
    this.publishedDate,
    this.publisher,
    this.infoLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    final imageLinksJson = json['imageLinks'] as Map<String, dynamic>?;
    final industryIdentifiersJson = json['industryIdentifiers'] as List?;

    return VolumeInfo(
      title: json['title'],
      authors: json['authors']?.cast<String>(),
      imageLinks:
          imageLinksJson != null ? ImageLinks.fromJson(imageLinksJson) : null,
      description: json['description'],
      industryIdentifiers: industryIdentifiersJson != null
          ? (industryIdentifiersJson as List)
              .map((id) => IndustryIdentifier.fromJson(id))
              .toList()
          : null,
      averageRating: json['averageRating'],
      ratingsCount: json['ratingsCount'],
      categories: json['categories']?.cast<String>(),
      pageCount: json['pageCount'],
      publishedDate: json['publishedDate'],
      publisher: json['publisher'],
      infoLink: json['infoLink'],
    );
  }
}

class IndustryIdentifier {
  final String type;
  final String identifier;

  IndustryIdentifier({
    required this.type,
    required this.identifier,
  });

  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) {
    return IndustryIdentifier(
      type: json['type'],
      identifier: json['identifier'],
    );
  }
}
