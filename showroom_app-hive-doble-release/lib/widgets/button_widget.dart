import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ElevatedButton(
      style:  ButtonStyle(
          shape: const MaterialStatePropertyAll(StadiumBorder()),
          backgroundColor: MaterialStatePropertyAll(colors.primary), 
          elevation: const MaterialStatePropertyAll(0)),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
            color: Colors.white.withOpacity(0.9)),
      ),
    );
  }
}
