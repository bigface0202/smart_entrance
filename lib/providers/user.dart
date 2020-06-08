import 'package:flutter/material.dart';

class User with ChangeNotifier{
  final String id;
  final bool entered;
  final String felicaId;

  User({
    @required this.id,
    @required this.entered,
    @required this.felicaId,
  });
}

