import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/Project.dart';
import 'package:personal_portfolio/ProjectInfo.dart';
import 'package:personal_portfolio/ProjectTile.dart';
import 'package:personal_portfolio/Projects.dart';

class MyProject extends StatelessWidget {
  late void Function() _function;

  late Project? _currentProject = null;

  Project? get CurrentProject => this._currentProject;

  void set ChangeState(void Function() function) {
    this._function = function;
  }

  MyProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:
            (kIsWeb) ? null : EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // My Project Text
            Text(
              'My Project',
              style: TextStyle(fontSize: (kIsWeb) ? 48 : 36),
            ),
            // Space
            SizedBox(
              height: (kIsWeb) ? 30 : 10,
            ),
            // List of Projects
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    for (int i = 0; i < Projects.items.length; i++) ...[
                      // project list tile
                      ProjectTile(
                        project: Projects.items[i],
                        icon: Projects.items[i].Icon,
                        function: () {
                          _currentProject = Projects.items[i];
                          if (kIsWeb) {
                            _function();
                          } else {
                            // go to project info
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProjectInfo(project: _currentProject),
                              ),
                            );
                          }
                        },
                      ),
                      // only display the Divider() if a project to be displayed is not the last project in the list
                      if (i != Projects.items.length - 1) ...[
                        // Divider
                        Divider(
                          height: 10,
                          thickness: 2,
                          color: Colors.black,
                          indent: MediaQuery.of(context).size.width * 0.05,
                          endIndent: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ]
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
