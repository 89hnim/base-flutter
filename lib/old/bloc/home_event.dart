import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadingEvent extends HomeEvent {
  const LoadingEvent();

  @override
  List<Object> get props => [];

}
