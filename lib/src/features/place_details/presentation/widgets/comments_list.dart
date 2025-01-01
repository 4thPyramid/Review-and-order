import 'package:flutter/material.dart';
import 'package:review_app/src/features/place_details/presentation/widgets/add_image_and_btn.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return const AddImageAndBtn();
      },
    );
  }
}
