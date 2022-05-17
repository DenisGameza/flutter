import 'package:equatable/equatable.dart';
import '../models/models.dart';

abstract class HttpState extends Equatable {
  const HttpState();

  @override
  List<Object> get props => [];
}

class InitialState extends HttpState {}

class LoadingState extends HttpState {}

class LoadedState extends HttpState {
  final NumberApi numberApi;

  const LoadedState({
    required this.numberApi,
  });
}

class FailedState extends HttpState {
  final String errorMessage;

  const FailedState({
    required this.errorMessage,
  });
}
