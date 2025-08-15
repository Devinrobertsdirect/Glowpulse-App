import 'package:flutter/material.dart';

BoxShadow boxShadowWidget(){
  return BoxShadow(
    color: Colors.black.withValues(alpha: 0.1), // Shadow color
    blurRadius: 8, // Shadow blur (softness)
    spreadRadius: 0, // No extra spread
    offset: Offset(0, 2), // Shadow offset
  );
}