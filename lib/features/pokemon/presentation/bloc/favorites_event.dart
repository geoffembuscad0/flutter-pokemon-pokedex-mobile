part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class GetPokemonsFromFavorites extends FavoritesEvent {
  const GetPokemonsFromFavorites();

  @override
  List<Object> get props => [];
}
