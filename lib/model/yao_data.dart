final List<String> sections = [
  "Banjarmasin",
  "Banjarbaru",
  "Rantau",
  "Kandangan",
  "Barabai",
  "Tanjung"
];

final List<String> urlImgTerkini = [
  "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
  "https://images.unsplash.com/photo-1656137632241-966f1a984c1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80",
  "https://images.unsplash.com/photo-1496939217462-7d42e9a74f0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1475721027785-f74eccf877e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1585719022717-87adb5bc279d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
];
final List<String> videoTerkini = [
  "https://images.unsplash.com/photo-1554774853-aae0a22c8aa4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1656137632241-966f1a984c1b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80",
  "https://images.unsplash.com/photo-1496939217462-7d42e9a74f0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1475721027785-f74eccf877e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1585719022717-87adb5bc279d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
];
final jdlTerkini = [
  "Anies Meningkatkatkan Kesejahteraan Para Wartawan",
  "Anies Calon Pemimpin yang Teladan dan Amanah",
  "Anies Menjadi Sorotan semua media karena kepintarannya",
  "Anies punya hobi yang tak kalah dengan Anak muda",
  "Anies Mendukung Kemajuan Teknologi untuk Para Programmer",
];

final categoryList = [
  'Teknologi',
  'Politik',
  'Teknologi',
  'Politik',
  'Politik'
];

class BeritaTerkini {
  String? judul;
  String? category;
  String? time;
  String? imgUrl;

  BeritaTerkini({
    this.category,
    this.judul,
    this.time,
    this.imgUrl,
  });

  List<BeritaTerkini> myLists = [
    BeritaTerkini(
        category: 'Politik',
        judul: 'Anies Meningkatkatkan Kesejahteraan Para Wartawan',
        time: '15.29pm',
        imgUrl:
            'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'),
    BeritaTerkini(
        category: 'Politik',
        judul: 'Anies Calon Pemimpin yang Teladan dan Amanah',
        time: '15.35pm',
        imgUrl:
            'https://images.unsplash.com/photo-1508921340878-ba53e1f016ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
  ];
}
