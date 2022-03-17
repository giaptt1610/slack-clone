import 'package:get_it/get_it.dart';
import 'mocks/product_repo_mock.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  final prodRepoMock = ProductRepoMock();
  getIt.registerSingleton(prodRepoMock);
}
