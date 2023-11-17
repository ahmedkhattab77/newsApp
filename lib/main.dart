import 'package:flutter/material.dart';
import 'package:untitled/ui/home_view.dart';
import 'package:untitled/ui/news/details/new_deliles.dart';
import 'package:untitled/ui/search/searsh_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor:  Color(0xff39A552),
            centerTitle: true,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
            iconTheme: IconThemeData(color: Colors.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ))),
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          primary: const Color(0xff39A552),
          seedColor: const Color(0xff39A552),
        ),
       ),
      routes: {
        HomeView.routeName : (context)=> HomeView(),
        NewDetails.routeName :( context)=>  NewDetails(),
        SearchView.routeName:(context)=> SearchView(),
      },
      initialRoute: HomeView.routeName,
    );
  }
}
