import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/src/features/home/presentation/logic/cubit/home_cubit.dart';

import '../widget/best_restaurants_cafes_Item.dart';

class BestRestaurantsCafesRow extends StatelessWidget {
  const BestRestaurantsCafesRow({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getPlacesPyFilter();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return state.when(
        initial: () => const Text('Loading ...'),
        loading: () => const CircularProgressIndicator(),
        loaded: (places) => SizedBox(
          height: 255.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10),
                child: BestRestaurantsCafesCardItem(
                  onTap: () {
                    context.pushReplacement(
                      RouterNames.placeDetailsView,
                      extra: {'placeId': places[index].id},
                    );
                    print("**************${places[index].id}****************");
                  },
                  resurantName: places[index].name,
                  resurantLocation:
                      places[index].mapDisc.split("").take(15).join(),
                  resurantRate: places[index].rating,
                  resurantImage:
                      places[index].coverImage ?? AppAssets.onboarding1,
                ),
              );
            },
          ),
        ),
        error: (error) => Text(error.message),
      );
    });
  }
}
