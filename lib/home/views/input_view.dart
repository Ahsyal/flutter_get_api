import 'package:flutter/material.dart';
import 'package:flutter_get_api/home/models/model_mahasiswa.dart';
import 'package:flutter_get_api/home/providers/mahasiswa_provider.dart';
import 'package:flutter_get_api/home/views/home_view.dart';
import 'package:flutter_get_api/router/router.dart';

import '../../widgets/form_widget.dart';

class InputView extends StatelessWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final namaC = TextEditingController();
    final stbC = TextEditingController();
    final majorC = TextEditingController();
    final genderC = TextEditingController();
    final addressC = TextEditingController();
    final formKey = GlobalKey<FormState>();

    Mahasiswa fromToMahasiswa() => Mahasiswa(
          namaMhs: namaC.text,
          stbMhs: stbC.text,
          majorMhs: majorC.text,
          genderMhs: genderC.text,
          addressMhs: addressC.text,
        );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Input")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FormWidget(
              formKey: formKey,
              namaC: namaC,
              stbC: stbC,
              majorC: majorC,
              genderC: genderC,
              addressC: addressC,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await MahasiswaProvider.inputData(fromToMahasiswa());
                  // ignore: use_build_context_synchronously
                  Router.routerPush(const HomeView(), context);
                }
              },
              child: const Text("Input"),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
