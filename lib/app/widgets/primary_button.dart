import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.isLoading = false,
      this.isEnabled = true,
      this.backgroundColor,
      this.height,
      this.width,
      this.textColor})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  final bool isLoading;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          minimumSize: Size(width ?? double.infinity, height ?? 45),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: isEnabled
          ? isLoading
              ? () {}
              : onPressed
          : null,
      child: isLoading
          ? loadingWidget
          : Text(text,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
    );
  }

  final loadingWidget = const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(color: Colors.white));
}
