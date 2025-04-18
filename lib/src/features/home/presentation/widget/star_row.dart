import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:review_app/core/utils/app_styles.dart';

class StarRow extends StatelessWidget {
  const StarRow(
      {super.key, this.itemSize, this.textStyle, required this.rating});
  final double? itemSize;
  final TextStyle? textStyle;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          ignoreGestures: true,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 4,
          itemSize: itemSize ?? 12,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            //print("Rating is: $rating");
          },
        ),
        const SizedBox(width: 5),
        SizedBox(
          width: 35.w,
          child: Text(
            rating.toString(),
            style: textStyle ?? AppStyles.s12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
