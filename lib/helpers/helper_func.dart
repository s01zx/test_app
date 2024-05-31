import 'package:test_app/helpers/sizeConfig.dart';

double calculateSize(double size) {
  var val = size / 8.5; //8.53
  return val * SizeConfig.heightMultiplier!;
}
