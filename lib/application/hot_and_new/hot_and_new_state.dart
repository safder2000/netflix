part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState(
      {required List<HotAndNewData> comingSoonList,
      required List<HotAndNewData> everyoneIsWatchList,
      required bool isLoading,
      required bool hasError}) = _Initial;
  factory HotAndNewState.initial() => HotAndNewState(
      comingSoonList: [],
      everyoneIsWatchList: [],
      hasError: false,
      isLoading: false);
}
