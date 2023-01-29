import 'package:flutter/material.dart';

import '../../components/tilecard.dart';
import '../../constant/constant.dart';
import '../../repository/student_repo.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const StudentPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor_light,
      appBar: AppBar(
        title: const Text('Student Dashboard'),
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
                        StudentView.values.length - 1,
                        (index) => TileCard(
                          title: StudentView.values[index + 1].name,
                          navRoute: StudentView.values[index + 1].name,
                        ),
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
