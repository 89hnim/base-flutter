import 'package:base_flutter/app.dart';
import 'package:base_flutter/data/repositories/sample_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/debug/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  /// di singleton repository
  /// todo: use getIt instead
  final sampleRepository = SampleRepository();
  runApp(App(sampleRepository: sampleRepository));
}
