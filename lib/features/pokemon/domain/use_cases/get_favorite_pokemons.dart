import 'package:dartz/dartz.dart';

import 'package:flutter_pokedex_sample/core/error/failures.dart';
import 'package:flutter_pokedex_sample/core/use_cases/use_case.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/entities/pokemon.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/repositories/pokemon_repository.dart';

class GetFavoritePokemons implements UseCase<List<Pokemon>, NoParams> {
  final PokemonRepository repository;

  GetFavoritePokemons(this.repository);

  @override
  Future<Either<Failure, List<Pokemon>>> call(NoParams params) {
    return repository.getFavoritePokemons();
  }
}
