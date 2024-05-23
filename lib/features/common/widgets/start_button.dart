import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final String? path;
  //final VoidCallback? onPressed;

  const StartButton({super.key,
    required this.text, required this.width, required this.height, required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFFE5B26D),
        minimumSize: Size(width, height),
        side: BorderSide(color: Color(0xFFB05A20), width: 2),
      ),
        onPressed: (path != null ? () {
          Navigator.pushNamed(context, path!);
        } : null),
      child: Text(text,
    style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          fontSize: height * 0.31,
          color: Color(0xFFB05A20),
    ),
    ),
    );
  }
}
