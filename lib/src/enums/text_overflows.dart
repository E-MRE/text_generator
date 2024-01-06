part of '../../text_generator.dart';

/// How overflowing text should be handled.
///
/// A TextOverflow can be passed to Text and RichText via their
/// Text.overflow and RichText.overflow properties respectively.
enum TextOverflows {
  /// Clip the overflowing text to fix its container.
  clip('TextOverflow.clip'),

  /// Fade the overflowing text to transparent.
  fade('TextOverflow.fade'),

  /// Use an ellipsis to indicate that the text has overflowed.
  ellipsis('TextOverflow.ellipsis'),

  /// Render overflowing text outside of its container.
  visible('TextOverflow.visible');

  const TextOverflows(this.value);

  ///value of the Text Overflow
  final String value;
}
