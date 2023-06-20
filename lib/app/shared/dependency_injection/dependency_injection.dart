import 'package:get_it/get_it.dart';
import '../../layers/data/datasources/api/books_api_datasource.dart';
import '../../layers/data/repositories/books_repository.dart';
import '../../layers/presenters/controllers/home_controller.dart';

GetIt inject = GetIt.I;

initInject() {
// datasources
  inject.registerLazySingleton<BooksApiDatasource>(() => BooksApiDatasource());

//repositories
  inject
      .registerLazySingleton<BooksRepository>(() => BooksRepository(inject()));

// controllers
  inject.registerLazySingleton<HomeController>(() => HomeController(inject()));
}
