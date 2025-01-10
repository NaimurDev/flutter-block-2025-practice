import 'package:flutter/material.dart';
import 'package:lets_learn_bloc/app.dart';
import './di_module.dart' as di;

void main() {
  di.setup();
  runApp(const MyApp());
}
