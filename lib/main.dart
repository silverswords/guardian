import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'root.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  runApp(Application());
}
