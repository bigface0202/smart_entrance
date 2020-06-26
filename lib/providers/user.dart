import 'dart:ffi';

import 'package:flutter/material.dart';

class User with ChangeNotifier{
  final String id;
  final bool entered;
  final String felicaId;
  final double bodyTemp;

  User({
    @required this.id,
    @required this.entered,
    @required this.felicaId,
    @required this.bodyTemp,
  });
}

