import 'package:flutter/material.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/src/features/place_details/presentation/widgets/comment_card.dart';

class CommentsList extends StatelessWidget {
  const CommentsList(
      {super.key,
      required this.userProfilImagePath,
      required this.userName,
      required this.userEmail,
      required this.commentImagePath,
      required this.commentText,
      required this.rate,
      required this.itemCount});
  final String userProfilImagePath;
  final String userName;
  final String userEmail;
  final String commentImagePath;
  final String commentText;
  final double rate;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return CommentCard(
          profailImagePath: AppAssets.profileImage,
          userName: userName,
          userEmail: userEmail,
          commentImagePath: commentImagePath,
          commentText: commentText,
          rate: rate,
        );
      },
    );
  }
}
