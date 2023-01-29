import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/tilecard.dart';
import '../../constant/constant.dart';
import '../../repository/teacher_repo.dart';
import '../bloc/teacher_bloc.dart';

class TeacherPage extends StatelessWidget {
  const TeacherPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TeacherPage());
  }

  @override
  Widget build(BuildContext context) {
    final dashboard = BlocBuilder<TeacherBloc, TeacherState>(
      builder: (context, state) {
        return GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          padding: const EdgeInsets.all(10.0),
          children: List.generate(
            TeacherView.values.length - 1,
            (index) => TileCard(
              title: TeacherView.values[index + 1].name,
              navRoute: TeacherView.values[index + 1].name,
            ),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: primarycolor_light,
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
        backgroundColor: secondarycolor_light,
      ),
      body: BlocListener<TeacherBloc, TeacherState>(
          listener: (context, state) {},
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Align(
              alignment: const Alignment(0, -1 / 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(padding: EdgeInsets.all(12)),
                  dashboard,
                  const Padding(padding: EdgeInsets.all(12)),
                ],
              ),
            ),
          )),
    );
  }
}
