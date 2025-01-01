import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/routes/router_names.dart';
import '../widget/restaurant_card.dart';

class ExtraSuggestions extends StatelessWidget {
  const ExtraSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () {
              context.go(RouterNames.placeDetailsView);
            },
            //  child: const RestaurantCard()),
            child: RestaurantCard(
              rating: 4,
              location: "",
            ),
          ),
        );
      },
    );
  }
}
