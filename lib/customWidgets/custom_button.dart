import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({Key? key,this.text,this.ontap}) : super(key: key);
    String? text;
    VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50,
        child: Center(
          child: Text(
            text! ,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20),
          ),),
        decoration: BoxDecoration(
          color: Color.fromRGBO(8, 14, 91, 1),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),

      ),
    );
  }
}
