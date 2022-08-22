import 'package:flutter/material.dart';

class YaoBjm extends StatelessWidget {
  final String imgUrl;
  final String judul;
  final String category;
  const YaoBjm(
      {Key? key,
      required this.imgUrl,
      required this.judul,
      required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xff2C6294),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    'Selasa, 28 Juni 2022',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                judul,
                style: const TextStyle(
                    fontSize: 18.0,
                    color: Color(0xffF13434),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "By Yaomink",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff2C6294),
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'jam: 20.00pm',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 312,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgUrl), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: Text(
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nibh sed fringilla morbi semper. Dolor, dictumst accumsan, aliquam convallis sapien augue. Luctus ullamcorper tortor hendrerit odio. A orci neque ornare non est mattis mauris diam ut. Porttitor imperdiet sit tellus lectus pellentesque. Aliquam turpis morbi et euismod ligula id ipsum quis non. Enim vulputate mattis semper est dignissim amet enim tincidunt ut. Sit malesuada nunc suspendisse pulvinar posuere. Eget ultrices ut ac et gravida parturient eget nullam malesuada. Varius porttitor sem nisl sagittis accumsan ultrices adipiscing.''',
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        )));
  }
}
