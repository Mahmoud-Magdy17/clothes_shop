part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchImageSuccess extends SearchState {
  final Uint8List image;
  final String prediction;

  const SearchImageSuccess({required this.image, required this.prediction});

  @override
  List<Object?> get props => [image, prediction];
}

final class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
