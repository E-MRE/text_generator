// ignore_for_file: cascade_invocations, lines_longer_than_80_chars, use_string_buffers

part of '../../text_generator.dart';

mixin _TextStyleGeneratorMixin {
  Code generateTextStyleClass(String textName, List<TextGeneratorOption> textList) {
    var allStyles = '';
    for (final text in textList) {
      allStyles += generateTextStyleByModel(textName, text);
    }

    return Code('''

${_getAllStyleShortDescriptions(textList)}
${_getInitialStyleExplanation()}
@immutable
${_openClass(textName)}

$allStyles

${_getTextStyleWithAllParameters(textName)}

${_getConvertParentConstructor(textName)}
${_closeClass()}
''');
  }

  String _openClass(String textName) {
    return '''
    class ${textName}Style extends TextStyle{
      const ${textName}Style.empty() : super();

''';
  }

  String _closeClass() {
    return '''

  }
''';
  }

  String generateTextStyleByModel(String textName, TextGeneratorOption option) {
    final buffer = StringBuffer();

    final firstPart = _getFirstPartOfTextStyleExplanation(option);
    buffer.writeln(firstPart);
    _addExplanationAboutText(textName, option, buffer);

    return '''
  $buffer
  ${textName}Style.${option.name}Style({
    Color? color,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    TextOverflow? overflow,
    TextDecoration? decoration,
    String fontFamily = 'Poppins',
    required TextTheme textTheme,
  }) : this.convertParent(
    ${_getInsideOfStyle(textName, option)}
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

  String _getAllStyleShortDescriptions(List<TextGeneratorOption> textList) {
    final buffer = StringBuffer();

    for (final text in textList) {
      final weight = (text.fontWeight ?? FontsWeight.w400).value;
      final size = text.fontSize == null ? '' : 'Size: `${text.fontSize}`';
      final height = text.fontHeight == null ? '' : 'Height: `${text.fontHeight}`';

      var line = '/// * ${text.name}Style $weight ';
      if (size.isNotEmpty) {
        line += '--- $size';
      }

      if (height.isNotEmpty) {
        line += size.isEmpty ? '--- $height' : ' || $height';
      }

      line += ' || TextTheme: ';
      line += '`${text.textStyle == TextThemeStyle.empty ? 'None' : text.textStyle.value}`';

      buffer.writeln(line);
    }

    buffer.write('///');
    return buffer.toString();
  }

  String _getInsideOfStyle(String textName, TextGeneratorOption option) {
    final buffer = StringBuffer('style: ');
    final style =
        option.textStyle == TextThemeStyle.empty ? '${textName}Style' : 'textTheme.${option.textStyle.value}?.copyWith';

    final overflow = option.overflow == null ? 'overflow' : 'overflow ?? ${option.overflow?.value}';
    final fontWeight =
        option.fontWeight == null ? 'fontWeight' : 'fontWeight ?? ${(option.fontWeight ?? FontsWeight.w400).value}';

    buffer.write(style);
    buffer.writeln('(');
    buffer.writeln('color: color,');
    buffer.writeln('overflow: $overflow,');
    buffer.writeln('fontStyle:fontStyle,');
    buffer.writeln('fontFamily:fontFamily,');
    buffer.writeln('decoration:decoration,');
    buffer.writeln('fontWeight: $fontWeight,');

    final size = option.fontSize;
    final height = option.fontHeight;

    if (option.textStyle == TextThemeStyle.empty) {
      if (size != null) {
        buffer.writeln('fontSize: $size,');
      }

      if (height != null) {
        buffer.writeln('height: $height,');
      }
    } else {
      buffer.writeln('fontSize: ${size ?? 'textTheme.${option.textStyle.value}?.fontSize'},');
      buffer.writeln('height: ${height ?? 'textTheme.${option.textStyle.value}?.height'},');
    }

    buffer.writeln(')');

    return buffer.toString();
  }

  String _getTextStyleWithAllParameters(String textName) {
    return '''
    const ${textName}Style({
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

  String _getConvertParentConstructor(String textName) {
    return '''
    /// Creates a text style.
    ///
    /// The `package` argument must be non-null if the font family is defined in a
    /// package. It is combined with the `fontFamily` argument to set the
    /// [fontFamily] property.
    ${textName}Style.convertParent({required TextStyle? style, super.package})
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
          overflow: style?.overflow,
        );
''';
  }

  String _getTextStyleShortDescription(TextGeneratorOption option) {
    final style = option.textStyle == TextThemeStyle.empty ? 'None' : option.textStyle.value;
    final text = '  /// ${option.name}Style from `[$style]`';
    if (option.fontHeight == null && option.fontSize == null) return text;

    if (option.fontHeight != null && option.fontSize != null) {
      return '$text (${option.fontSize} || ${option.fontHeight})';
    }

    if (option.fontSize != null) {
      return '$text Size: ${option.fontSize}';
    } else if (option.fontHeight != null) {
      return '$text Height: ${option.fontHeight}';
    } else {
      return text;
    }
  }

  String _getFirstPartOfTextStyleExplanation(TextGeneratorOption option) {
    return '''
${_getTextStyleShortDescription(option)}
  ///
  /// * FontFamily: Poppins
  /// * FontWeight: ${(option.fontWeight ?? FontsWeight.w400).value}''';
  }

  void _addExplanationAboutText(String textName, TextGeneratorOption option, StringBuffer buffer) {
    final fontSize = option.fontSize;
    final fontHeight = option.fontHeight;

    final textStyle = option.textStyle == TextThemeStyle.empty ? '${textName}Style' : option.textStyle.value;

    if (fontSize == null) {
      buffer.writeln('  /// * FontSize: `$textStyle?.fontSize`');
    } else {
      buffer.writeln('  /// * FontSize: `($fontSize)`');
    }

    if (fontHeight == null) {
      buffer.writeln('  /// * LineHeight: `$textStyle?.height`');
    } else {
      buffer.writeln('  /// * LineHeight: `$fontHeight`');
    }

    buffer.write('///');
  }
}
