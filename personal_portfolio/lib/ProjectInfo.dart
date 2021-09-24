import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/Project.dart';

// Details about the project
class ProjectInfo extends StatelessWidget {
  Project? _project;

  ProjectInfo({Key? key, required Project? project}) : super(key: key) {
    this._project = project;
  }

  @override
  Widget build(BuildContext context) {
    return (kIsWeb)
        // Project Info Web view
        ? ((_project == null)
            // No item selected
            ? Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      'Select an item on the left to view',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              )
            // if item is selected, display the project's details
            : Expanded(child: _details(context)))
        // Project Info Mobile View
        : SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(_project!.Title),
                backgroundColor: Colors.blue,
              ),
              body: _details(context),
            ),
          );
  }

  // Displays the picture and details about the project
  Widget _details(BuildContext context) {
    return Container(
      padding: (kIsWeb) ? null : EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (kIsWeb) ...[
            // Title
            Text(
              _project!.Title,
              style: TextStyle(fontSize: 48),
            ),
            // Space
            SizedBox(
              height: 10,
            ),
          ],
          // Details and picture of the project
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Project Image
                    Container(
                      height: 300,
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: _project!.Picture,
                      ),
                    ),
                    // Space
                    SizedBox(
                      height: (kIsWeb) ? 20 : 10,
                    ),
                    // Details
                    Text(
                      _project!.Details,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: (kIsWeb) ? 28 : 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
