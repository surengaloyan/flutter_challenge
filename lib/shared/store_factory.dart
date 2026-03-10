import 'package:get_it/get_it.dart';

class StoreFactory {
  StoreFactory({required GetIt di}) : _di = di;

  final GetIt _di;

  T get<T extends Object>() => _di.get<T>();
}
