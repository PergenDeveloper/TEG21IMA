import 'package:eglimpia/constants/colors.dart';
import 'package:eglimpia/data/users.dart';
import 'package:eglimpia/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                _headerText(),
                SizedBox(height: 20),
                _slogan(),
                SizedBox(height: 40),
                _emailField(),
                SizedBox(height: 15),
                _passwordField(),
                SizedBox(height: 20),
                _loginButton(),
                SizedBox(height: 50),
                Row(
                  children: [
                    Text(
                      "¿No tienes cuenta?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: _navigateToSignup,
                      child: Text(
                        "Regístrate",
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsTheme.primary,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _headerText() {
    return Container(
      child: Text(
        "EGLimpia",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: ColorsTheme.primary,
        ),
      ),
    );
  }

  Column _slogan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Cuidar tu ciudad,",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: ColorsTheme.primary,
            ),
          ),
        ),
        Container(
          child: Text(
            "es cuidar tu futuro.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w100,
              color: ColorsTheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Column _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Correo electrónico",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 5),
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            keyboardAppearance: Brightness.light,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              this.email = value;
            },
          ),
        ),
      ],
    );
  }

  Column _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Contraseña",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.only(right: 15, left: 15, bottom: 5),
          decoration: BoxDecoration(
            color: ColorsTheme.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            obscureText: true,
            keyboardAppearance: Brightness.light,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              this.password = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: _navigateToHome,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: ColorsTheme.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            "Iniciar sesión",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToHome() async {
    EasyLoading.show(maskType: EasyLoadingMaskType.custom);
    final result = await login(this.email, this.password);

    Future.delayed(Duration(seconds: 1), () {
      if (!result) {
        EasyLoading.dismiss();
        showErrorMessage(context, "Las credenciales no son correctas");
        return;
      }
      EasyLoading.dismiss();
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  void _navigateToSignup() {
    Navigator.pushReplacementNamed(context, '/signup');
  }
}
