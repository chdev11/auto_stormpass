import 'package:flutter/material.dart';

class UiTextField extends StatelessWidget {
  final String hint;
  final IconData? prefix;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const UiTextField({
    super.key,
    required this.hint,
    this.prefix,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: defaultBorder(),
          enabledBorder: defaultBorder(),
          hintText: hint,
          prefixIcon: prefix != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(prefix, color: Colors.white),
                )
              : null,
        ));
  }

  defaultBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
