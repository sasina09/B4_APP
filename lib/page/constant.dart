import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.grey,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final tLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'Mali',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFFFFFFFF),
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Colors.black),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      // blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);