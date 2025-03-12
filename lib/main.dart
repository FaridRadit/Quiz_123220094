import 'package:flutter/material.dart';
import 'package:kuis_h/model/movie_model.dart';
import 'pages/movie_list_page.dart';
import 'pages/login.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    onGenerateRoute: (settings) {
        if (settings.name == '/MovieDetail') {
          final model = settings.arguments as MovieModel; 
          return MaterialPageRoute(
            builder: (context) => MovieDetail(model: model), 
          );
        }
        return MaterialPageRoute(builder: (context) => LoginScreen());
      },
    );
  }
}
