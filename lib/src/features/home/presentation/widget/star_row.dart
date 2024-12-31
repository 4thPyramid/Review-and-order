import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarRow extends StatelessWidget {
  const StarRow({
    super.key,
  });

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
          itemSize: 12,
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
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
