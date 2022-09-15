import 'dart:convert';
import 'dart:developer';

import 'package:flutter_get_api/home/models/model_mahasiswa.dart';
import 'package:http/http.dart' as http;

class MahasiswaProvider {
  static const baseUrl = 'http://192.168.217.128:5000/api/v1/mahasiswa';

  static Future<List<Mahasiswa>> getAllData() async {
    var data = <Mahasiswa>[];
    try {
      final response = await http.get(Uri.parse(baseUrl));
      data = mahasiswaFromJson(response.body);
    } catch (e) {
      log(e.toString());
    }
    return data;
  }

  static Future<void> updateData(Mahasiswa mahasiswa) async {
    try {
      final url = "$baseUrl/${mahasiswa.id}";
      final headers = {"Content-type": "application/json"};
      final response = await http.patch(
        Uri.parse(url),
        headers: headers,
        body: json.encode(mahasiswa.toJson()),
      );
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> deleteData(Mahasiswa mahasiswa) async {
    try {
      final url = "$baseUrl/${mahasiswa.id}";
      final headers = {"Content-type": "application/json"};
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> inputData(Mahasiswa mahasiswa) async {
    try {
      final headers = {"Content-type": "application/json"};
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: headers,
        body: json.encode(mahasiswa.toJson()),
      );
      log(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
