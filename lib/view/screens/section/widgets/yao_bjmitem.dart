import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mdc_anies/model/yao_data.dart';
import 'package:mdc_anies/view/screens/section/widgets/yao_all.dart';
import 'package:mdc_anies/view/screens/section/yao_bjm.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class YaoBjmItem extends StatefulWidget {
  const YaoBjmItem({Key? key}) : super(key: key);

  @override
  State<YaoBjmItem> createState() => _YaoBjmItemState();
}

class _YaoBjmItemState extends State<YaoBjmItem> {
  int activeIndex = 0;
  int videoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Berita Terkini',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const YaoAll()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4.0),
                      height: 30.0,
                      color: const Color(0xffC9E4FC),
                      child: const Text(
                        'See All',
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xffF13434)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              buildTerkini(),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Video Terkini',
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const YaoAll()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(4.0),
                      height: 30.0,
                      color: const Color(0xffC9E4FC),
                      child: const Text(
                        'See All',
                        style:
                            TextStyle(fontSize: 16.0, color: Color(0xffF13434)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              buildVideoTerkini()
            ]),
      ),
    );
  }

  Column buildVideoTerkini() {
    return Column(
      children: [
        Column(
          children: [
            CarouselSlider.builder(
              itemCount: jdlTerkini.length,
              itemBuilder: (context, index, realIndex) {
                late final urlImage = videoTerkini[index];
                late final jdlArtikel = jdlTerkini[index];
                late final myKategori = categoryList[index];

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => YaoBjm(
                                      category: myKategori,
                                      imgUrl: videoTerkini[index],
                                      judul: jdlTerkini[index],
                                    )));
                      },
                      child: Container(
                        height: 174.0,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              14.0,
                            ),
                            image: DecorationImage(
                                image: NetworkImage(urlImage),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_circle,
                            size: 40,
                            color: Colors.red,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, bottom: 10.0, right: 18.0, top: 10.0),
                          child: Text(
                            jdlArtikel,
                            style: TextStyle(
                              backgroundColor: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  // reverse: true,
                  viewportFraction: 1,
                  autoPlayInterval: const Duration(seconds: 4),
                  onPageChanged: (index, reason) =>
                      setState(() => videoIndex = index)),
            ),
            const SizedBox(
              height: 22.0,
            ),
            AnimatedSmoothIndicator(
              activeIndex: videoIndex,
              count: jdlTerkini.length,
            ),
          ],
        )
      ],
    );
  }

  Widget buildTerkini() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: urlImgTerkini.length,
          itemBuilder: (context, index, realIndex) {
            late final urlImage = urlImgTerkini[index];
            late final jdlArtikel = jdlTerkini[index];
            late final myKategori = categoryList[index];
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => YaoBjm(
                                  category: myKategori,
                                  imgUrl: urlImgTerkini[index],
                                  judul: jdlTerkini[index],
                                )));
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 174.0,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          14.0,
                        ),
                        image: DecorationImage(
                            image: NetworkImage(urlImage), fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 18.0, bottom: 10.0, right: 18.0),
                  child: Text(
                    jdlArtikel,
                    style: TextStyle(
                      backgroundColor: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: false,
              // reverse: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index)),
        ),
        const SizedBox(
          height: 22.0,
        ),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: urlImgTerkini.length,
        ),
      ],
    );
  }
}
