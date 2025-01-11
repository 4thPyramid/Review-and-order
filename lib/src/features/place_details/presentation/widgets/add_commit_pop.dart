import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review_app/core/theme/app_colors.dart';
import 'package:review_app/core/utils/app_strings.dart';
import 'package:review_app/src/features/place_details/presentation/logic/cubit/add_commit_cubit.dart';
import '../../../../../core/common/widgets/custom_btn.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/main_function.dart';
import '../logic/place_details/place_details_cubit.dart';
import 'comment_image_widget.dart';

addCommitPop(BuildContext context,
    {required int placeId, required String name, required String imageUrl}) {
  TextEditingController controller = TextEditingController();
  double rating = 0.0;
  File? selectedImage;

  customAlertDialog(
      context: context,
      marginHPadding: 20.h,
      marginVPadding: 20.h,
      hPadding: 12.w,
      vPadding: 12.h,
      content: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          top: -70.h,
          //right: 120,
          left: MediaQuery.sizeOf(context).width / 2 - 65.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(120.r),
            child: Image.network(
              imageUrl,
              width: 100.r,
              height: 100.r,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding:
              EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w, bottom: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: AppStyles.s16.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                AppStrings.youThinkOfTheRestaurant,
                style: AppStyles.s14.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                AppStrings.feedbackWillHelpImprove,
                style: AppStyles.s12.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20.h),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30.r,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (newRating) {
                  rating = newRating;
                  print('New rating: $rating');
                },
              ),
              SizedBox(height: 20.h),
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: AppColors.redWhite,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  maxLines: 5,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: AppStrings.addCommit,
                    hintStyle: AppStyles.s14.copyWith(
                      color: AppColors.black,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              AddImageWidget(
                onImageSelected: (File? image) {
                  selectedImage = image;
                },
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: AppStrings.sendCommit,
                onPressed: () {
                  print('placeId: $placeId');
                  print('rating: $rating');
                  print('comment: ${controller.text}');
                  print('image: $selectedImage');

                  if (rating > 0 && controller.text.isNotEmpty) {
                    context
                        .read<AddCommitCubit>()
                        .addCommit(placeId, controller.text, selectedImage!);
                    context.read<AddCommitCubit>().addRate(placeId, rating);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('برجاء إدخال التقييم والتعليق')),
                    );
                  }
                },
              )
            ],
          ),
        ))
      ]));
}

class AddImageWidget extends StatefulWidget {
  final Function(File?) onImageSelected;

  const AddImageWidget({
    super.key,
    required this.onImageSelected,
  });

  @override
  State<AddImageWidget> createState() => _AddImageWidgetState();
}

class _AddImageWidgetState extends State<AddImageWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        widget.onImageSelected(_image);
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: 100.h,
            width: 100.h,
            decoration: BoxDecoration(
              color: AppColors.redWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: _image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.file(
                      _image!,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(Icons.add_a_photo),
          ),
        ),
        SizedBox(width: 20.w),
      ],
    );
  }
}
