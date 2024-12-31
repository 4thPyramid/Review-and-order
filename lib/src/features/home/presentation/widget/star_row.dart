import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/utils/app_styles.dart';

class StarRow extends StatelessWidget {
  const StarRow({
    super.key, this.itemSize,this.textStyle
  });
final double? itemSize;
final TextStyle?  textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 4,
          itemSize:itemSize?? 12,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            //print("Rating is: $rating");
          },
        ),
        const SizedBox(width: 5),
        Text(
          '4.7 ',
          style: textStyle??AppStyles.s12
         
          
        ),
      ],
    );
  }
}
