import 'package:lose_it_calory_tracker/provider/st_lb.dart';

class Weight {
  double lbWeight;
  StLb stLbWeight;
  double kgWeight;
  Weight({
required this.lbWeight,
required this.stLbWeight,
required this.kgWeight,

  });


factory Weight.fromWeight( double lbWeight,
StLb stlb,
  double kgWeight,){
  return Weight(lbWeight: lbWeight, stLbWeight: stlb, kgWeight: kgWeight);
}
}
