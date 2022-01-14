import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String appBarTitle;
  final bool canPop;
  final Widget body;

  const MainLayout({
    required this.appBarTitle,
    required this.canPop,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return canPop;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: body,
        ),
      ),
    );
  }
}
