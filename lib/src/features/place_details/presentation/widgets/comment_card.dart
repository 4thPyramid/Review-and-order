import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import 'comment_image_widget.dart';
import 'profile_list_title.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.profailImagePath,
    required this.userName,
    required this.userEmail,
    required this.commentImagePath,
    required this.commentText,
    required this.rate,
  });
  final String profailImagePath;
  final String userName;
  final String userEmail;
  final String commentImagePath;
  final String commentText;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.all(20.r),
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ProfileListTile(
              imageUrl: profailImagePath,
              name: userName,
              email: userEmail,
            ),
            SizedBox(height: 20.h),
            CommentContentWidget(
              imagePath: commentImagePath,
              commentText: commentText,
              rate: rate,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
