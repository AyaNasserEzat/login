import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/const.dart';
import 'package:first_app/customWidgets/snackBar.dart';
import 'package:flutter/material.dart';

import '../customWidgets/custom_button.dart';
import '../customWidgets/custom_textField.dart';
class Register extends StatelessWidget {
   Register({Key? key}) : super(key: key);
 String? email,password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
     appBar: AppBar(
       leading: GestureDetector(onTap:(){ Navigator.pop(context);},child: Icon(Icons.arrow_back_ios,color: kcolor,)),
        backgroundColor: Colors.white,
        title: Text('Register page',style: TextStyle(color: kcolor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register ',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kcolor),
          ),
              SizedBox(height: 10,),
              Text(
                'Register now to enjoy our services',
                style: TextStyle(
                    color: Colors.black12.withOpacity(.3),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'name',
                prefixIcon: Icon(Icons.account_circle_rounded),
              ),
              const SizedBox(
                height: 16,
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
                  try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email!,
                      password: password!,
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showSnackBar(context,'The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      showSnackBar(context,'The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                text: 'Register',
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
