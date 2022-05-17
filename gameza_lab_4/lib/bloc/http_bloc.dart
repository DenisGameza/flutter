import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import 'http_event.dart';
import 'http_state.dart';

class HttpBloc extends Bloc<HttpEvent, HttpState> {
  HttpBloc() : super(InitialState()) {
    on<LoadEvent>(_loadData);
  }

  Future<void> _loadData(
    LoadEvent event,
    Emitter<HttpState> emit,
  ) async {
    try {
      emit(LoadingState());
      final number = event.inputNumber;
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(Uri.parse('http://numbersapi.com/' '$number' '/trivia'));
      final _answer = NumberApi.fromResponse(response);
      emit(LoadedState(numberApi: _answer));
    } catch (e) {
      emit(FailedState(errorMessage: e.toString()));
    }
  }
}
