import 'package:flutter/material.dart';
import 'package:flutter_challenge/shared/store_factory.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CommonDependenciesProvider extends StatelessWidget {
  const CommonDependenciesProvider({
    super.key,
    required this.child,
    required this.di,
  });

  final Widget child;
  final GetIt di;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => StoreFactory(di: di),
      child: child,
    );
  }
}
