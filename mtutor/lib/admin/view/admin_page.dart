import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/tilecard.dart';
import '../../constant/constant.dart';
import '../../repository/admin_repo.dart';
import '../bloc/admin_bloc.dart';


class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AdminPage());
  }

  @override
  Widget build(BuildContext context) {

    final dashboard = BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
          return GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            padding: const EdgeInsets.all(10.0),
            children: List.generate(
              AdminView.values.length-1,
                  (index) => TileCard(title:AdminView.values[index+1].name,
                    navRoute: AdminView.values[index+1].name,
              ),
            ),
          );
      },
    );

    return Scaffold(
      backgroundColor: primarycolor_light,
      appBar: AppBar(title: const Text('Admin Dashboard'),backgroundColor: secondarycolor_light,),
      body: BlocListener<AdminBloc, AdminState>(
          listener: (context, state) {
            // if(state.status == 'Success'){
            //   Navigator.pushNamed(context, '/home');
            // }
          },
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

// return Scaffold(
//   backgroundColor: Colors.tealAccent[100],
//   appBar: AppBar(title: const Text('Admin Dashboard')),
//   body: Center(
//     child: Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//
//         ElevatedButton(
//           child: const Text('Logout'),
//           onPressed: () {
//             context
//                 .read<AdminBloc>()
//                 .add(AdminLogoutRequested());
//           },
//         ),
//       ],
//     ),
//   ),
// );
//   }
// }
