import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:review_app/core/routes/router_names.dart';
import 'package:review_app/src/features/search/presentation/logic/cubit/search_cubit.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.when(
          initial: () =>
              const Center(child: Text('ابحث عن افضل الاماكن القريبه منك ')),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (searchResponse) {
            final places = searchResponse.first.data;
            if (places.isEmpty) {
              return const Center(child: Text('لا يوجد نتائج'));
            }
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return ListTile(
                  onTap: () {
                    context.pushReplacement(
                      RouterNames.placeDetailsView,
                      extra: {'placeId': places[index].id},
                    );
                  },
                  title: Text(place.name),
                  subtitle: Text(place.status),
                  leading: place.coverImage != null
                      ? Image.network(place.coverImage!)
                      : const Icon(Icons.place),
                );
              },
            );
          },
          error: (error) => Center(child: Text('Error: ${error.message}')),
        );
      },
    );
  }
}
