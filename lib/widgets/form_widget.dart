import 'package:flutter/material.dart';

import 'textformfield_costum.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    required this.formKey,
    required this.namaC,
    required this.stbC,
    required this.majorC,
    required this.genderC,
    required this.addressC,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController namaC;
  final TextEditingController stbC;
  final TextEditingController majorC;
  final TextEditingController genderC;
  final TextEditingController addressC;

  @override
  Widget build(BuildContext context) {
    majorC.text = "Teknik Informatika";
    genderC.text = "Laki-laki";
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFieldCostum(
            controller: namaC,
            titel: "Nama",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some Nama';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFieldCostum(
            controller: stbC,
            titel: "STB",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some STB';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
            value: majorC.text,
            items: const [
              DropdownMenuItem(
                value: "Teknik Informatika",
                child: Text("Teknik Informatika"),
              ),
              DropdownMenuItem(
                value: "Sistem Informatika",
                child: Text("Sistem Informatika"),
              ),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some Major';
              }
              return null;
            },
            onChanged: (value) {
              majorC.text = value!;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          DropdownButtonFormField<String>(
            value: genderC.text,
            items: const [
              DropdownMenuItem(
                value: "Laki-laki",
                child: Text("Laki-laki"),
              ),
              DropdownMenuItem(
                value: "Perempuan",
                child: Text("Perempuan"),
              ),
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some Major';
              }
              return null;
            },
            onChanged: (value) {
              genderC.text = value!;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFieldCostum(
            controller: addressC,
            titel: "Address",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some Address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
