import 'package:flutter/material.dart';
import 'package:google_api/app/const.dart';

import 'google_map_screen.dart';

class LoginPageScreen extends StatefulWidget {
  @override
  _LoginPageScreenState createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kSpacing * 2),
            child: Column(
              children: [
                _buildImage(),
                _buildUserTextField(),
                _buildPasswordTextField(),
                _buildElevatedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(){
    return Image.asset('images/logo.png');
  }

  Widget _buildUserTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        hintText: 'Usuário',
        prefixIcon: Icon(Icons.person),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kSpacing),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
        decoration: InputDecoration(
          hintText: 'Senha',
          prefixIcon: Icon(Icons.password),
        ),
      ),
    );
  }

  Widget _buildElevatedButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF613385),
        minimumSize: Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(180),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => GoogleMapScreen()),
        );
      },
      child: Text('Sign in'),
    );
  }
}
