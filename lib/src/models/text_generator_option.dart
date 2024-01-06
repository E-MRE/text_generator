part of '../../text_generator.dart';

/// This class that represents the options for generating text. It has several
/// constructors that allow you to create instances of the class with different
/// combinations of optional parameters. that can be used to customize the
/// generated text.
final class TextGeneratorOption {
  /// The constructor is creating an instance of the `TextGeneratorOption`
  /// class with several optional parameters.
  const TextGeneratorOption({
    required this.name,
    required this.textStyle,
    this.fontWeight,
    this.textAlign,
    this.fontSize,
    this.fontHeight,
    this.overflow,
    this.maxLines,
  });

  /// The constructor is creating an instance of the `TextGeneratorOption` class
  /// with a normal font weight. It takes several parameters.
  const TextGeneratorOption.normalWeight({
    required this.name,
    required this.textStyle,
    this.fontWeight = FontsWeight.normal,
    this.textAlign,
    this.fontSize,
    this.fontHeight,
    this.overflow,
    this.maxLines,
  });

  /// The constructor is creating an instance of the `TextGeneratorOption` class
  /// with a bold font weight. It takes several parameters. This constructor
  /// allows you to easily create a `TextGeneratorOption` object with a bold
  /// font weight without having to specify all the other optional parameters
  /// if you don't need to.
  const TextGeneratorOption.boldWeight({
    required this.name,
    required this.textStyle,
    this.fontWeight = FontsWeight.bold,
    this.textAlign,
    this.fontSize,
    this.fontHeight,
    this.overflow,
    this.maxLines,
  });

  /// The constructor is creating an instance of the `TextGeneratorOption` class
  /// with a medium font weight. It takes several parameters such as `name`,
  /// `textStyle`, `fontWeight`, `textAlign`, `fontSize`, `fontHeight`,
  /// `overflow`, and `maxLines`.
  const TextGeneratorOption.mediumWeight({
    required this.name,
    required this.textStyle,
    this.fontWeight = FontsWeight.w500,
    this.textAlign,
    this.fontSize,
    this.fontHeight,
    this.overflow,
    this.maxLines,
  });

  /// The `const TextGeneratorOption.semiBoldWeight()` constructor is creating
  ///an instance of the `TextGeneratorOption` class with a semi-bold font weight
  const TextGeneratorOption.semiBoldWeight({
    required this.name,
    required this.textStyle,
    this.fontWeight = FontsWeight.w600,
    this.textAlign,
    this.fontSize,
    this.fontHeight,
    this.overflow,
    this.maxLines,
  });

  ///Generated text name
  final String name;

  ///Generated text style. It uses text theme styles. If you don't want to use
  ///any style then you can choose empty option.
  final TextThemeStyle textStyle;

  ///Alignment of the generated text.
  final TextAlignment? textAlign;

  ///Font size of the generated text.
  final double? fontSize;

  ///Height of the generated text.
  final double? fontHeight;

  ///Font weight of the generated text.
  final FontsWeight? fontWeight;

  ///overflow value of the generated text.
  final TextOverflows? overflow;

  ///Max lines of the generated text.
  final int? maxLines;
}
