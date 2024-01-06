part of '../../text_generator.dart';

mixin _GeneratedTextExtension {
  Code getExtension(String textName) => Code('''

extension ${textName}Extension on $textName {
  $textName copyWith({
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
    return $textName(
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
''');
}
