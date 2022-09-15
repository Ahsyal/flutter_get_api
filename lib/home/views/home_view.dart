import 'package:flutter/material.dart';
import 'package:flutter_get_api/home/providers/mahasiswa_provider.dart';
import 'package:flutter_get_api/home/views/detail_view.dart';

import '../../utils/utils.dart';
import '../models/model_mahasiswa.dart';
import 'input_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: MahasiswaProvider.getAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListViewWidget(list: snapshot.data ?? []);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Router.routerPush(const InputView(), context);
      }),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final List<Mahasiswa> list;
  const ListViewWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        final data = list[index];
        return Card(
          child: ListTile(
            onTap: () => Router.routerPush(
              DetailView(
                mahasiswa: data,
              ),
              context,
            ),
            title: Text(data.namaMhs),
            subtitle: Text(data.stbMhs),
          ),
        );
      },
    );
  }
}
