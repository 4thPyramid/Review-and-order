import 'package:flutter/material.dart';

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
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: RestaurantCard(),
        );
      },
    );
  }
}
