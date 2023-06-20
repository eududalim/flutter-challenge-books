import 'package:flutter_challenge_books/app/layers/data/datasources/api/books_api_datasource.dart';
import 'package:flutter_challenge_books/app/layers/data/repositories/books_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('swapi api datasource: getAllBooks', () async {
    final datasource = BooksRepository(BooksApiDatasource());

    var result = await datasource.getAllBooks();
    print(result);
  });

  test('swapi api datasource: getFavoriteBooks', () async {
    final datasource = BooksRepository(BooksApiDatasource());

    var result = await datasource.getFavoriteBooks();
    print(result);
  });
}
