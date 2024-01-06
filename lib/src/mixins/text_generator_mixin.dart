// ignore_for_file: cascade_invocations, lines_longer_than_80_chars, use_string_buffers

part of '../../text_generator.dart';

mixin _TextGeneratorMixin {
  String get getMaterialImport => "import 'package:flutter/material.dart';";
  String get emptyLine => '''

''';

  Code generateAppTextClass(List<TextGeneratorOption> appTextList) {
    var allTexts = '';
    for (final appText in appTextList) {
      allTexts += generateTextByModel(appText);
    }

    return Code('''
${_generateDoNotModifyText()}

$getMaterialImport

${_getAllTextShortDescriptions(appTextList)}
${_getInitialExplanation()}
${_openTextClass()}

$allTexts

${generateAppTextByAllParameters()}

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

  String _getAllTextShortDescriptions(List<TextGeneratorOption> appTextList) {
    final buffer = StringBuffer();

    for (final appText in appTextList) {
      final weight = (appText.fontWeight ?? FontsWeight.w400).value;
      final size = appText.fontSize == null ? '' : 'Size: `${appText.fontSize}`';
      final height = appText.fontHeight == null ? '' : 'Height: `${appText.fontHeight}`';

      var line = '/// * ${appText.name} $weight ';
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

  String _openTextClass() {
    return '''
  class AppText extends Text {
    /// It takes only String data.
    const AppText.onlyData(super.data, {super.key});

''';
  }

  String _closeClass() {
    return '''

  }
''';
  }

  String generateTextByModel(TextGeneratorOption appText) {
    final buffer = StringBuffer();
    final firstPart = _getFirstPartOfTextExplanation(appText);

    buffer.writeln(firstPart);
    _addExplanationAboutText(appText, buffer);

    final maxLines = appText.maxLines == null ? 'maxLines' : 'maxLines ?? ${appText.maxLines}';
    final align = appText.textAlign == null ? 'align' : 'align ?? ${appText.textAlign?.value}';
    final overflow = appText.overflow == null ? 'overflow' : 'overflow ?? ${appText.overflow?.value}';

    return '''
  $buffer
  AppText.${appText.name}({
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
          style: AppTextStyle.${appText.name}Style(
            textTheme: Theme.of(context).textTheme,
            decoration: decoration,
            fontStyle: fontStyle,
            color: color,
          ),
        );
''';
  }

  String generateAppTextByAllParameters() {
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
    const AppText(
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
''';
  }

  String _getFirstPartOfTextExplanation(TextGeneratorOption appText) {
    return '''
${_getAppTextShortDescription(appText)}
  ///
  /// TextStyle: `AppTextStyle.${appText.name}Style`
  ///
  /// * FontFamily: Poppins
  /// * FontWeight: `${(appText.fontWeight ?? FontsWeight.w400).value}`''';
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

    buffer.writeln('///');
  }

  String _getAppTextShortDescription(TextGeneratorOption appText) {
    final text = '  ///${appText.name} from `[${appText.textStyle.value}]`';
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
}
