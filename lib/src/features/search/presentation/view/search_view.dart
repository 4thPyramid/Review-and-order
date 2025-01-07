import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/src/features/search/presentation/componant/search_input_field.dart';
import 'package:review_app/src/features/search/presentation/componant/search_result_componant.dart';
import 'package:review_app/src/features/search/presentation/logic/cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SearchInputField(),
            const SizedBox(height: 16),
            const Expanded(
              child: SearchResultsList(),
            ),
          ],
        ),
      ),
    );
  }
}
