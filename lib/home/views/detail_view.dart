import 'package:flutter/material.dart';
import 'package:flutter_get_api/home/models/model_mahasiswa.dart';
import 'package:flutter_get_api/home/providers/mahasiswa_provider.dart';
import 'package:flutter_get_api/utils/utils.dart';

import 'home_view.dart';
import 'update_view.dart';

class DetailView extends StatelessWidget {
  final Mahasiswa mahasiswa;
  const DetailView({Key? key, required this.mahasiswa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mahasiswa.namaMhs),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(mahasiswa.namaMhs),
            Text(mahasiswa.stbMhs),
            Text(mahasiswa.majorMhs),
            Text(mahasiswa.addressMhs),
            Text(mahasiswa.genderMhs),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Router.routerPush(
                        UpdateVIew(
                          mahasiswa: mahasiswa,
                        ),
                        context,
                      );
                    },
                    child: const Text("Update"),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      await MahasiswaProvider.deleteData(mahasiswa);
                      // ignore: use_build_context_synchronously
                      Router.routerPush(const HomeView(), context);
                    },
                    child: const Text("Delete"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
