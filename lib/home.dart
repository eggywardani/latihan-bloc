import 'package:flutter/material.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bloc - Bloc Listener"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<Counter, int>(
            listener: (context, state) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Running...")));
            },
            listenWhen: (prev, curr) {
              if (curr == 15) {
                return true;
              } else {
                return false;
              }
            },
            bloc: myCounter,
            child: BlocBuilder<Counter, int>(
              bloc: myCounter,
              builder: (context, state) {
                return Text(
                  "${state}",
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.decrement();
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.increment();
                  },
                  icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
