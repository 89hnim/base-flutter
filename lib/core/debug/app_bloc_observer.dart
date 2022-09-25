import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate $bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('onError $bloc: $error');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // log('onTransition ${transition.currentState} ====> ${transition.nextState}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // log('onChange ${change.currentState} ====> ${change.nextState}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onEvent $event');
    super.onEvent(bloc, event);
  }
}
