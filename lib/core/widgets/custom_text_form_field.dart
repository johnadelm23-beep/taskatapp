import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.hintText,required this.validator, required this.controller});
final String hintText;
final TextEditingController controller;
final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller:controller ,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(

        fontFamily: 'Mon',
        fontSize: 20
      ),
      onTapOutside: (v) {
        Focus.of(context).unfocus();

      },
      decoration: InputDecoration(
        hintText: "Enter your name",
          hintStyle: TextStyle(
            fontFamily: 'Mon',
            fontSize: 15,

          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.black)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.indigo)
          ),
          errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.red)
      ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        )
      ),
    );
  }
}
