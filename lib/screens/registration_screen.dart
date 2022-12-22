import 'package:chat_app_firebase/components/rounded_button.dart';
import 'package:chat_app_firebase/constants.dart';
import 'package:chat_app_firebase/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RegistrationScreenState createState() => _RegistrationScreenState();
}
class _RegistrationScreenState extends State<RegistrationScreen> with SingleTickerProviderStateMixin{
 final _auth=FirebaseAuth.instance;
  late String email;
  late String passward;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent.withOpacity(controller.value),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: SizedBox(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                 email=value;
                },
                decoration: kTextfieldDecoration.copyWith(hintText: "Enter email")
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                onChanged: (value) {
                  passward=value;
                },
                decoration: kTextfieldDecoration.copyWith(hintText: "Enter "
                    "password",),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                loading: loading,
                title: "Register",
                colour: Colors.blueAccent,
                onpressed: () async{
                  setState(() {
                    loading=true;
                  });
                  try{
                    final newUser= await _auth.createUserWithEmailAndPassword(email:
                    email, password: passward);
                    if(newUser!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatScreen()));
                    }
                    setState(() {
                      loading=false;
                    });
                  }
                catch(e){
                    print(e);
                }
                },
              ),
            ],
          ),
        ),
    );
  }
}
