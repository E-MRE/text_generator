part of '../../text_generator.dart';

/// The `enum TextThemeStyle` defines a set of text styles that can be used in
/// an application. Each text style has a name and a corresponding value.
/// The names describe the size and purpose of the text style, such as
///  "displayLarge" for the largest display style or "bodySmall" for the
/// smallest body style. The values are strings that represent the names of
/// the text styles. The `const TextThemeStyle(this.value)` constructor assigns
/// the value to each text style. The `value` property is a getter that returns
///  the value of the text style.
enum TextThemeStyle {
  /// Largest of the display styles.
  ///
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  displayLarge('displayLarge'),

  /// Middle size of the display styles.
  ///
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  displayMedium('displayMedium'),

  /// Smallest of the display styles.
  ///
  /// As the largest text on the screen, display styles are reserved for short,
  /// important text or numerals. They work best on large screens.
  displaySmall('displaySmall'),

  /// Largest of the headline styles.
  ///
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  headlineLarge('headlineLarge'),

  /// Middle size of the headline styles.
  ///
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  headlineMedium('headlineMedium'),

  /// Smallest of the headline styles.
  ///
  /// Headline styles are smaller than display styles. They're best-suited for
  /// short, high-emphasis text on smaller screens.
  headlineSmall('headlineSmall'),

  /// Largest of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  titleLarge('titleLarge'),

  /// Middle size of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  titleMedium('titleMedium'),

  /// Smallest of the title styles.
  ///
  /// Titles are smaller than headline styles and should be used for shorter,
  /// medium-emphasis text.
  titleSmall('titleSmall'),

  /// Largest of the body styles.
  ///
  /// Body styles are used for longer passages of text.
  bodyLarge('bodyLarge'),

  /// Middle size of the body styles.
  ///
  /// Body styles are used for longer passages of text.
  ///
  /// The default text style for Material.
  bodyMedium('bodyMedium'),

  /// Smallest of the body styles.
  ///
  /// Body styles are used for longer passages of text.
  bodySmall('bodySmall'),

  /// Largest of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  ///
  /// Used for text on ElevatedButton, TextButton and OutlinedButton.
  labelLarge('labelLarge'),

  /// Middle size of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  labelMedium('labelMedium'),

  /// Smallest of the label styles.
  ///
  /// Label styles are smaller, utilitarian styles, used for areas of the UI
  /// such as text inside of components or very small supporting text in the
  /// content body, like captions.
  labelSmall('labelSmall'),

  ///There is no text style.
  empty('AppTextStyle');

  const TextThemeStyle(this.value);

  ///value of text styles
  final String value;
}
