// ignore_for_file:  invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/foundation.dart';
import 'package:flutter_challenge_books/app/layers/domain/models/book_model.dart';

import '../../data/repositories/books_repository.dart';
import '../../domain/states/book_states_model.dart';

class HomeController {
  final BooksRepository _booksRepository;

  var allBooksState = ValueNotifier<BooksState>(BooksInitialState());
  var favoriteBooksState = ValueNotifier<BooksState>(BooksInitialState());
  var authorsState = ValueNotifier<BooksState>(BooksInitialState());

  BookModel? itemSelected;

  HomeController(this._booksRepository);

  loadAllBooks() async {
    allBooksState.value = BooksLoadingState();
    allBooksState.value = await _booksRepository.getAllBooks();
  }

  loadFavoriteBooks() async {
    favoriteBooksState.value = BooksLoadingState();
    favoriteBooksState.value = await _booksRepository.getFavoriteBooks();
  }

  // loadAuthors() async {
  //   authorsState.value = BooksLoadingState();
  //   authorsState.value = await _booksRepository.g();
  // }

  /// Carrega a lista de personagens na home page (primeira pagina apenas)
  /// Load persons list in homepage (top 10)
  loadingItemsHome() {
    loadAllBooks();
    loadFavoriteBooks();
  }
}
