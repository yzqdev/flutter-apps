import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TileCard extends StatelessWidget {
  final String title;
  final String navRoute;

  const TileCard({
    Key? key,
    required this.title,
    required this.navRoute,
  })  : assert(title != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/$navRoute');
      },
      child: Neumorphic(
        style: const NeumorphicStyle(
          color: Color(0xffb2ebf2),
          border: NeumorphicBorder(
            color: Color(0xffb2ebf2),
            width: 0.8,
          ),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
