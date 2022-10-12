import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            BlocSelector<UserBloc, Map<String, dynamic>, String>(
                selector: (state) => state["name"],
                builder: (context, state) {
                  return Text("Nama : $state");
                }),
            BlocSelector<UserBloc, Map<String, dynamic>, int>(
                selector: (state) => state["age"],
                builder: (context, state) {
                  return Text("Umur : $state tahun");
                }),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (value) {
                userBloc.changeName(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name"),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state["age"] - 1);
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state["age"] + 1);
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
