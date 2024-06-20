import 'package:get_it/get_it.dart';
import 'package:graphql_basics/data/data_sources/api_services.dart';
import 'package:graphql_basics/data/repository_impl/home/repository_impl.dart';
import 'package:graphql_basics/domain/repository/home/home_repository.dart';

class DependencyInjection {
  final getIt = GetIt.I;

  Future<void> init() async {
    getIt.registerSingleton<ApiServices>(ApiServices());
    getIt.registerSingleton<APIRepository>(HomeRepositoryImpl());
  }
}
