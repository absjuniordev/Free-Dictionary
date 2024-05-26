import 'package:free_dicionary/app/provider/dictionary_provider.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  final GetIt getIt = GetIt.instance;

  void setupDependency() {
    getIt.registerLazySingleton<DictionaryProvider>(() => DictionaryProvider());
  }
}
