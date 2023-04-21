import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex_sample/core/use_cases/use_case.dart';
import 'package:flutter_pokedex_sample/core/utils/utils.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/use_cases/get_favorite_pokemons.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritePokemons getFavoritePokemons;

  FavoritesBloc({
    required this.getFavoritePokemons,
  }) : super(EmptyFavorites()) {
    on<GetPokemonsFromFavorites>((event, emit) async {
      emit(LoadingFavorites());

      final failureOrPokemons = await getFavoritePokemons(NoParams());

      emit(
        failureOrPokemons.fold(
          (failure) => ErrorFavorites(message: mapFailureToMessage(failure)),
          (pokemons) => LoadedFavorites(pokemons: pokemons),
        ),
      );
    });
  }
}
