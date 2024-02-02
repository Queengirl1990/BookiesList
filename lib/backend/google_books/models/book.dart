import 'dart:convert';

Book parseBook(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return Book.fromJson(parsed);
}

class Book {
  final int totalItems;
  final List<Item> items;

  Book({required this.totalItems, required this.items});

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;
    List<Item> itemList = list.map((i) => Item.fromJson(i)).toList();

    return Book(items: itemList, totalItems: parsedJson['totalItems']);
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
  final String? publisher;
  final List<String>? authors;
  final List<String>? categories;
  final String? description;
  final String? publishedDate;
  final String? infoLink;

  final dynamic averageRating;
  final ImageLinks? image;
  final List<ISBN>? isbn;
  final int? ratingsCount;
  final int? pageCount;

  VolumeInfo({
    required this.title,
    required this.publisher,
    required this.authors,
    required this.categories,
    required this.averageRating,
    required this.image,
    required this.isbn,
    required this.ratingsCount,
    required this.pageCount,
    this.description,
    this.infoLink,
    this.publishedDate,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['industryIdentifiers'] as List?;
    List<ISBN>? isbn = list?.map((i) => ISBN.fromJson(i)).toList();

    return VolumeInfo(
      title: parsedJson['title'] as String?,
      publisher: parsedJson['publisher'] as String?,
      publishedDate: parsedJson['publishedDate'] as String?,
      authors: (parsedJson['authors'] as List?)
          ?.map((author) => author as String)
          .toList(),
      categories: (parsedJson['categories'] as List?)
          ?.map((category) => category as String)
          .toList(),
      averageRating: parsedJson['averageRating'] ?? 0.0,
      image: ImageLinks.fromJson(parsedJson['imageLinks']),
      isbn: isbn,
      ratingsCount: parsedJson['ratingsCount'] as int?,
      pageCount: parsedJson['pageCount'] as int?,
      description: parsedJson['description'] as String?,
      infoLink: parsedJson['infoLink'] as String?,
    );
  }
}
