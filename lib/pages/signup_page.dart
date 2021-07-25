import 'package:eglimpia/constants/colors.dart';
import 'package:eglimpia/data/users.dart';
import 'package:eglimpia/models/user_model.dart';
import 'package:eglimpia/utils/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? name;
  String? phone;
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
                _nameField(),
                SizedBox(height: 15),
                _phoneField(),
                SizedBox(height: 15),
                _emailField(),
                SizedBox(height: 15),
                _passwordField(),
                SizedBox(height: 20),
                _signupButton(),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "¿Ya tienes cuenta?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 20),
                    InkWell(
                      onTap: _navigateToLogin,
                      child: Text(
                        "Inicia sesión",
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorsTheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
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

  Column _nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Nombre",
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
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              this.name = value;
            },
          ),
        ),
      ],
    );
  }

  Column _phoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "Teléfono",
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
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            onChanged: (value) {
              this.phone = value;
            },
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

  Widget _signupButton() {
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
            "Registrarse",
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
    if (name == null || name!.isEmpty) {
      // Show dialog error title
      showErrorMessage(context, "El campo nombre es obligatorio");
      return;
    }

    if (phone == null || phone!.isEmpty) {
      // Show dialog error description
      showErrorMessage(context, "El campo teléfono es obligatorio");
      return;
    }

    if (email == null || email!.isEmpty) {
      // Show dialog error city
      showErrorMessage(context, "El campo Correo electrónico es obligatorio");
      return;
    }

    if (password == null || password!.isEmpty) {
      // Show dialog error maxPeople
      showErrorMessage(context, "El campo contraseña es obligatorio");
      return;
    }

    EasyLoading.show(maskType: EasyLoadingMaskType.custom);
    final user = UserModel(
      name: this.name,
      phone: this.phone,
      email: this.email,
      password: this.password,
    );
    final result = await addUser(user);

    Future.delayed(Duration(seconds: 1), () {
      if (!result) {
        EasyLoading.dismiss();
        showErrorMessage(
          context,
          "Ya existe usuario con este correo electrónico",
        );
        return;
      }
      EasyLoading.dismiss();
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
