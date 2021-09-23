import 'package:flutter/material.dart';
import 'package:google_api/app/components/manager_aplication_bloc.dart';
import 'package:google_api/app/const.dart';
import 'package:google_api/app/screens/login_page_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ManagerAplicationBloc(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
          //primaryColor: kPrimaryColor,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginPageScreen(),
      ),
    );
  }
}