import '../models/book_model.dart';

abstract class BooksState {}

class BooksSuccessState implements BooksState {
  final List<BookModel> data;

  BooksSuccessState(this.data);
}

class BookErrorState implements BooksState {
  final String errorMessage;
  final Object? error;

  BookErrorState(this.errorMessage, this.error);
}

class BooksInitialState implements BooksState {}

class BooksLoadingState implements BooksState {}
