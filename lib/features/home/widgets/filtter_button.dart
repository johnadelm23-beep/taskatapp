import 'package:flutter/material.dart';
class FiltterButton extends StatelessWidget {
  const FiltterButton({super.key, required this.text,  this.isActive=false, this.onTap});
final String text;
final void Function()? onTap;
final bool isActive;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),color:isActive? Colors.indigo:Colors.transparent,
            border: Border.all(color: Colors.indigo)
        ),
        child: Text(text,style: TextStyle(
          fontSize: 18,
          color: isActive?Colors.white:Colors.black
        ),),
      ),
    );
  }
}
