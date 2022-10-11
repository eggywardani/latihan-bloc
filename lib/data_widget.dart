import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter myCounter = BlocProvider.of<Counter>(context);
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: Center(
        child: BlocBuilder(
          bloc: myCounter,
          builder: (context, state) {
            return Text("$state",
                style: TextStyle(fontSize: 50, color: Colors.white));
          },
        ),
      ),
    );
  }
}
