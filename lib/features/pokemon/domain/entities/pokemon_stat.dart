import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex_sample/features/pokemon/domain/entities/stat.dart';

class PokemonStat extends Equatable {
  /// The base value of the stat.
  final int baseStat;

  /// The stat the Pokemon has.
  final Stat stat;

  const PokemonStat({
    required this.baseStat,
    required this.stat,
  });

  @override
  List<Object> get props => [baseStat, stat];
}
