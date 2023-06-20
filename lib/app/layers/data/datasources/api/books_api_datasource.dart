import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hasura_connect/hasura_connect.dart';

import '../../../../shared/helpers/consts.dart';
import '../../../domain/models/result_api_model.dart';

class BooksApiDatasource {
  final _connect = HasuraConnect(Api.baseUrl);

  /// Get All Books of API.
  /// if success, return a ResultApiModel with a data list
  /// if error, return ResultApiModel with error message
  Future<ResultApiModel> getAllBooks() async {
    try {
      var response = await _connect.query(Api.queryAllBooks);
      try {
        var data = Map<String, dynamic>.from((response));

        if (response != null) {
          var results = ResultApiModel(
              List<Map<String, dynamic>>.from(data['data']['allBooks']));

          return results;
        } else {
          debugPrint(response.toString());
          return ResultApiModel(null, error: data.toString());
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        return ResultApiModel(null, error: e.toString());
      }
    } on Exception catch (e) {
      debugPrint(toString());
      return ResultApiModel(null, error: e.toString());
    }
  }

  /// Get Favorite Books of API.
  /// if success, return a ResultApiModel with a data list
  /// if error, return ResultApiModel with error message
  Future<ResultApiModel> getFavoriteBooks() async {
    try {
      var response = await _connect.query(Api.queryFavoriteBooks);
      try {
        var data = Map<String, dynamic>.from((response));

        if (response != null) {
          var results = ResultApiModel(
              List<Map<String, dynamic>>.from(data['data']['favoriteBooks']));

          return results;
        } else {
          debugPrint(response.toString());
          return ResultApiModel(null, error: data.toString());
        }
      } on Exception catch (e) {
        debugPrint(e.toString());
        return ResultApiModel(null, error: e.toString());
      }
    } on Exception catch (e) {
      debugPrint(toString());
      return ResultApiModel(null, error: e.toString());
    }
  }
}
