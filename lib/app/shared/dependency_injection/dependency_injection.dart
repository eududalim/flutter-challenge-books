import 'package:get_it/get_it.dart';
import '../../layers/data/datasources/api/swapi_api_datasource.dart';
import '../../layers/data/repositories/persons_repository.dart';
import '../../layers/presenters/controllers/persons_controller.dart';

GetIt inject = GetIt.I;

initInject() {
// datasources
  inject.registerLazySingleton<SwapiApiDatasource>(() => SwapiApiDatasource());

//repositories
  inject.registerLazySingleton<PersonsRepository>(
      () => PersonsRepository(inject()));

// controllers
  inject
      .registerLazySingleton<BooksController>(() => BooksController(inject()));
}
