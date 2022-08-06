import 'package:flutter/material.dart';
import 'package:flutter_web_panel_starter/providers/page_builder_provider.dart';
import 'package:flutter_web_panel_starter/screens/PageBuilder/page_builder.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageBuilderProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Web Panel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: const PageBuilder(),
      ),
    );
  }
}
