import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'input_prodiver.dart';


class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InputProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(number),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: (Column(
            children: [
              if (provider.isLoading)
                const CircularProgressIndicator()
              else if (provider.answer != null)
                Text(provider.answer!.answer.toString(), style: Theme.of(context).textTheme.headline4)
              else
                const Text("Error")
            ],
          )),
        ),
      ),
    );
  }
}
