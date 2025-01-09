import 'package:flutter/material.dart';
import 'package:review_app/src/features/place_details/presentation/widgets/comment_card.dart';

class CommentsList extends StatelessWidget {
  const CommentsList(
      {super.key,
      required this.userProfileImagePath,
      required this.userName,
      required this.userEmail,
      required this.commentImagePath,
      required this.commentText,
      required this.rate,
      });
  final String userProfileImagePath;
  final String userName;
  final String userEmail;
  final String commentImagePath;
  final String commentText;
  final double rate;

  @override
  Widget build(BuildContext context) {
    
        return CommentCard(
          profileImagePath: userProfileImagePath,
          userName: userName,
          userEmail: userEmail,
          commentImagePath: commentImagePath,
          commentText: commentText,
          rate: rate,
        );
      
    
  }
}
