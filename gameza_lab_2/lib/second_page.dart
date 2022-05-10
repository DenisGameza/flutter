import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<NumberApi> fetchStatusCode(number) async {
  final response = await http.get(Uri.parse('http://numbersapi.com/' '$number' '/trivia'));

  return NumberApi.fromResponse(response);
}

class NumberApi {
  final String answer;


  NumberApi({required this.answer}); 

  factory NumberApi.fromResponse(http.Response response) {
    return NumberApi(answer: response.body);
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _formKey = GlobalKey<FormState>();
  late Future<NumberApi> futureStatusCode;

  @override
  void initState() {
    super.initState();
    futureStatusCode = fetchStatusCode(widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        title: Text(widget.number),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<NumberApi>(
            future: futureStatusCode,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                    snapshot.data!.answer, style: Theme.of(context).textTheme.headline4);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
