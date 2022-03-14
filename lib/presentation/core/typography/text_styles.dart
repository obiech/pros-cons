import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pros_cons/presentation/core/theme/colors.dart';
import 'package:pros_cons/presentation/core/typography/font_weights.dart';

/// Defines text styles for the ProsCons UI.
class ProsConsTextStyle {
  /// Headline 1 text style
  static TextStyle get headline1 {
    return _baseTextStyle.copyWith(
      fontSize: 74,
      fontWeight: ProsConsFontWeight.bold,
    );
  }

  /// Headline 2 text style
  static TextStyle get headline2 {
    return _baseTextStyle.copyWith(
      fontSize: 54,
      height: 1.1,
      fontWeight: ProsConsFontWeight.bold,
    );
  }

  /// Headline 3 text style
  static TextStyle get headline3 {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.12,
      fontWeight: ProsConsFontWeight.bold,
    );
  }

  /// Headline 3 Soft text style
  static TextStyle get headline3Soft {
    return _baseTextStyle.copyWith(
      fontSize: 34,
      height: 1.17,
      fontWeight: ProsConsFontWeight.regular,
    );
  }

  /// Headline 4 text style
  static TextStyle get headline4 {
    return _baseTextStyle.copyWith(
      fontSize: 24,
      height: 1.15,
      fontWeight: ProsConsFontWeight.bold,
    );
  }

  /// Headline 5 text style
  static TextStyle get headline5 {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      height: 1.25,
      fontWeight: ProsConsFontWeight.bold,
    );
  }

  /// Body Large Bold text style
  static TextStyle get bodyLargeBold {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: ProsConsFontWeight.bold,
    );
  }

  /// Body Large text style
  static TextStyle get bodyLarge {
    return _baseTextStyle.copyWith(
      fontSize: 46,
      height: 1.17,
      fontWeight: ProsConsFontWeight.regular,
    );
  }

  /// Label text style
  static TextStyle get label {
    return _baseTextStyle.copyWith(
      fontSize: 12,
      height: 1.27,
      fontWeight: ProsConsFontWeight.semiBold,
    );
  }

  static const _baseTextStyle = TextStyle(
    fontFamily: 'Mont',
    color: ProsConsColors.black,
    fontWeight: ProsConsFontWeight.regular,
  );

  // static final _bodyTextStyle = GoogleFonts.mont(
  //   color: ProsConsColors.black,
  //   fontWeight: ProsConsFontWeight.regular,
  // );
}
