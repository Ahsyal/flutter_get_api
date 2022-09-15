import 'package:flutter/material.dart';
import 'package:flutter_get_api/home/models/model_mahasiswa.dart';

import '../../utils/utils.dart';
import '../../widgets/form_widget.dart';
import '../providers/mahasiswa_provider.dart';
import 'home_view.dart';

class UpdateVIew extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const UpdateVIew({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final namaC = TextEditingController(text: mahasiswa.namaMhs);
    final stbC = TextEditingController(text: mahasiswa.stbMhs);
    final majorC = TextEditingController(text: mahasiswa.majorMhs);
    final genderC = TextEditingController(text: mahasiswa.genderMhs);
    final addressC = TextEditingController(text: mahasiswa.addressMhs);
    final formKey = GlobalKey<FormState>();

    Mahasiswa fromToMahasiswa() => Mahasiswa(
          id: mahasiswa.id,
          namaMhs: namaC.text,
          stbMhs: stbC.text,
          majorMhs: majorC.text,
          genderMhs: genderC.text,
          addressMhs: addressC.text,
        );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("Update")),
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
                  await MahasiswaProvider.updateData(fromToMahasiswa());
                  // ignore: use_build_context_synchronously
                  Utils.routerPush(const HomeView(), context);
                }
              },
              child: const Text("Update"),
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
