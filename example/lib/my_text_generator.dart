@CodeGen()

import 'package:text_generator/text_generator.dart';

@TextGenerator(baseName: 'MyText', texts: [TextGeneratorOption(name: 'title', textStyle: TextThemeStyle.titleMedium)])
class MyTextGenerator {}
