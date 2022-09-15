import 'package:flutter/material.dart';

class TextFieldCostum extends StatelessWidget {
  final TextEditingController controller;
  final double? width;
  final String? titel;
  final String? hintText;
  final String? info;
  final IconData? icon;
  final String? Function(String?)? validator;
  const TextFieldCostum({
    super.key,
    required this.controller,
    this.titel,
    this.hintText,
    this.width,
    this.icon,
    this.info,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              labelText: titel,
              hintText: hintText,
              alignLabelWithHint: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              isDense: true,
              suffixIcon: Icon(icon),
            ),
          ),
        ],
      ),
    );
  }
}
