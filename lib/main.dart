import 'package:dynamic_list/bloc.dart';
import 'package:dynamic_list/multi_contact_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ItemInfoCubit(),child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dynamic TextFormField',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MultiContactFormWidget(),
    ),);
  }
}