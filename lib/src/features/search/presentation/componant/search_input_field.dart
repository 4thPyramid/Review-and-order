import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/src/features/search/presentation/logic/cubit/search_cubit.dart';

class SearchInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'بحث',
        hintText: 'ابحث عن مكان',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(22)),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            final query = _controller.text.trim();
            if (query.isNotEmpty) {
              context.read<SearchCubit>().getSearchResult(query);
            }
          },
        ),
      ),
      onSubmitted: (query) {
        if (query.trim().isNotEmpty) {
          context.read<SearchCubit>().getSearchResult(query);
        }
      },
    );
  }
}
