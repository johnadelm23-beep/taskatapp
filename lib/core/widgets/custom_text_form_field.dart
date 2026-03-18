import 'package:flutter/material.dart';
class CustomTextFormField extends StatelessWidget {
 const CustomTextFormField({super.key, required this.hintText,required this.validator, required this.controller, this.maxLines,  this.readOnly=false, this.onTap, this.suffixIcon});
final String hintText;
final TextEditingController controller;
final String? Function(String?) validator;
final int? maxLines;
final bool readOnly;
final void Function()? onTap;
final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,

      readOnly: readOnly,
    maxLines:maxLines ,
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
        suffixIcon:suffixIcon ,
        hintText: hintText,
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
