import 'package:dio_model_bloc/application/bloc/response_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("dio  model bloc"),
      ),
      body: Center(
        child: BlocBuilder<ResponseBlocBloc, ResponseBlocState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.movieTitle ?? "no data"),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ResponseBlocBloc>(context)
                        .add(const ResponseBlocEvent.fetchDataEvent());
                  },
                  child: const Icon(
                    Icons.done_outline_sharp,
                    color: Colors.black,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
