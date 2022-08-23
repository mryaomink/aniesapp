import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mdc_anies/view/screens/section/widgets/upload_page.dart';
import 'package:mdc_anies/view/screens/section/widgets/yao_nav.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';

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
  TextEditingController errorController = TextEditingController();
  List<String> downloadUrl = <String>[];

  UploadTask? uploadTask;
  File? file;

  _YaoInputState() {
    _selectedValue = _myKabupaten[0];
  }

  final _myKabupaten = [
    "Kota Banjarmasin",
    "Kota Banjarbaru",
    "Balangan",
    "Barito Kuala",
    "Banjar(Martapura)",
    "HSS",
    "HST",
    "HSU",
    "Kotabaru",
    "Tabalong",
    "Tanah Bumbu",
    "Tanah Laut",
    "Tapin"
  ];

  String _selectedValue = "";

  uploadFile(PickedFile? pickedFile, String fileName) async {
    String pId = const Uuid().v4();
    Reference reference =
        FirebaseStorage.instance.ref().child('files/$fileName/ktp_$pId');
    await reference.putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    String value = await reference.getDownloadURL();
    downloadUrl.add(value);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'FORM PENDATAAN RELAWAN ANIES',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    'assets/images/anlogo.png',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            // Container(
            //   alignment: Alignment.center,
            //   width: MediaQuery.of(context).size.width,
            //   height: 250,
            //   decoration: const BoxDecoration(
            //     color: Colors.black,
            //     image: DecorationImage(
            //         image: NetworkImage(
            //             'https://static.thenounproject.com/png/3322766-200.png'),
            //         fit: BoxFit.cover),
            //   ),
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       IconButton(
            //         onPressed: pilihFile,
            //         icon: const Icon(
            //           Icons.camera_alt_outlined,
            //           color: Colors.red,
            //           size: 50.0,
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       const Text(
            //         'silahkan pilih gambar(tekan icon di atas)\ndan tekan tombol dibawah\nuntuk upload foto ktp',
            //         style: TextStyle(
            //           fontSize: 14.0,
            //           color: Colors.white,
            //           fontWeight: FontWeight.w400,
            //         ),
            //         textAlign: TextAlign.center,
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       ElevatedButton.icon(
            //         style: ElevatedButton.styleFrom(
            //           primary: Colors.red,
            //         ),
            //         onPressed: () {
            //           uploadFile;
            //         },
            //         icon: Icon(Icons.upload_file),
            //         label: Text('Upload'),
            //       ),
            //       SizedBox(height: 20),
            //       uploadTask != null
            //           ? buildUploadStatus(uploadTask!)
            //           : Container(),
            //     ],
            //   ),
            // ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 52.0,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UploadPage(),
                    ),
                  );
                },
                icon: Icon(Icons.upload),
                label: Text('Upload Foto KTP'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Nama", border: OutlineInputBorder()),
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
              controller: alamatController,
              decoration: const InputDecoration(
                  label: Text('Alamat (optional)'),
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
            // DropdownButtonFormField(
            //   value: _kecValue,
            //   items: _myKeca
            //       .map((e) => DropdownMenuItem(
            //             value: e,
            //             child: Text(e),
            //           ))
            //       .toList(),
            //   onChanged: (val) {
            //     setState(() {
            //       _kecValue = val as String;
            //     });
            //   },
            //   icon: const Icon(
            //     Icons.arrow_drop_down_circle_outlined,
            //     color: Colors.red,
            //   ),
            //   decoration: InputDecoration(
            //     labelText: "Kecamatan",
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            TextFormField(
                controller: kecController,
                decoration: const InputDecoration(
                  hintText: "Kecamatan",
                  border: OutlineInputBorder(),
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Data Harus diisi';
                  }
                  return null;
                }),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                  hintText: "No. Handphone (Wajib diisi)",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50.0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () async {
                  final data = {
                    SheetColumn.nik: nikController.text.trim(),
                    SheetColumn.nama: nameController.text.trim(),
                    SheetColumn.alamat: alamatController.text.trim(),
                    SheetColumn.kabupaten: _selectedValue,
                    SheetColumn.telepon: phoneController.text.trim(),
                    SheetColumn.kecamatan: kecController.text.trim(),
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
    )));
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
