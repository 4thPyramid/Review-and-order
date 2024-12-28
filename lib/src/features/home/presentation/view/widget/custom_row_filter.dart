import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_colors.dart';

class CustomRowFilter extends StatefulWidget {
  const CustomRowFilter({super.key});

  @override
  _CustomRowFilterState createState() => _CustomRowFilterState();
}

class _CustomRowFilterState extends State<CustomRowFilter> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<String> chipLabels = [
      'الاماكن القريبه',
      'الاماكن الاعلى تقييم',
      'اماكن جديده',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          chipLabels.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ChoiceChip(
              label: Text(chipLabels[index]),
              selected: selectedIndex == index,
              onSelected: (isSelected) {
                setState(() {
                  selectedIndex = isSelected ? index : -1;
                });
              },
              selectedColor: Colors.black,
              labelStyle: TextStyle(
                color: selectedIndex == index ? AppColors.white : AppColors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
