// ignore_for_file: cascade_invocations, lines_longer_than_80_chars, use_string_buffers

part of '../../text_generator.dart';

mixin _TextGeneratorMixin {
  String get getMaterialImport => "import 'package:flutter/material.dart';";
  String get emptyLine => '''

''';

  Code generateTextClass(String textName, List<TextGeneratorOption> textList) {
    var allTexts = '';
    for (final text in textList) {
      allTexts += generateTextByModel(textName, text);
    }

    return Code('''
${_generateDoNotModifyText()}

$getMaterialImport

${_getAllTextShortDescriptions(textList)}
${_getInitialExplanation()}
${_openTextClass(textName)}

$allTexts

${generateTextByAllParameters(textName)}

${_closeClass()}
''');
  }

  String _getInitialExplanation() {
    return '''
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
    ///''';
  }

  String _getAllTextShortDescriptions(List<TextGeneratorOption> textList) {
    final buffer = StringBuffer();

    for (final text in textList) {
      final weight = (text.fontWeight ?? FontsWeight.w400).value;
      final size = text.fontSize == null ? '' : 'Size: `${text.fontSize}`';
      final height = text.fontHeight == null ? '' : 'Height: `${text.fontHeight}`';

      var line = '/// * ${text.name} $weight ';
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

  String _generateDoNotModifyText() {
    final buffer = StringBuffer();
    buffer.writeln('// **************************************************************************');
    buffer.writeln('// App specific Text widget.');
    buffer.writeln('// **************************************************************************');
    buffer.writeln();
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln();
    buffer.writeln('// **************************************************************************');
    buffer.writeln('// App specific Text widget.');
    buffer.writeln('// **************************************************************************');
    buffer.writeln();
    return buffer.toString();
  }

  String _openTextClass(String textName) {
    return '''
  class $textName extends Text {
    /// It takes only String data.
    const $textName.onlyData(super.data, {super.key});

''';
  }

  String _closeClass() {
    return '''

  }
''';
  }

  String generateTextByModel(String textName, TextGeneratorOption option) {
    final buffer = StringBuffer();
    final firstPart = _getFirstPartOfTextExplanation(textName, option);

    buffer.writeln(firstPart);
    _addExplanationAboutText(textName, option, buffer);

    final maxLines = option.maxLines == null ? 'maxLines' : 'maxLines ?? ${option.maxLines}';
    final align = option.textAlign == null ? 'align' : 'align ?? ${option.textAlign?.value}';
    final overflow = option.overflow == null ? 'overflow' : 'overflow ?? ${option.overflow?.value}';

    return '''
  $buffer
  $textName.${option.name}({
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
          maxLines: $maxLines,
          overflow: $overflow,
          textAlign: $align,
          style: ${textName}Style.${option.name}Style(
            textTheme: Theme.of(context).textTheme,
            decoration: decoration,
            fontStyle: fontStyle,
            color: color,
          ),
        );
''';
  }

  String generateTextByAllParameters(String textName) {
    return '''
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
    const $textName(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  }) : super();
''';
  }

  String _getFirstPartOfTextExplanation(String textName, TextGeneratorOption option) {
    return '''
${_getTextShortDescription(option)}
  ///
  /// TextStyle: `${textName}Style.${option.name}Style`
  ///
  /// * FontFamily: Poppins
  /// * FontWeight: `${(option.fontWeight ?? FontsWeight.w400).value}`''';
  }

  void _addExplanationAboutText(String textName, TextGeneratorOption option, StringBuffer buffer) {
    final fontSize = option.fontSize;
    final fontHeight = option.fontHeight;

    final textStyle = option.textStyle == TextThemeStyle.empty ? '${textName}Style' : option.textStyle.value;

    if (fontSize == null) {
      buffer.writeln('  /// * FontSize: `$textStyle?.fontSize`');
    } else {
      buffer.writeln('  /// * FontSize: `$fontSize`');
    }

    if (fontHeight == null) {
      buffer.writeln('  /// * LineHeight: `$textStyle?.height`');
    } else {
      buffer.writeln('  /// * LineHeight: `$fontHeight`');
    }

    buffer.writeln('///');
  }

  String _getTextShortDescription(TextGeneratorOption option) {
    final text = '  ///${option.name} from `[${option.textStyle.value}]`';
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
}
