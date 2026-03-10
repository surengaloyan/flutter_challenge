import 'package:flutter_challenge/data.dart';
import 'package:flutter_challenge/domain.dart';
import 'package:flutter_challenge/presentation/presentation_dependencies_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> registerAppDependencies({required GetIt di}) async {
  final dataDependenciesProvider = DataDependenciesProvider(di: di);
  await dataDependenciesProvider.initialize();

  final domainDependenciesProvider = DomainDependenciesProvider(di: di);
  await domainDependenciesProvider.initialize();

  final presentationDependenciesProvider = PresentationDependenciesProvider(
    di: di,
  );
  await presentationDependenciesProvider.initialize();
}
