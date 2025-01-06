import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_app/src/features/search/presentation/logic/cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Places'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // حقل إدخال البحث
            SearchInputField(),
            const SizedBox(height: 16),
            // عرض نتائج البحث
            Expanded(
              child: SearchResultsList(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  SearchInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Search',
        hintText: 'Enter a place name',
        border: OutlineInputBorder(),
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

class SearchResultsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('Enter a search query')),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (searchResponse) {
            final places = searchResponse.first.data;
            if (places.isEmpty) {
              return const Center(child: Text('No results found'));
            }
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return ListTile(
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
