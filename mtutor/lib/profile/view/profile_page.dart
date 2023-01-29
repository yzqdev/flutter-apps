import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ProfilePage());
  }

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor_light,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: secondarycolor_light,
      ),
      body: Column(children: [
        const SizedBox(height: 40.0),
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://img.freepik.com/premium-photo/3d-render-male-avatar-with-blue-sweater-good-Profile-picture_477250-13.jpg?w=740"),
          radius: 70.0,
        ),
        const SizedBox(height: 20.0),
        const SizedBox(
          height: 10,
        ),
        Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                alignment: Alignment.topLeft,
                child: const Text(
                  "Profile Information",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Card(
                  child: Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ...ListTile.divideTiles(
                                color: Colors.grey,
                                tiles: [
                                  ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    leading: Icon(Icons.person_rounded),
                                    title: Text("Name"),
                                    subtitle: Text(profile.name),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.bubble_chart),
                                    title: Text("Id"),
                                    subtitle: Text(profile.id),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.location_on_rounded),
                                    title: Text("Place"),
                                    subtitle: Text(profile.place),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.calendar_month_rounded),
                                    title: Text("Date of Birth"),
                                    subtitle: Text(profile.dob),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.mail_lock_rounded),
                                    title: Text("Address"),
                                    subtitle: Text(profile.addrs),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      )))
            ]))
      ]),
    );
  }
}
