import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => themeBloc.changeTheme(),
        child: Icon(Icons.color_lens_outlined),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MultiBlocListener(
              listeners: [
                BlocListener<Counter, int>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("> 10")));
                  },
                  listenWhen: (prev, curr) {
                    if (curr > 10) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                ),
                BlocListener<ThemeBloc, bool>(
                  listener: (context, state) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Gelap")));
                  },
                  listenWhen: (prev, curr) {
                    if (curr == true) {
                      return false;
                    } else {
                      return true;
                    }
                  },
                ),
              ],
              child: BlocBuilder<Counter, int>(
                bloc: myCounter,
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: TextStyle(fontSize: 50),
                  );
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    myCounter.minus();
                  },
                  icon: Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    myCounter.add();
                  },
                  icon: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
