import 'package:flutter/material.dart';
import 'package:latihan_bloc/404/not_found.dart';
import 'package:latihan_bloc/home.dart';
import 'package:latihan_bloc/other_page.dart';

class MyRoutes {
  Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case "/other":
        return MaterialPageRoute(
          builder: (context) => OtherPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(),
        );
    }
  }
}
