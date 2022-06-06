import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchState {
  SearchState(this.showResolvedTickets);

  bool showResolvedTickets;
}

class SearchStateNotifier extends StateNotifier<SearchState> {
  SearchStateNotifier([SearchState? initialState])
      : super(initialState ?? SearchState(false));

  void toggle() {
    state = SearchState(!state.showResolvedTickets);
  }
}

final searchStateProvider = StateNotifierProvider<SearchStateNotifier, SearchState>((ref) => SearchStateNotifier());