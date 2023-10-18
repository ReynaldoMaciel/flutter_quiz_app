import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onTap, super.key});

  final String text;
  final void Function() onTap;

  @override
  Widget build(context) {
    return TextButton(
      onPressed: onTap,
      style: const ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
        backgroundColor: MaterialStatePropertyAll(Color.fromARGB(139, 0, 0, 0)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
