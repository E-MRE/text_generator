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
    TextScaler? textScaler,
    Color? backgroundColor,
    TextBaseline? textBaseline,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
  }) {
    return $textName(
      data ?? '',
      key: key,
      locale: locale ?? this.locale,
      softWrap: softWrap,
      textDirection: textDirection,
      textAlign: align ?? textAlign,
      selectionColor: selectionColor,
      textScaler: textScaler ?? this.textScaler,
      textHeightBehavior: textHeightBehavior,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      strutStyle: strutStyle,
      overflow: overflow ?? this.overflow,
      style: style?.copyWith(
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
