import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';

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

      final x = (jsonMap['items'] as List)
          .map(
            (result) => Book(
              totalItems: jsonMap['totalItems'],
              items: (jsonMap['items'] as List).map((item) {
                final volumeInfo = item['volumeInfo'];
                final accessInfo = item['accessInfo'];

                return Item(
                  volumeInfo: VolumeInfo.fromJson(volumeInfo ?? {}),
                  accessInfo: AccessInfo.fromJson(accessInfo ?? {}),
                );
              }).toList(),
              title: volumeInfo['title'] ?? 'No Title',
              authors: volumeInfo['authors']?.join(', ') ?? 'Unknown Author',
              thumbnailUrl:
                  volumeInfo['imageLinks']?['smallThumbnail'] ?? 'No Thumbnail',
              averageRating: volumeInfo['averageRating']?.toDouble() ?? 0.0,
              categories: volumeInfo['categories']?.cast<String>() ?? [],
              isbn13: volumeInfo['industryIdentifiers']?[0]['identifier'] ??
                  'Unknown ISBN',
              description: volumeInfo['description'] ?? 'No Description',
              ratingCount: formatter.format(volumeInfo['ratingsCount'] ?? 0),
              pageCount: volumeInfo['pageCount']?.toString() ?? '0',
              publishedDate: volumeInfo['publishedDate'] ?? 'Unknown Date',
              publisher: volumeInfo['publisher'] ?? 'Unknown Publisher',
              infoLink: volumeInfo['infoLink'] ?? 'No Info Link',
              embeddable: accessInfo['embeddable'] ?? false,
            ),
          )
          .toList();

      return x;
    }
    return [Book(totalItems: 0, items: [])];
  }
}
