import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _launchUrl(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: GlassContainer(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.40),
                      Colors.white.withOpacity(0.10)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.60),
                      Colors.white.withOpacity(0.10),
                      Colors.lightBlueAccent.withOpacity(0.05),
                      Colors.lightBlueAccent.withOpacity(0.6)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.39, 0.40, 1.0],
                  ),
                  blur: 10.0,
                  borderWidth: 1.5,
                  borderRadius: BorderRadius.circular(15.0),
                  elevation: 3.0,
                  isFrostedGlass: true,
                  shadowColor: Colors.black.withOpacity(0.20),
                  alignment: Alignment.center,
                  frostedOpacity: 0.12,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        foregroundImage: AssetImage('images/prof.png'),
                        radius: 50.0,
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'آموزش برنامه نویسی | فلاتریها',
                        style: TextStyle(
                          fontFamily: 'BTitr',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  elevation: 6.0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15.0),
                                      // تصاویر اسلایدی طبق لیست آیتم به شکل زیر نمایش داده میشه
                                      // image: DecorationImage(
                                      //   image: AssetImage('assets/images/$i.png'),
                                      //   fit: BoxFit.cover,
                                      // ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'نمونه کار شماره $i',
                                        style: const TextStyle(
                                          fontFamily: 'BTitr',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GlassContainer(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.40),
                      Colors.white.withOpacity(0.10)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.60),
                      Colors.white.withOpacity(0.10),
                      Colors.lightBlueAccent.withOpacity(0.05),
                      Colors.lightBlueAccent.withOpacity(0.6)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: const [0.0, 0.39, 0.40, 1.0],
                  ),
                  blur: 10.0,
                  borderWidth: 1.5,
                  borderRadius: BorderRadius.circular(15.0),
                  elevation: 3.0,
                  isFrostedGlass: true,
                  shadowColor: Colors.black.withOpacity(0.20),
                  alignment: Alignment.center,
                  frostedOpacity: 0.12,
                  margin: const EdgeInsets.all(20.0),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomCard(
                        title: 'tel',
                        icon: const Icon(Icons.phone),
                        onTap: () => _launchUrl(Uri.parse('tel:+98938693940')),
                      ),
                      CustomCard(
                        title: 'whatsapp',
                        icon: const Icon(Icons.phone),
                        onTap: () => _launchUrl(Uri.parse('tel:+98938693940')),
                      ),
                      CustomCard(
                        title: 'insta',
                        icon: const Icon(Icons.phone),
                        onTap: () => _launchUrl(Uri.parse('tel:+98938693940')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;

  const CustomCard({
    required this.title,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: InkWell(
        onTap: onTap,
        child: Image(
          image: AssetImage('images/$title.png'),
        ),
      ),
    );
  }
}
