part of '../../text_generator.dart';

/// The thickness of the glyphs used to draw the text
enum FontsWeight {
  /// Thin, the least thick
  w100('FontWeight.w100'),

  /// Extra-light
  w200('FontWeight.w200'),

  /// Light
  w300('FontWeight.w300'),

  /// Normal / regular / plain
  w400('FontWeight.w400'),

  /// Medium
  w500('FontWeight.w500'),

  /// Semi-bold
  w600('FontWeight.w600'),

  /// Bold
  w700('FontWeight.w700'),

  /// Extra-bold
  w800('FontWeight.w800'),

  /// Black, the most thick
  w900('FontWeight.w900'),

  /// A commonly used font weight that is heavier than normal.
  bold('FontWeight.bold'),

  /// The default font weight.
  normal('FontWeight.normal');

  const FontsWeight(this.value);

  ///value of the Font Weight
  final String value;
}
