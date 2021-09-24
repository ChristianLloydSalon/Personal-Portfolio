import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/MyProject.dart';
import 'package:personal_portfolio/Project.dart';
import 'package:personal_portfolio/ProjectInfo.dart';
import 'package:personal_portfolio/UserProfile.dart';

// Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return (kIsWeb) ? _WebView() : _MobileView();
  }
}

// Web View
class _WebView extends StatefulWidget {
  const _WebView({Key? key}) : super(key: key);

  @override
  __WebViewState createState() => __WebViewState();
}

class __WebViewState extends State<_WebView> {
  // class for the list of projects
  MyProject _myProject = MyProject();

  // current project in the screen
  late Project _current;

  @override
  void initState() {
    super.initState();
    _current = Project(
      title: '',
      subheader: '',
      details: 'Select an item on the left to view',
      image: Image.asset('images/hydra-logo.jpg'),
      icon: Image.asset('images/hydra-logo.jpg'),
    );
    _myProject.ChangeState = ChangeInfo;
  }

  void ChangeInfo() {
    setState(() {
      _current = _myProject.CurrentProject;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // if the size of the webview reaches half, display black screen
          if (constraints.maxWidth < 900 || constraints.maxHeight < 500) {
            // black screen
            return Container(
              color: Colors.black,
              height: double.infinity,
              child: Center(
                child: FittedBox(
                  child: Text(
                    'Expand to View',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // User Profile
                  UserProfile(),
                  // Divider
                  Divider(
                    height: 30,
                    thickness: 5,
                    color: Colors.black,
                    indent: width * 0.15,
                    endIndent: width * 0.15,
                  ),
                  // Projects and Project Detail
                  Expanded(
                    child: Row(
                      children: [
                        // project list (left)
                        _myProject,
                        // vertical divider
                        VerticalDivider(
                          width: 20,
                          thickness: 2,
                          color: Colors.black,
                        ),
                        // project info (right)
                        ProjectInfo(project: _current),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// Mobile View
class _MobileView extends StatelessWidget {
  const _MobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandScaped =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        appBar: (isLandScaped)
            ? null
            : AppBar(
                backgroundColor: Colors.blue,
                title: Text('My Portfolio'),
              ),
        body: Container(
          height: double.infinity,
          child: Column(
            children: [
              // User
              UserProfile(),
              // Divider
              Divider(
                height: 10,
                indent: 20,
                endIndent: 20,
                thickness: 2,
                color: Colors.black,
              ),
              // My Projects
              MyProject(),
            ],
          ),
        ),
      ),
    );
  }
}
