import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.controller,
    this.hintText,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.validator,
    this.onChanged,
    this.maxLength,
    this.prefix,
    this.inputFormatters,
    this.textInputAction,
    this.labelText,
    this.showLabelOnTop = false,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType inputType;
  final bool isPassword;
  final Widget? prefix;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool showLabelOnTop;
  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    Widget child = TextFormField(
      obscureText: widget.isPassword && !passwordVisible,
      controller: widget.controller,
      keyboardType: widget.inputType,
      textInputAction: widget.textInputAction,
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      style: const TextStyle(fontFamily: 'Roboto'),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: widget.hintText,
        errorStyle: const TextStyle(color: Colors.red),
        labelText: !widget.showLabelOnTop ? widget.labelText : null,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        counterText: '',
        prefix: widget.prefix,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: _toggglePasswordVisibility,
                icon: Icon(passwordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined))
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
    if (widget.showLabelOnTop) child = _labelWraper(child: child);
    return child;
  }

  Widget _labelWraper({required Widget child}) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.labelText ?? '',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            child,
          ]);

  _toggglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
}
