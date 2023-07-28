import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/const.dart';
import 'package:first_app/customWidgets/custom_button.dart';
import 'package:first_app/customWidgets/custom_textField.dart';
import 'package:first_app/customWidgets/snackBar.dart';
import 'package:first_app/pages/Register_page.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
   login({Key? key}) : super(key: key);
  String? email,password;
  GlobalKey<FormState>formkey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                      fontSize: 35, color: kcolor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  'login now to enjoy our services',
                  style: TextStyle(
                      color: Colors.black12.withOpacity(.3),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onchange: (data){
                    email=data;
                  },
                  hintText: 'email',
                  prefixIcon: Icon(Icons.email),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  onchange: (data){
                    password=data;
                  },
                  hintText: 'password',
                  prefixIcon: Icon(Icons.lock),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  ontap: ()async{
                    if(formkey.currentState!.validate()){
                    try {
                      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email!,
                          password: password!
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, 'No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(
                            context, 'Wrong password provided for that user.');
                      }
                    }
                    }
                  },
                  text: 'Login',
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an acount ? ',
                      style: TextStyle(color: Colors.black.withOpacity(.5)),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Register(),));
                      },
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: kcolor),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      height: 100,
                      color: Colors.black,
                      endIndent: 10,
                    )),
                    Text('OR'),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        height: 100,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Login with media acounts:',
                  style: TextStyle(color: kcolor, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        'G',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    Icon(Icons.apple),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
