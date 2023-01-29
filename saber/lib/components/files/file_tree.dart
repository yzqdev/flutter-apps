

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/pages/editor/editor.dart';


class FileTree extends StatelessWidget {
  const FileTree({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FileTreeBranch(
          path: null,
          isDirectory: true,
        )
      ),
    );
  }

}

class FileTreeBranch extends StatefulWidget {
  const FileTreeBranch({
    super.key,
    required this.path,
    required this.isDirectory,
  });

  final String? path;
  final bool isDirectory;

  @override
  State<FileTreeBranch> createState() => _FileTreeBranchState();

}

class _FileTreeBranchState extends State<FileTreeBranch> {
  DirectoryChildren? children;
  bool areChildrenVisible = false;

  @override
  void initState() {
    _getInfo();
    FileManager.writeWatcher.addListener(_getInfo);
    super.initState();
  }

  _getInfo() async {
    if (widget.isDirectory) children = await FileManager.getChildrenOfDirectory(widget.path ?? "/");
    areChildrenVisible = children != null && children!.onlyOneChild();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.path != null) Material(
          color: colorScheme.surface,
          child: InkWell(
            onTap: () {
              setState(() {
                if (widget.isDirectory) {
                  areChildrenVisible = !areChildrenVisible;
                } else {
                  context.push("${RoutePaths.edit}?path=${widget.path}");
                }
              });
            },
            child: Row(
              children: [
                if (widget.isDirectory) ...[
                  Icon(areChildrenVisible ? Icons.folder_open: Icons.folder, color: colorScheme.primary, size: 25),
                ] else ...[
                  const Icon(Icons.insert_drive_file, size: 25),
                ],

                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.path!.substring(widget.path!.lastIndexOf("/") + 1),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),


        if ((widget.path == null || areChildrenVisible) && children != null) Padding(
          padding: (widget.path != null) ? const EdgeInsets.only(left: 25) : const EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < children!.directories.length; i++)
                FileTreeBranch(
                  path: "${widget.path ?? ""}/${children!.directories[i]}",
                  isDirectory: true,
                ),
              for (var i = 0; i < children!.files.length; i++)
                FileTreeBranch(
                  path: "${widget.path ?? ""}/${children!.files[i]}",
                  isDirectory: false,
                ),
            ],
          ),
        ),

      ],
    );
  }

  @override
  void dispose() {
    FileManager.writeWatcher.removeListener(_getInfo);
    super.dispose();
  }

}
