import 'package:flutter_challenge_books/app/layers/data/datasources/api/books_api_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('swapi api datasource ...', () async {
    final datasource = BooksApiDatasource();

    var result = await datasource.getAllBooks();
    print(result.object);
  });
}
