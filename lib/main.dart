import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/other_page.dart';
import 'package:latihan_bloc/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final MyRoutes router = MyRoutes();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Counter(),
      child: MaterialApp(
        // initialRoute: "/",
        // routes: {
        //   "/": (context) => HomePage(),
        //   "/other": (context) => OtherPage()
        // },
        onGenerateRoute: router.onGeneratedRoute,
      ),
    );
  }
}
