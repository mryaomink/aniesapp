class RtOkeModel {
  bool? status;
  List<Data>? data;

  RtOkeModel({this.status, this.data});

  RtOkeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? idUser;
  String? noKk;
  String? noKtp;
  String? nama;
  String? alamatKtp;
  String? hp;
  String? ttl;
  String? idJk;
  String? idAgama;
  String? alamatSekarang;
  String? noRumah;
  String? idStatusRumah;
  String? pekerjaan;
  String? penghasilan;
  String? statusWarga;
  String? isWarga;
  String? keterangan;

  Data(
      {this.id,
      this.idUser,
      this.noKk,
      this.noKtp,
      this.nama,
      this.alamatKtp,
      this.hp,
      this.ttl,
      this.idJk,
      this.idAgama,
      this.alamatSekarang,
      this.noRumah,
      this.idStatusRumah,
      this.pekerjaan,
      this.penghasilan,
      this.statusWarga,
      this.isWarga,
      this.keterangan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    noKk = json['no_kk'];
    noKtp = json['no_ktp'];
    nama = json['nama'];
    alamatKtp = json['alamat_ktp'];
    hp = json['hp'];
    ttl = json['ttl'];
    idJk = json['id_jk'];
    idAgama = json['id_agama'];
    alamatSekarang = json['alamat_sekarang'];
    noRumah = json['no_rumah'];
    idStatusRumah = json['id_status_rumah'];
    pekerjaan = json['pekerjaan'];
    penghasilan = json['penghasilan'];
    statusWarga = json['status_warga'];
    isWarga = json['is_warga'];
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['no_kk'] = this.noKk;
    data['no_ktp'] = this.noKtp;
    data['nama'] = this.nama;
    data['alamat_ktp'] = this.alamatKtp;
    data['hp'] = this.hp;
    data['ttl'] = this.ttl;
    data['id_jk'] = this.idJk;
    data['id_agama'] = this.idAgama;
    data['alamat_sekarang'] = this.alamatSekarang;
    data['no_rumah'] = this.noRumah;
    data['id_status_rumah'] = this.idStatusRumah;
    data['pekerjaan'] = this.pekerjaan;
    data['penghasilan'] = this.penghasilan;
    data['status_warga'] = this.statusWarga;
    data['is_warga'] = this.isWarga;
    data['keterangan'] = this.keterangan;
    return data;
  }
}
