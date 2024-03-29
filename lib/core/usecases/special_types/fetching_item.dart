import 'package:deepvr/core/usecases/special_types/fetching_state.dart';

class FetchingItem<T>{
  FetchingState fetchingState = FetchingState.idle;
  T? item;

  FetchingItem({
    required this.fetchingState,
    this.item,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FetchingItem &&
          runtimeType == other.runtimeType &&
          fetchingState == other.fetchingState &&
          item == other.item);

  @override
  int get hashCode => fetchingState.hashCode ^ item.hashCode;

  FetchingItem<T> copyWith({
    FetchingState? fetchingState,
    T? item,
  }) {
    return FetchingItem(
      fetchingState: fetchingState ?? this.fetchingState,
      item: item ?? this.item,
    );
  }



}