import 'package:http/http.dart' as http;

class NumberApi {
  final String answer;

  NumberApi({required this.answer});

  factory NumberApi.fromResponse(http.Response response) {
    return NumberApi(answer: response.body);
  }
}
