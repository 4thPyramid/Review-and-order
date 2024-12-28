import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/best_restaurants_cafes_Item.dart';

class BestRestaurantsCafesRow extends StatelessWidget {
  const BestRestaurantsCafesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 255.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(left: 10),
              child: BestRestaurantsCafesCardItem(),
            );
          }),
    );
  }
}