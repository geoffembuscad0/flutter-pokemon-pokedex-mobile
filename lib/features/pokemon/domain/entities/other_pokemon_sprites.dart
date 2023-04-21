import 'package:equatable/equatable.dart';

import 'package:flutter_pokedex_sample/features/pokemon/domain/entities/official_artwork_sprites.dart';

class OtherPokemonSprites extends Equatable {
  final OfficialArtworkSprites officialArtwork;

  const OtherPokemonSprites({
    required this.officialArtwork,
  });

  @override
  List<Object> get props => [officialArtwork];
}
