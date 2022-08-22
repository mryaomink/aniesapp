import 'package:flutter/material.dart';
import 'package:mdc_anies/model/yao_data.dart';
import 'package:mdc_anies/view/screens/section/widgets/yao_bjmitem.dart';

class YaoHome extends StatefulWidget {
  const YaoHome({Key? key}) : super(key: key);

  @override
  State<YaoHome> createState() => _YaoHomeState();
}

class _YaoHomeState extends State<YaoHome> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/anlogo.png',
                    ),
                  ),
                  const Text(
                    'Media Center Anies Baswedan',
                    style: TextStyle(fontSize: 10.0),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search_outlined,
                      color: Color(0xff292424),
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 70.0,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: sections.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, i) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: TextButton(
                          onPressed: () {
                            _pageController.animateToPage(i,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: Text(
                            sections[i],
                            style: TextStyle(
                                color: currentPage == i
                                    ? Colors.red
                                    : Colors.black.withOpacity(0.6),
                                fontSize: currentPage == i ? 18.0 : 12.0),
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  children: const [
                    YaoBjmItem(),
                    Center(
                      child: Text('Banjarbaru'),
                    ),
                    Center(
                      child: Text('Rantau'),
                    ),
                    Center(
                      child: Text('Kandangan'),
                    ),
                    Center(
                      child: Text('Barabai'),
                    ),
                    Center(
                      child: Text('Tanjung'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
