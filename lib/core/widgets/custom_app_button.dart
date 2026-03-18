import 'package:flutter/material.dart';
class CustomAppButton extends StatelessWidget {
  const CustomAppButton({super.key, required this.text, this.onTap});
final String text;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            minimumSize: Size(double.infinity, 70),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(12)
            )

        ),
        onPressed: onTap, child: Text(text,style: TextStyle(
      fontFamily: 'Mon',
      fontSize: 25,
      color: Colors.white
    ),));
  }
}
