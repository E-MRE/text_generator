// ignore_for_file: cascade_invocations, lines_longer_than_80_chars, use_string_buffers

part of '../../text_generator.dart';

mixin _TextStyleGeneratorMixin {
  Code generateAppTextStyleClass(List<TextGeneratorOption> appTextList) {
    var allStyles = '';
    for (final appText in appTextList) {
      allStyles += generateAppTextStyleByModel(appText);
    }

    return Code('''

${_getAllStyleShortDescriptions(appTextList)}
${_getInitialStyleExplanation()}
@immutable
${_openClass()}

$allStyles

${_getAppTextStyleWithAllParameters()}

${_getConvertParentConstructor()}
${_closeClass()}
''');
  }

  String _openClass() {
    return '''
    class AppTextStyle extends TextStyle{
      const AppTextStyle.empty() : super();

''';
  }

  String _closeClass() {
    return '''

  }
''';
  }

  String generateAppTextStyleByModel(TextGeneratorOption appText) {
    final buffer = StringBuffer();

    final firstPart = _getFirstPartOfTextStyleExplanation(appText);
    buffer.writeln(firstPart);
    _addExplanationAboutText(appText, buffer);

    return '''
  $buffer
  AppTextStyle.${appText.name}Style({
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    TextDecoration? decoration,
    String fontFamily = 'Poppins',
    required TextTheme textTheme,
  }) : this.convertParent(
    ${_getInsideOfStyle(appText)}
  );
''';
  }

  String _getInitialStyleExplanation() {
    return '''
    /// Creates a text style.
    ///
    /// The `package` argument must be non-null if the font family is defined in a
    /// package. It is combined with the `fontFamily` argument to set the
    /// [fontFamily] property.
    ///''';
  }

  String _getAllStyleShortDescriptions(List<TextGeneratorOption> appTextList) {
    final buffer = StringBuffer();

    for (final appText in appTextList) {
      final weight = (appText.fontWeight ?? FontsWeight.w400).value;
      final size = appText.fontSize == null ? '' : 'Size: `${appText.fontSize}`';
      final height = appText.fontHeight == null ? '' : 'Height: `${appText.fontHeight}`';

      var line = '/// * ${appText.name}Style $weight ';
      if (size.isNotEmpty) {
        line += '--- $size';
      }

      if (height.isNotEmpty) {
        line += size.isEmpty ? '--- $height' : ' || $height';
      }

      line += ' || TextTheme: ';
      line += '`${appText.textStyle == TextThemeStyle.empty ? 'None' : appText.textStyle.value}`';

      buffer.writeln(line);
    }

    buffer.write('///');
    return buffer.toString();
  }

  String _getInsideOfStyle(TextGeneratorOption appText) {
    final buffer = StringBuffer('style: ');
    final style = appText.textStyle == TextThemeStyle.empty
        ? appText.textStyle.value
        : 'textTheme.${appText.textStyle.value}?.copyWith';

    final overflow = appText.overflow == null ? 'overflow' : 'overflow ?? ${appText.overflow?.value}';
    final fontWeight =
        appText.fontWeight == null ? 'fontWeight' : 'fontWeight ?? ${(appText.fontWeight ?? FontsWeight.w400).value}';

    buffer.write(style);
    buffer.writeln('(');
    buffer.writeln('color: color,');
    buffer.writeln('overflow: $overflow,');
    buffer.writeln('fontStyle:fontStyle,');
    buffer.writeln('fontFamily:fontFamily,');
    buffer.writeln('decoration:decoration,');
    buffer.writeln('fontWeight: $fontWeight,');

    final size = appText.fontSize;
    final height = appText.fontHeight;

    if (appText.textStyle == TextThemeStyle.empty) {
      buffer.writeln('fontSize: $size ?? 0,');
      buffer.writeln('height: $height,');
    } else {
      buffer.writeln('fontSize: ${size ?? 'textTheme.${appText.textStyle.value}?.fontSize'},');
      buffer.writeln('height: ${height ?? 'textTheme.${appText.textStyle.value}?.height'},');
    }

    buffer.writeln(')');

    return buffer.toString();
  }

  String _getAppTextStyleWithAllParameters() {
    return '''
    const AppTextStyle({
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
''';
  }

  String _getConvertParentConstructor() {
    return '''
    /// Creates a text style.
    ///
    /// The `package` argument must be non-null if the font family is defined in a
    /// package. It is combined with the `fontFamily` argument to set the
    /// [fontFamily] property.
    AppTextStyle.convertParent({required TextStyle? style, String? package})
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
''';
  }

  String _getTextStyleShortDescription(TextGeneratorOption appText) {
    final style = appText.textStyle == TextThemeStyle.empty ? 'None' : appText.textStyle.value;
    final text = '  /// ${appText.name}Style from `[$style]`';
    if (appText.fontHeight == null && appText.fontSize == null) return text;

    if (appText.fontHeight != null && appText.fontSize != null) {
      return '$text (${appText.fontSize} || ${appText.fontHeight})';
    }

    if (appText.fontSize != null) {
      return '$text Size: ${appText.fontSize}';
    } else if (appText.fontHeight != null) {
      return '$text Height: ${appText.fontHeight}';
    } else {
      return text;
    }
  }

  String _getFirstPartOfTextStyleExplanation(TextGeneratorOption appText) {
    return '''
${_getTextStyleShortDescription(appText)}
  ///
  /// * FontFamily: Poppins
  /// * FontWeight: ${(appText.fontWeight ?? FontsWeight.w400).value}''';
  }

  void _addExplanationAboutText(TextGeneratorOption appText, StringBuffer buffer) {
    final fontSize = appText.fontSize;
    final fontHeight = appText.fontHeight;

    if (fontSize == null) {
      buffer.writeln('  /// * FontSize: `${appText.textStyle.value}?.fontSize`');
    } else {
      buffer.writeln('  /// * FontSize: `$fontSize`');
    }

    if (fontHeight == null) {
      buffer.writeln('  /// * LineHeight: `${appText.textStyle.value}?.height`');
    } else {
      buffer.writeln('  /// * LineHeight: `$fontHeight`');
    }

    buffer.write('///');
  }
}
