import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex_sample/core/error/failures.dart';
import 'package:flutter_pokedex_sample/core/use_cases/use_case.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/repositories/pokemon_repository.dart';

class RemoveFavoritePokemon
    implements UseCase<Pokemon, RemoveFavoritePokemonParams> {
  final PokemonRepository repository;

  RemoveFavoritePokemon(this.repository);

  @override
  Future<Either<Failure, Pokemon>> call(RemoveFavoritePokemonParams params) {
    return repository.removeFavoritePokemon(params.id);
  }
}

class RemoveFavoritePokemonParams extends Equatable {
  final int id;

  const RemoveFavoritePokemonParams({required this.id});

  @override
  List<Object> get props => [id];
}
