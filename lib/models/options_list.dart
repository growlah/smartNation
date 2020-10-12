import 'package:smart_nation/utils/common_strings.dart';

class Options{
  String title;
  Options(this.title);
}
class OptionsListResult{
  static List<Options> getOptionsList(){
    List<Options> optionsList=[
      Options(CommonStrings.ai),
      Options(CommonStrings.da),
      Options(CommonStrings.iot),
      Options(CommonStrings.coding),
      Options(CommonStrings.dsa),
      Options(CommonStrings.dm),
    ];
    return optionsList;
  }
}

