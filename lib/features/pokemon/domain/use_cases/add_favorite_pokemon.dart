import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex_sample/core/error/failures.dart';
import 'package:flutter_pokedex_sample/core/use_cases/use_case.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/repositories/pokemon_repository.dart';

class AddFavoritePokemon implements UseCase<Pokemon, AddFavoritePokemonParams> {
  final PokemonRepository repository;

  AddFavoritePokemon(this.repository);

  @override
  Future<Either<Failure, Pokemon>> call(AddFavoritePokemonParams params) {
    return repository.addFavoritePokemon(params.pokemon);
  }
}

class AddFavoritePokemonParams extends Equatable {
  final Pokemon pokemon;

  const AddFavoritePokemonParams({required this.pokemon});

  @override
  List<Object> get props => [pokemon];
}
