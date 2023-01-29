import 'package:flutter/material.dart';

import '../../components/tilecard.dart';
import '../../constant/constant.dart';
import '../../repository/home_repo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor_light,
      appBar: AppBar(
        title: const Text('Home Dashboard'),
        backgroundColor: secondarycolor_light,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(padding: EdgeInsets.all(12)),
                Builder(
                  builder: (context) {
                    return GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      padding: const EdgeInsets.all(10.0),
                      children: List.generate(
                        HomeView.values.length - 1,
                        (index) => TileCard(
                            title: HomeView.values[index + 1].name,
                            navRoute: HomeView.values[index + 1].name),
                      ),
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.all(12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
