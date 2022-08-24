import 'package:flutter/material.dart';

class DefaultFormField extends StatefulWidget {
  const DefaultFormField(
      {Key? key,
      required this.initialValue,
      this.textInputType = TextInputType.text,
      required this.formState,
      required this.iconPath,
      required this.hintText,
      this.validator,
      required this.controller,
      this.isPassword = false})
      : super(key: key);

  final TextEditingController controller;
  final String? initialValue;
  final TextInputType textInputType;
  final GlobalKey<FormState> formState;
  final String iconPath;
  final String hintText;
  final String? Function(String? value)? validator;
  final bool isPassword;

  @override
  _DefaultFormFieldState createState() => _DefaultFormFieldState();
}

class _DefaultFormFieldState extends State<DefaultFormField> {
  bool isVisible = true;

  bool _isVisible() => isVisible && widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: _isVisible(),
      obscuringCharacter: '•',
      initialValue: widget.initialValue,
      validator: widget.validator,
      decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.all(16),
          prefixIcon: ImageIcon(
            AssetImage(widget.iconPath),
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          suffixIcon: widget.isPassword
              ? InkResponse(
                  onTap: () => setState(() {
                    isVisible = !isVisible;
                  }),
                  child: ImageIcon(
                    AssetImage(isVisible
                        ? 'assets/icons/visible.png'
                        : 'assets/icons/invisible.png'),
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                )
              : null,
          fillColor: Theme.of(context).colorScheme.secondaryContainer,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hintStyle:
              const TextStyle(fontFamily: 'Gilroy', color: Color(0xFFABAFE5)),
          hintText: widget.hintText),
    );
  }
}
