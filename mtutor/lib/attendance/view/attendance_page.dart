import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AttendancePage());
  }

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  Map<String, bool> cand_list = {
    'Candidate1': false,
    'Candidate2': false,
    'Candidate3': false,
    'Candidate4': false,
    'Candidate5': false,
    'Candidate6': false,
    'Candidate7': false,
    'Candidate8': false,
    'Candidate9': false,
    'Candidate10': false,
    'Candidate11': false,
    'Candidate12': false,
    'Candidate13': false,
    'Candidate14': false,
    'Candidate15': false,
    'Candidate16': false,
    'Candidate17': false,
    'Candidate18': false,
    'Candidate19': false,
    'Candidate20': false,
  };

  var tmpArray = [];

  getCheckboxItems() {
    cand_list.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });
    print(tmpArray);
    tmpArray.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primarycolor_light,
        appBar: AppBar(
          title: const Text('Attendance'),
          backgroundColor: secondarycolor_light,
        ),
        floatingActionButton: SizedBox(
          height: 50,
          width: 50,
          child: Material(
            type: MaterialType.transparency,
            child: Ink(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3.5),
                color: Colors.tealAccent,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(500.0),
                onTap: () {
                  getCheckboxItems();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Successfully Recorded !!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                child: const Icon(
                  Icons.add,
                  //size: 50,
                ),
              ),
            ),
          ),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(
              children: cand_list.keys.map((String key) {
                return CheckboxListTile(
                  title: Text(key),
                  value: cand_list[key],
                  activeColor: Colors.blueGrey,
                  checkColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      cand_list[key] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ]));
  }
}
