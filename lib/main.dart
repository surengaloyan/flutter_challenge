import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/challenge_app.dart';
import 'package:flutter_challenge/app/register_app_dependencies.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final di = GetIt.instance;

  await registerAppDependencies(di: di);

  runApp(MainApp(di: di));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.di});

  final GetIt di;

  @override
  Widget build(BuildContext context) {
    return ChallengeApp(di: di);
  }
}
