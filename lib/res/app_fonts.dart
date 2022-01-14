import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle get f20w700White {
    return TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get f18w700White {
    return TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get f18w700WhiteUnderLine {
    return TextStyle(
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle get f18w600Black {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get f16w600Black {
    return TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );
  }
}
