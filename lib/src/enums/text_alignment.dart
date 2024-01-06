part of '../../text_generator.dart';

/// Whether and how to align text horizontally.
// The order of this enum must match the order of the values in
//RenderStyleConstants.h's ETextAlign.
enum TextAlignment {
  /// Align the text on the left edge of the container.
  left('TextAlign.left'),

  /// Align the text on the right edge of the container.
  right('TextAlign.right'),

  /// Align the text in the center of the container.
  center('TextAlign.center'),

  /// Stretch lines of text that end with a soft line break to fill the width of
  /// the container.
  ///
  /// Lines that end with hard line breaks are aligned towards the [start] edge.
  justify('TextAlign.justify'),

  /// Align the text on the leading edge of the container.
  ///
  /// For left-to-right text (TextDirection.ltr), this is the left edge.
  ///
  /// For right-to-left text (TextDirection.rtl), this is the right edge.
  start('TextAlign.start'),

  /// Align the text on the trailing edge of the container.
  ///
  /// For left-to-right text (TextDirection.ltr), this is the right edge.
  ///
  /// For right-to-left text (TextDirection.rtl), this is the left edge.
  end('TextAlign.end');

  const TextAlignment(this.value);

  ///value of the text alignments
  final String value;
}
