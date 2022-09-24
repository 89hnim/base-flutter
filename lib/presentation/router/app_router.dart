import 'package:base_flutter/data/repositories/sample_repository.dart';
import 'package:base_flutter/presentation/home/view/home_page.dart';
import 'package:base_flutter/presentation/sample/logic/sample_bloc.dart';
import 'package:base_flutter/presentation/sample/view/sample_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String home = '/';
  static const String sample = 'sample';

  const AppRouter._();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case sample:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SampleBloc(context.read<SampleRepository>()),
            child: const SamplePage(),
          ),
        );
      default:
        throw Exception('Route name:${settings.name} not found');
    }
  }
}
