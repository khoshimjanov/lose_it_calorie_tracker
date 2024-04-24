import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

void main() {
  runApp(
    const BlocMain(),
  );
}

class BlocMain extends StatelessWidget {
  const BlocMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Model(),
      child: BlocBuilder<Model, int>(
        builder: (context, state) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text(BlocProvider.of<Model>(context).e.toString()),
              ),
              floatingActionButton: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<Model>(context).upgrade();
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<Model>(context).downgrade();
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
