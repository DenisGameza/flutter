import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/http_bloc.dart';
import 'bloc/http_state.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(number),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<HttpBloc, HttpState>(
            builder: (context, state) {
              if (state is LoadingState) return const CircularProgressIndicator();
              if (state is LoadedState) return Text(state.numberApi.answer.toString(), style: Theme.of(context).textTheme.headline4);
              if (state is FailedState) return Text(state.errorMessage);
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
