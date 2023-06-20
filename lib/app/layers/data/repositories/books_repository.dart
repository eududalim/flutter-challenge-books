import 'package:flutter_challenge_books/app/layers/domain/models/book_model.dart';

import '../../domain/states/book_states_model.dart';
import '../datasources/api/books_api_datasource.dart';

class BooksRepository {
  final BooksApiDatasource _apiDatasource;

  BooksRepository(this._apiDatasource);

  /// Get All books of API.
  /// if success, return a BooksSuccessState with a data list
  /// if error, return BookErrorState with error message and error object (if there)
  Future<BooksState> getAllBooks() async {
    try {
      var result = await _apiDatasource.getAllBooks();
      if (result.error == null && result.object != null) {
        var list = (result.object as List<Map<String, dynamic>>)
            .map((e) => BookModel.fromMap(e))
            .toList();

        return BooksSuccessState(list);
      } else {
        if (result.error == null) {
          return BookErrorState('Erro desconhecido', null);
        } else {
          return BookErrorState(result.error!, null);
        }
      }
    } catch (e) {
      return BookErrorState(e.toString(), e);
    }
  }

  /// Get Favorite Books of API.
  /// if success, return a BooksSuccessState with a data list
  /// if error, return BookErrorState with error message and error object (if there)
  Future<BooksState> getFavoriteBooks() async {
    try {
      var result = await _apiDatasource.getFavoriteBooks();
      if (result.error == null && result.object != null) {
        var list = (result.object as List<Map<String, dynamic>>)
            .map((e) => BookModel.fromMap(e))
            .toList();

        return BooksSuccessState(list);
      } else {
        if (result.error == null) {
          return BookErrorState('Erro desconhecido', null);
        } else {
          return BookErrorState(result.error!, null);
        }
      }
    } catch (e) {
      return BookErrorState(e.toString(), e);
    }
  }
}
