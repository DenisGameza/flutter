import 'package:equatable/equatable.dart';

abstract class HttpEvent extends Equatable {
  const HttpEvent();

  @override
  List<Object> get props => [];
}

class LoadEvent extends HttpEvent {
  const LoadEvent({
    required this.inputNumber,
  });
  final String inputNumber;
}
