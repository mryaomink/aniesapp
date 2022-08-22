import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mdc_anies/controller/firebase_api.dart';
import 'package:mdc_anies/view/screens/section/widgets/yao_nav.dart';
import 'package:path/path.dart';
import '../../controller/google_sheet.dart';
import '../../controller/sheet_column.dart';

class YaoInput extends StatefulWidget {
  const YaoInput({Key? key}) : super(key: key);

  @override
  State<YaoInput> createState() => _YaoInputState();
}

class _YaoInputState extends State<YaoInput> {
  TextEditingController nikController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController kabController = TextEditingController();
  TextEditingController kecController = TextEditingController();
  TextEditingController provController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  UploadTask? uploadTask;
  File? file;

  _YaoInputState() {
    _selectedValue = _myKabupaten[0];

    _kecValue = _myKeca[0];
  }

  final _myKabupaten = ["Banjarmasin", "Kandangan", "Rantau", "Barabai"];

  final _myKeca = [
    "Banjarmasin Timur",
    "Banjarmasin Barat",
    "Banjarmasin Utara"
  ];
  String _selectedValue = "";
  String _kecValue = "";

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    uploadTask = FirebaseApi.uploadFile(destination, file!);
    setState(() {});

    if (uploadTask == null) return;

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No Files ';
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.black,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: pilihFile,
                        icon: const Icon(
                          Icons.cloud_upload,
                          color: Colors.red,
                          size: 40.0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Pilih Foto KTP',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        onPressed: uploadFile,
                        icon: Icon(Icons.upload_file),
                        label: Text('Upload'),
                      ),
                      SizedBox(height: 20),
                      uploadTask != null
                          ? buildUploadStatus(uploadTask!)
                          : Container(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nikController,
                  decoration: const InputDecoration(
                      hintText: "NIK", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "Nama Relawan", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: alamatController,
                  decoration: const InputDecoration(
                      label: Text('Alamat(optional)'),
                      hintText: "Alamat",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _selectedValue,
                  items: _myKabupaten
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectedValue = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.red,
                  ),
                  decoration: InputDecoration(
                    labelText: "Kabupaten/Kota",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: _kecValue,
                  items: _myKeca
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _kecValue = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.red,
                  ),
                  decoration: InputDecoration(
                    labelText: "Kecamatan",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                      hintText: "No. Handphone", border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      final data = {
                        SheetColumn.nik: nikController.text.trim(),
                        SheetColumn.nama: nameController.text.trim(),
                        SheetColumn.alamat: alamatController.text.trim(),
                        SheetColumn.kabupaten: _selectedValue,
                        SheetColumn.telepon: phoneController.text.trim(),
                        SheetColumn.kecamatan: _kecValue,
                      };
                      await GoogleSheet.insert([data]).then((value) =>
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const YaoNav(),
                              ),
                            );
                          }));
                    },
                    child: const Text('Submit Data'),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future pilihFile() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: false, allowCompression: true);
    if (result == null) return;
    final path = result.files.single.path!;
    setState(() {
      file = File(path);
    });
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage % Berhasil Upload',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            );
          } else {
            return Container();
          }
        },
      );
}
