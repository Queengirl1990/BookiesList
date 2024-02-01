import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../models/book.dart';
/*
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
      final volume = Book.fromJson(jsonMap);
      var formatter = NumberFormat('#,##,##0');

       final x = volume.items
          .map(
            (result) => Book(
              totalItems: volume.totalItems,
              items: volume.items,
              title: result.volumeinfo?.title ?? 'No Title',
              authors:
                  result.volumeinfo?.authors?.join(', ') ?? 'Unknown Author',
              thumbnailUrl: result.volumeinfo?.image?.thumb,
              averageRating:
                  result.volumeinfo?.averageRating?.toDouble() ?? 0.0,
              categories: result.volumeinfo?.categories ?? [],
              isbn13: result.volumeinfo?.isbn?[0]?.iSBN13 ?? 'Unknown ISBN',
              description: result.volumeinfo?.description ?? 'No Description',
              ratingCount:
                  formatter.format(result.volumeinfo?.ratingsCount ?? 0),
              pageCount: result.volumeinfo?.pageCount?.toString() ?? '0',
              publishedDate: result.volumeinfo?.publishedDate ?? 'Unknown Date',
              publisher: result.volumeinfo?.publisher ?? 'Unknown Publisher',
              infoLink: result.volumeinfo?.infoLink ?? 'No Info Link',
              embeddable: result.accessInfo?.embeddable ?? false,
            ),
          )
          .toList();

      return x;
    }
    return [Book(totalItems: 0, items: [])]; 
    }
  }
}*/