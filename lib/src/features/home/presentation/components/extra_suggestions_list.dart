import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/utils/app_assets.dart';
import 'package:review_app/src/features/home/presentation/logic/cubit/home_cubit.dart';

import '../../../../../../core/routes/router_names.dart';
import '../widget/restaurant_card.dart';

class ExtraSuggestions extends StatelessWidget {
  const ExtraSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeCubit>(context).getNewPlaces();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return state.when(
        initial: () => const Text('Loading ...'),
        loading: () => const CircularProgressIndicator(),
        loaded: (places) => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: places.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                onTap: () {
                  context.pushReplacement(
                    RouterNames.placeDetailsView,
                    extra: {'placeId': places[index].id},
                  );
                },
                child: RestaurantCard(
                  resurantName: places[index].name,
                  resurantLocation:
                      places[index].mapDisc.split("").take(15).join(),
                  resurantRate: places[index].rating,
                  resurantImage:
                      places[index].coverImage ?? AppAssets.onboarding1,
                  resurantStatus: places[index].status,
                ),
              ),
            );
          },
        ),
        error: (error) => Text(error.message),
        locationUpdated: () {
          if (kDebugMode) {
            print("locationUpdated");
          }
          return const SizedBox.shrink();
        },
      );
    });
  }
}
