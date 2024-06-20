import 'package:free_dicionary/core/view_models/dictionary_provider.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<DictionaryProvider>(() => DictionaryProvider());
}
