import 'package:flutter/material.dart';
import 'package:mdc_anies/model/yao_terkini.dart';

class YaoAll extends StatefulWidget {
  const YaoAll({Key? key}) : super(key: key);

  @override
  State<YaoAll> createState() => _YaoAllState();
}

class _YaoAllState extends State<YaoAll> {
  List<YaoTerkini> terkini = [
    YaoTerkini(
        category: "Politik",
        judul: "The A - Z Of Politics",
        time: "jam 08.00am",
        imgUrl:
            "https://images.unsplash.com/photo-1554418651-70309daf95f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    YaoTerkini(
        category: "Hiburan",
        judul:
            "The Schola adalah orkestra kamar dari musisi paling terkenal di London.",
        time: "jam 07.00pm",
        imgUrl:
            "https://images.unsplash.com/photo-1567593810070-7a3d471af022?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"),
    YaoTerkini(
        category: "Teknologi",
        judul:
            "Perusahaan Bus Bijlmen menawarkan layanan dengan kualitas terbaik kepada pelanggan kami",
        time: "jam 10.00am",
        imgUrl:
            "https://images.unsplash.com/photo-1592898919095-e081b9689a09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    YaoTerkini(
        category: "Politik",
        judul: "The A - Z Of Politics",
        time: "jam 08.00am",
        imgUrl:
            "https://images.unsplash.com/photo-1554418651-70309daf95f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    YaoTerkini(
        category: "Hiburan",
        judul:
            "The Schola adalah orkestra kamar dari musisi paling terkenal di London.",
        time: "jam 07.00pm",
        imgUrl:
            "https://images.unsplash.com/photo-1567593810070-7a3d471af022?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"),
    YaoTerkini(
        category: "Teknologi",
        judul:
            "Perusahaan Bus Bijlmen menawarkan layanan dengan kualitas terbaik kepada pelanggan kami",
        time: "jam 10.00am",
        imgUrl:
            "https://images.unsplash.com/photo-1592898919095-e081b9689a09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    YaoTerkini(
        category: "Politik",
        judul: "The A - Z Of Politics",
        time: "jam 08.00am",
        imgUrl:
            "https://images.unsplash.com/photo-1554418651-70309daf95f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    YaoTerkini(
        category: "Hiburan",
        judul:
            "The Schola adalah orkestra kamar dari musisi paling terkenal di London.",
        time: "jam 07.00pm",
        imgUrl:
            "https://images.unsplash.com/photo-1567593810070-7a3d471af022?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"),
    YaoTerkini(
        category: "Teknologi",
        judul:
            "Perusahaan Bus Bijlmen menawarkan layanan dengan kualitas terbaik kepada pelanggan kami",
        time: "jam 10.00am",
        imgUrl:
            "https://images.unsplash.com/photo-1592898919095-e081b9689a09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: terkini.length,
                itemBuilder: (context, index) {
                  var mypost = terkini[index];
                  return Card(
                    child: ListTile(
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: NetworkImage(mypost.imgUrl.toString()),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xffC9E4FC),
                        ),
                        child: Text(
                          mypost.category.toString(),
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ),
                      subtitle: Text(
                        mypost.judul.toString(),
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                        maxLines: 2,
                      ),
                      trailing: Text(
                        mypost.time.toString(),
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
