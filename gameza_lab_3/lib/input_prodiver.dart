import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class NumberApi {
  final String answer;

  NumberApi({required this.answer});

  factory NumberApi.fromResponse(http.Response response) {
    return NumberApi(answer: response.body);
  }
}

class InputProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  NumberApi? _answer;
  NumberApi? get answer => _answer;

  Future<void> fetchStatusCode(number) async {
    _isLoading = true;
    notifyListeners();
    final response = await http.get(Uri.parse('http://numbersapi.com/' '$number' '/trivia'));
    _answer = NumberApi.fromResponse(response);
    _isLoading = false;
    notifyListeners();
  }
}
