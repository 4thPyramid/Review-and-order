import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/home_cubit.dart';
import '../../../../../core/theme/app_colors.dart';

class CustomRowFilter extends StatelessWidget {
  const CustomRowFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> chipLabels = [
      'nearest',
      'top-rated',
      'new',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          chipLabels.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final currentFilter =
                    BlocProvider.of<HomeCubit>(context).currentFilter;
                return ChoiceChip(
                  label: Text(_getLabelText(chipLabels[index])),
                  selected: currentFilter == chipLabels[index],
                  onSelected: (isSelected) {
                    if (isSelected) {
                      BlocProvider.of<HomeCubit>(context)
                          .setFilter(chipLabels[index]);
                    }
                  },
                  selectedColor: Colors.black,
                  labelStyle: TextStyle(
                    color: currentFilter == chipLabels[index]
                        ? AppColors.white
                        : AppColors.black,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  String _getLabelText(String key) {
    switch (key) {
      case 'nearest':
        return 'الأماكن القريبة';
      case 'top-rated':
        return 'الأماكن الأعلى تقييمًا';
      case 'new':
        return 'أماكن جديدة';
      default:
        return '';
    }
  }
}
