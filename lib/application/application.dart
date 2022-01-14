import 'package:dream_bit_cats/ui/pages/home_page/bloc/home_page_bloc.dart';
import 'package:dream_bit_cats/ui/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomePageBloc>(
      create: (_) => HomePageBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
