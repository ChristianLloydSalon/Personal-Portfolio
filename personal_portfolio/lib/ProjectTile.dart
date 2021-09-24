import 'package:flutter/material.dart';
import 'package:personal_portfolio/Project.dart';

class ProjectTile extends StatelessWidget {
  late final Project _project;
  late final Image _icon;

  late final void Function() _function;

  ProjectTile({
    Key? key,
    required Project project,
    required Image icon,
    required void Function() function,
  }) : super(key: key) {
    this._project = project;
    this._icon = icon;
    this._function = function;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: _function,
      title: Text(_project.Title),
      subtitle: Text(_project.Subheader),
      tileColor: Colors.grey,
      leading: this._icon,
      mouseCursor: SystemMouseCursors.click,
    );
  }
}
