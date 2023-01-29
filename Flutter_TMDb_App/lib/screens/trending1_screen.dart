import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_screen.dart';

class Trending1Screen extends StatelessWidget {
  final List trending1;

  const Trending1Screen({Key? key, required this.trending1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: CarouselSlider.builder(
            itemCount: trending1.length,
            itemBuilder: (context, index, realIndex) {
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        banner: ('https://image.tmdb.org/t/p/w500/' +trending1[index]['backdrop_path']),
                        poster: ('https://image.tmdb.org/t/p/w500/' +trending1[index]['poster_path']),
                        name: (trending1[index]['original_title']??'Loading..'),
                        vote: (trending1[index]['vote_average'].toString()),
                        text: (trending1[index]['overview']??'Loading..'),
                        count: (trending1[index]['vote_count'].toString()??'Loading..'),
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      // color: Colors.grey,
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/' +
                                trending1[index]['poster_path'],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 15),
                        color: const Color.fromRGBO(255, 0, 0, 0.4),
                        height: 30,
                        width: 170,
                        child: Text('Trending ${index+1}',style: GoogleFonts.raleway(fontSize: 15),),
                      ),
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
              height: 700,
              enlargeCenterPage: true,
              initialPage: 0,
              autoPlay: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.linearToEaseOut,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 300),
              viewportFraction: 0.83,
              scrollDirection: Axis.vertical,
              pauseAutoPlayOnTouch: true,
            )),
      ),
    );
  }
}
