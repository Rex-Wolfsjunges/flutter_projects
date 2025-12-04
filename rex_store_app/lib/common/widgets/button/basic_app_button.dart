import "package:flutter/material.dart";

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? width;
  final double? height;

  const BasicAppButton({
    required this.onPressed,
    this.title = "",
    this.content,
    this.width,
    this.height,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ),
      ),
      child: content ?? Text(
        title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
      )
    );
  }
}
