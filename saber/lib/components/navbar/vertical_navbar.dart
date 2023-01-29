
import 'package:flutter/material.dart';
import 'package:saber/components/files/file_tree.dart';

class VerticalNavbar extends StatefulWidget {
  const VerticalNavbar({
    super.key,
    required this.destinations,
    this.selectedIndex = 0,
    this.onDestinationSelected,
  });

  final List<NavigationRailDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  State<VerticalNavbar> createState() => _VerticalNavbarState();
}
class _VerticalNavbarState extends State<VerticalNavbar> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kToolbarHeight),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: TextButton(
              onPressed: () {setState(() {
                expanded = !expanded;
              });},
              child: Icon(expanded ? Icons.chevron_left : Icons.chevron_right)
            ),
          ),

          IntrinsicHeight(
            child: NavigationRail(
              destinations: widget.destinations,
              selectedIndex: widget.selectedIndex,

              backgroundColor: colorScheme.surface,

              extended: expanded,
              minExtendedWidth: 300,

              onDestinationSelected: widget.onDestinationSelected,
            ),
          ),

          if (expanded) const Expanded(child: FileTree()),
        ],
      ),
    );
  }
}
