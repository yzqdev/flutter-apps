import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'Admin/bloc/admin_bloc.dart';
import 'Attendance/Attendance.dart';
import 'home/bloc/home_bloc.dart';
import 'repository/admin_repo.dart';
import 'repository/home_repo.dart';
import 'repository/student_repo.dart';
import 'repository/teacher_repo.dart';

import 'splash/splash.dart';
import 'Student/bloc/student_bloc.dart';
import 'Student/Student.dart';
import 'Teacher/bloc/teacher_bloc.dart';
import 'Teacher/Teacher.dart';
import 'Admin/Admin.dart';
import 'questionbank/qb.dart';
import 'home/home.dart';
import 'learn/learn.dart';
import 'Profile/Profile.dart';
import 'report/Reports.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HomeBloc(homeRepository: HomeRepository())),
        BlocProvider(
            create: (context) =>
                StudentBloc(studentRepository: StudentRepository())),
        BlocProvider(
            create: (context) =>
                TeacherBloc(teacherRepository: TeacherRepository())),
        BlocProvider(
            create: (context) => AdminBloc(adminRepository: AdminRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/Student': (context) => const StudentPage(),
          '/Teacher': (context) => const TeacherPage(),
          '/Admin': (context) => const AdminPage(),
          '/Learner': (context) => const LearnPage(),
          '/QuestionBank': (context) => const QbPage(),
          '/Attendance': (context) => const AttendancePage(),
          '/Profile': (context) => const ProfilePage(),
          '/Reports': (context) => const ReportsPage(),
        },
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            switch (state.view) {
              case HomeView.Student:
                _navigator.pushAndRemoveUntil<void>(
                  StudentPage.route(),
                  (route) => false,
                );
                break;
              case HomeView.Teacher:
                _navigator.pushAndRemoveUntil<void>(
                  TeacherPage.route(),
                  (route) => false,
                );
                break;
              case HomeView.Admin:
                _navigator.pushAndRemoveUntil<void>(
                  AdminPage.route(),
                  (route) => false,
                );
                break;
              case HomeView.Reports:
                _navigator.pushAndRemoveUntil<void>(
                  ReportsPage.route(),
                  (route) => false,
                );
                break;
              case HomeView.def:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
