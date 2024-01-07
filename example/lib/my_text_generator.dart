@CodeGen()

import 'package:text_generator/text_generator.dart';

@TextGenerator(baseName: 'MyText', texts: [
  //output -> MyText.title(....)
  TextGeneratorOption(name: 'title', textStyle: TextThemeStyle.titleMedium),
  //output -> MyText.subTitle(...)
  TextGeneratorOption.semiBoldWeight(name: 'semiBoldSubTitle', textStyle: TextThemeStyle.bodyMedium),
  // output -> MyText.custom(...)
  TextGeneratorOption(name: 'custom', textStyle: TextThemeStyle.empty),
  // output -> MyText.normal(...)
  TextGeneratorOption(
    maxLines: 2,
    fontSize: 14,
    name: 'normal',
    fontHeight: 1.2,
    textAlign: TextAlignment.left,
    fontWeight: FontsWeight.normal,
    overflow: TextOverflows.ellipsis,
    textStyle: TextThemeStyle.bodyMedium,
  ),
])
class MyTextGenerator {}
