import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:umdb_app/screens/signin_screen.dart';
import 'package:umdb_app/screens/test.dart';
import 'package:umdb_app/screens/trending1_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List popularMovies = [];
  List topRatedMovies = [];
  List upComingMovies = [];
  List tvPopularShows = [];
  final String apikey = '0f183d1f88b002029726e12540f132bd';
  final readaccesstoken =
      '.eyJhdWQiOiIwZjE4M2QxZjg4YjAwMjAyOTcyNmUxMjU0MGYxMzJiZCIsInN1YiI6IjYzNmYxZTM5MjE2MjFiMDBjZDYyNzM4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.IHVSJnNYSHeVNKRvO6a6RMpmE3FC1cj-ZOoc5eSd8KU';
  bool _isLoading = true;

  @override
  void initState() {
    loadMovies();
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map popularresult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map upcomingresult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map tvpopularresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    //print(tvpopularresult);
    setState(() {
      trendingMovies = trendingresult['results'];
      popularMovies = popularresult['results'];
      topRatedMovies = topratedresult['results'];
      upComingMovies = upcomingresult['results'];
      tvPopularShows = tvpopularresult['results'];
    });
    if (kDebugMode) {
      print(trendingMovies);
    }
    // print(popularMovies);
    // print(topRatedMovies);
    // print(upComingMovies);
    // print(tvPopularShows);
  }

  int selectedindex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            const Text(
              'TMDb',
              style: TextStyle(fontSize: 30, fontFamily: 'Horizon'),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 20,
              width: 70,
              decoration: const BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    // Color.fromARGB(255, 228, 5, 247),
                    Color.fromRGBO(255, 0, 0, 1),
                    Color.fromRGBO(0, 0, 255, 1),

                    // Color.fromRGBO(92, 10, 65, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          if (_isLoading) ...[
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(child: SizedBox(
                height: 50,
                  width: 50,
                  child: CircularProgressIndicator())),
            ),
          ] else ...[
            Test(
                popular: popularMovies,
                topRated: topRatedMovies,
                upComing: upComingMovies,
                tvPopular: tvPopularShows),
            Trending1Screen(trending1: trendingMovies),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseAuth.instance.signOut().then(
            (value) {
              if (kDebugMode) {
                print("Signed Out");
              }
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SignInScreen()),
                  ModalRoute.withName('/'));
            },
          );
        },
        backgroundColor: const Color.fromRGBO(255, 0, 0, 1),
        child: const Icon(Icons.logout),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_fire_department_rounded,
              ),
              label: 'Trending'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.logout_outlined,
          //     ),
          //     label: 'Logout'),
        ],
        currentIndex: selectedindex,
        selectedItemColor: const Color.fromRGBO(255, 0, 0, 1),
        //const Color.fromARGB(255, 228, 5, 247)
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
        backgroundColor: Colors.black,
        showUnselectedLabels: false,
      ),
    );
  }
}
