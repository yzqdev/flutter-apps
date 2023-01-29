import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  final String banner;
  final String poster;
  final String name;
  final String vote;
  final String text;
  final String count;

  const DetailScreen({
    super.key,
    required this.banner,
    required this.poster,
    required this.name,
    required this.vote,
    required this.text,
    required this.count,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    double percentage = double.parse(widget.vote) * 10;
   // print(percentage);
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
         //      color: Colors.grey,
            height: 450,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    //color: Colors.deepPurple,
                    height: 230,
                    width: double.infinity,
                    foregroundDecoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.2, 0.8, 1],
                      ),
                    ),
                    child: Image.network(
                      widget.banner,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 10,
                  child: SizedBox(
                    // color: Colors.deepPurple,
                    height: 180,
                    width: 120,
                    child: Image.network(
                      widget.poster,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 140,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                   //    color: Colors.deepPurple,
                    height: 200,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5),
                          alignment: Alignment.topLeft,
                          height: 60,
                          width: 240,
                          decoration: const BoxDecoration(
                            //color: Colors.red,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: RatingBarIndicator(
                            rating: double.parse(widget.vote) / 2,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Color.fromRGBO(255, 0, 0, 1),
                            ),
                            itemCount: 5,
                            itemSize: 25.0,
                            direction: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 90,
                      width: 140,
                      // color: Colors.grey,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 70,
                            width: 20,
                            decoration: const BoxDecoration(
                              color: Colors.purpleAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  // Color.fromARGB(255, 228, 5, 247),
                                  Color.fromRGBO(255, 0, 0, 1),
                                  Color.fromRGBO(0, 0, 255, 1),

                                  // Color.fromRGBO(92, 10, 65, 1),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(1),
                            alignment: Alignment.center,
                            height: 70,
                            width: 80,
                            // color: Colors.yellow,
                            child: SizedBox(
                              height: 60,
                              //   color: Colors.red,
                              child: Column(
                                children: [
                                  Text(
                                    '${percentage.toStringAsFixed(1)}%',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.count,
                                        style: GoogleFonts.lato(
                                          fontSize: 15,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const Icon(Icons.people,size: 20,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: secondHalf.isEmpty
                ? Text(firstHalf)
                : Column(
                    children: <Widget>[
                      Text(
                        flag ? ("$firstHalf...") : (firstHalf + secondHalf),
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              flag ? "Show more" : "Show less",
                              style: GoogleFonts.raleway(fontSize: 15,color: Colors.grey),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            flag = !flag;
                          });
                        },
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
