import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:umdb_app/screens/detail_screen.dart';

class Test extends StatefulWidget {
  final List popular;
  final List topRated;
  final List upComing;
  final List tvPopular;

  const Test({
    super.key,
    required this.popular,
    required this.topRated,
    required this.upComing,
    required this.tvPopular,
  });

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(
          top: 5,
        ),
        child: ListView(
          children: [
            SizedBox(
              //      color: Colors.yellow,
              height: 25,
              width: double.infinity,
              child: Text(
                'Popular',
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              //     color: Colors.yellow,
              height: 380,
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: widget.popular.length,
                itemBuilder: (context, index, realIndex) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            banner: ('https://image.tmdb.org/t/p/w500/' +
                                widget.popular[index]['backdrop_path']),
                            poster: ('https://image.tmdb.org/t/p/w500/' +
                                widget.popular[index]['poster_path']),
                            name: (widget.popular[index]['original_title'] ??
                                'Loading..'),
                            vote: (widget.popular[index]['vote_average'].toString()),
                            text: (widget.popular[index]['overview'] ?? 'Loading..'),
                            count: (widget.popular[index]['vote_count'].toString() ?? 'Loading..'),
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: 380,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/' +
                                    widget.popular[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 7,
                          right: 7,
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            height: 35,
                            width: 90,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)
                                        //topRight: Radius.circular(20),
                                        // bottomRight: Radius.circular(8),
                                        ),
                                color: Color.fromRGBO(0, 0, 0, 0.5)),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      //color: Colors.yellow,
                                      image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/star.png',
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  widget.popular[index]['vote_average'].toString() +
                                      '/10',
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 380,
                  enlargeCenterPage: true,
                  initialPage: 0,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.easeOut,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  viewportFraction: 0.75,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnTouch: true,
                ),
              ),
            ),
            SizedBox(
              //      color: Colors.yellow,
              height: 25,
              width: double.infinity,
              child: Text(
                'Top Rated',
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              //     color: Colors.yellow,
              height: 237.5,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.topRated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            banner: ('https://image.tmdb.org/t/p/w500/' +
                                widget.topRated[index]['backdrop_path']),
                            poster: ('https://image.tmdb.org/t/p/w500/' +
                                widget.topRated[index]['poster_path']),
                            name: (widget.topRated[index]['original_title'] ??
                                'Loading..'),
                            vote: (widget.topRated[index]['vote_average'].toString()),
                            text: (widget.topRated[index]['overview'] ?? 'Loading..'),
                            count: (widget.topRated[index]['vote_count'].toString() ??
                                'Loading..'),
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          height: 237.5,
                          width: 156.25,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/' +
                                    widget.topRated[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              //      color: Colors.yellow,
              height: 25,
              width: double.infinity,
              child: Text(
                'Upcoming Movies',
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            SizedBox(
              //
              height: 150,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.upComing.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            banner: ('https://image.tmdb.org/t/p/w500/' +
                                widget.upComing[index]['backdrop_path']),
                            poster: ('https://image.tmdb.org/t/p/w500/' +
                                widget.upComing[index]['poster_path']),
                            name: (widget.upComing[index]['original_title'] ??
                                'Loading..'),
                            vote: (widget.upComing[index]['vote_average'].toString()),
                            text: (widget.upComing[index]['overview'] ?? 'Loading..'),
                            count: (widget.upComing[index]['vote_count'].toString() ??
                                'Loading..'),
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/' +
                                    widget.upComing[index]['backdrop_path'],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            color: Colors.black38,
                            height: 30,
                            width: 250,
                            child: Text(
                              widget.upComing[index]['title'],
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              //      color: Colors.yellow,
              height: 25,
              width: double.infinity,
              child: Text(
                'Popular TV Shows',
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              height: 480,
              width: double.infinity,
              // color: Colors.yellow,
              child: GridView.builder(
                itemCount: widget.tvPopular.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      // height: 237.5,
                      // width: 156.25,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/' +
                                widget.tvPopular[index]['poster_path'],
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            banner: ('https://image.tmdb.org/t/p/w500/' +
                                widget.tvPopular[index]['backdrop_path']),
                            poster: ('https://image.tmdb.org/t/p/w500/' +
                                widget.tvPopular[index]['poster_path']),
                            name: (widget.tvPopular[index]['name'] ?? 'Loading..'),
                            vote: (widget.tvPopular[index]['vote_average'].toString()),
                            text: (widget.tvPopular[index]['overview'] ?? 'Loading..'),
                            count: (widget.tvPopular[index]['vote_count'].toString() ??
                                'Loading..'),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
