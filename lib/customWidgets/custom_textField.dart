import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
   CustomTextField({Key? key,this.hintText,this.prefixIcon,this.onchange}) : super(key: key);
   String? hintText;
   Widget? prefixIcon;
   Function(String)? onchange;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      validator: (data){
        if(data!.isEmpty)
          return 'field is required';
      },
      onChanged:onchange,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(22),borderSide: BorderSide(color: Colors.black))
      ),
    );
  }
}

