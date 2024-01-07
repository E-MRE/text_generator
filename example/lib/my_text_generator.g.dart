// **************************************************************************
// App specific Text widget.
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// App specific Text widget.
// **************************************************************************

import 'package:flutter/material.dart';

/// * title FontWeight.w400  || TextTheme: `titleMedium`
///
/// Creates a text widget.
///
/// If the [style] argument is null, the text will use the style from the
/// closest enclosing [DefaultTextStyle].
///
/// The [data] parameter must not be null.
///
/// The [overflow] property's behavior is affected by the [softWrap] argument.
/// If the [softWrap] is true or null, the glyph causing overflow, and those
/// that follow, will not be rendered. Otherwise, it will be shown with the
/// given overflow option.
///
class MyText extends Text {
  /// It takes only String data.
  const MyText.onlyData(super.data, {super.key});

  ///title from `[titleMedium]`
  ///
  /// TextStyle: `MyTextStyle.titleStyle`
  ///
  /// * FontFamily: Poppins
  /// * FontWeight: `FontWeight.w400`
  /// * FontSize: `titleMedium?.fontSize`
  /// * LineHeight: `titleMedium?.height`
  ///
  MyText.title({
    Key? key,
    String? data,
    TextAlign? align,
    TextDecoration? decoration,
    required BuildContext context,
    TextOverflow? overflow,
    FontStyle? fontStyle,
    int? maxLines,
    Color? color,
  }) : super(
          data ?? '',
          key: key,
          maxLines: maxLines,
          overflow: overflow,
          textAlign: align,
          style: MyTextStyle.titleStyle(
            textTheme: Theme.of(context).textTheme,
            decoration: decoration,
            fontStyle: fontStyle,
            color: color,
          ),
        );

  /// Creates a text widget.
  ///
  /// If the [style] argument is null, the text will use the style from the
  /// closest enclosing [DefaultTextStyle].
  ///
  /// The [data] parameter must not be null.
  ///
  /// The [overflow] property's behavior is affected by the [softWrap] argument.
  /// If the [softWrap] is true or null, the glyph causing overflow, and those
  /// that follow, will not be rendered. Otherwise, it will be shown with the
  /// given overflow option.
  const MyText(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super();
}

extension MyTextExtension on MyText {
  MyText copyWith({
    Color? color,
    bool? inherit,
    int? maxLines,
    double? height,
    Locale? locale,
    TextAlign? align,
    double? fontSize,
    String? debugLabel,
    String? fontFamily,
    double? wordSpacing,
    FontStyle? fontStyle,
    double? letterSpacing,
    FontWeight? fontWeight,
    Color? decorationColor,
    TextOverflow? overflow,
    Color? backgroundColor,
    TextBaseline? textBaseline,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
  }) {
    return MyText(
      this.data ?? '',
      key: this.key,
      locale: this.locale,
      softWrap: this.softWrap,
      textDirection: this.textDirection,
      textAlign: align ?? this.textAlign,
      selectionColor: this.selectionColor,
      textScaleFactor: this.textScaleFactor,
      textHeightBehavior: this.textHeightBehavior,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: this.semanticsLabel,
      textWidthBasis: this.textWidthBasis,
      strutStyle: this.strutStyle,
      overflow: this.overflow,
      style: this.style?.copyWith(
            letterSpacing: letterSpacing,
            backgroundColor: backgroundColor,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            textBaseline: textBaseline,
            wordSpacing: wordSpacing,
            fontWeight: fontWeight,
            decoration: decoration,
            fontFamily: fontFamily,
            debugLabel: debugLabel,
            fontStyle: fontStyle,
            overflow: overflow,
            fontSize: fontSize,
            inherit: inherit,
            height: height,
            locale: locale,
            color: color,
          ),
    );
  }
}

/// * titleStyle FontWeight.w400  || TextTheme: `titleMedium`
///
/// Creates a text style.
///
/// The `package` argument must be non-null if the font family is defined in a
/// package. It is combined with the `fontFamily` argument to set the
/// [fontFamily] property.
///
@immutable
class MyTextStyle extends TextStyle {
  const MyTextStyle.empty() : super();

  /// titleStyle from `[titleMedium]`
  ///
  /// * FontFamily: Poppins
  /// * FontWeight: FontWeight.w400
  /// * FontSize: `titleMedium?.fontSize`
  /// * LineHeight: `titleMedium?.height`
  ///
  MyTextStyle.titleStyle({
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    TextDecoration? decoration,
    String fontFamily = 'Poppins',
    required TextTheme textTheme,
  }) : this.convertParent(
            style: textTheme.titleMedium?.copyWith(
          color: color,
          overflow: overflow,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          decoration: decoration,
          fontWeight: fontWeight,
          fontSize: textTheme.titleMedium?.fontSize,
          height: textTheme.titleMedium?.height,
        ));

  const MyTextStyle({
    super.inherit = true,
    super.color,
    super.backgroundColor,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.letterSpacing,
    super.wordSpacing,
    super.textBaseline,
    super.height,
    super.leadingDistribution,
    super.locale,
    super.foreground,
    super.background,
    super.shadows,
    super.fontFeatures,
    super.fontVariations,
    super.decoration,
    super.decorationColor,
    super.decorationStyle,
    super.decorationThickness,
    super.debugLabel,
    super.fontFamily,
    super.fontFamilyFallback,
    super.package,
    super.overflow,
  });

  /// Creates a text style.
  ///
  /// The `package` argument must be non-null if the font family is defined in a
  /// package. It is combined with the `fontFamily` argument to set the
  /// [fontFamily] property.
  MyTextStyle.convertParent({required TextStyle? style, String? package})
      : super(
          inherit: style?.inherit ?? true,
          color: style?.color,
          backgroundColor: style?.backgroundColor,
          fontSize: style?.fontSize,
          fontWeight: style?.fontWeight,
          fontStyle: style?.fontStyle,
          letterSpacing: style?.letterSpacing,
          wordSpacing: style?.wordSpacing,
          textBaseline: style?.textBaseline,
          height: style?.height,
          leadingDistribution: style?.leadingDistribution,
          locale: style?.locale,
          foreground: style?.foreground,
          background: style?.background,
          shadows: style?.shadows,
          fontFeatures: style?.fontFeatures,
          fontVariations: style?.fontVariations,
          decoration: style?.decoration,
          decorationColor: style?.decorationColor,
          decorationStyle: style?.decorationStyle,
          decorationThickness: style?.decorationThickness,
          debugLabel: style?.debugLabel,
          fontFamily: style?.fontFamily,
          fontFamilyFallback: style?.fontFamilyFallback,
          package: package,
          overflow: style?.overflow,
        );
}
