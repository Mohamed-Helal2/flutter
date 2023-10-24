import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formstate1 = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Form(
          key: formstate1,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset("assets/flutter.png"),
// Email
              Custom_Textform(
                hint: "Email",
                controller: email,
                validator: (value) {
                  if (value == "") {
                    return "Enter Email";
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
// password
              Custom_Textform(
                hint: "Passsword",
                controller: password,
                validator: (value) {
                  if (value == "") {
                    return "Enter Password";
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
// forget
              Text(
                "Forget Password",
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
              SizedBox(
                height: 15,
              ),
// Log In
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                width: 250,
                child: MaterialButton(
                  onPressed: () {
                    if (formstate1.currentState!.validate()) {
                      print("Every things Ok");
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Text(
                "New User? Create Account",
                style: TextStyle(),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class Custom_Textform extends StatelessWidget {
  String? Function(String?)? validator;
  final String hint;
  final TextEditingController? controller;
  Custom_Textform({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration:
            InputDecoration(hintText: hint, border: OutlineInputBorder()),
        validator: validator);
  }
}
