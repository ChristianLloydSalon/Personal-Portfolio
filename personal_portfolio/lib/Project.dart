import 'package:flutter/material.dart';

class Project {
  late final String _title;
  late final String _subheader;
  late final String _details;
  late final Image _image;
  late final Image _icon;

  String get Title => this._title;
  String get Subheader => this._subheader;
  String get Details => this._details;
  Image get Picture => this._image;
  Image get Icon => this._icon;

  Project({
    required String title,
    required String subheader,
    required String details,
    required Image image,
    required Image icon,
  }) {
    this._title = title;
    this._subheader = subheader;
    this._details = details;
    this._image = image;
    this._icon = icon;
  }
}
