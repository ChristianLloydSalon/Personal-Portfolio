import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  final List<Widget> _widgets = [
    // Name and Position
    Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment:
              (kIsWeb) ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name
            Container(
              child: Text(
                'Christian Lloyd Salon',
                textAlign: (kIsWeb) ? TextAlign.end : TextAlign.start,
                style: TextStyle(
                  fontSize: (kIsWeb) ? 48 : 30,
                ),
              ),
            ),
            if (kIsWeb) ...[
              // Divider
              Divider(
                thickness: 5,
                color: Colors.black,
              ),
            ],
            // Position
            Container(
              child: Text(
                'Software Engineer Trainee',
                textAlign: (kIsWeb) ? TextAlign.end : TextAlign.start,
                style: TextStyle(
                  fontSize: (kIsWeb) ? 38 : 20,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    // Image
    Container(
      width: (kIsWeb) ? 220 : 80,
      child: Image.asset('images/profile-pic.jpg'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (kIsWeb) ? 220 : 100,
      padding: (kIsWeb) ? null : EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Row(
        children: [
          // My Portfolio
          if (kIsWeb) ...[
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    'My Portfolio',
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
            ),
          ],
          // 0 - Name and Position
          // 1 - Image
          (kIsWeb) ? _widgets[0] : _widgets[1],
          // Space
          SizedBox(
            width: (kIsWeb) ? 20 : 10,
          ),
          // 1 - Image
          // 0 - Name and Position
          (kIsWeb) ? _widgets[1] : _widgets[0],
        ],
      ),
    );
  }
}
