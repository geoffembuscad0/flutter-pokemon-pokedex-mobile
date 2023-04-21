import 'package:flutter_pokedex_sample/features/pokemon/data/models/type_model.dart';
import 'package:flutter_pokedex_sample/features/pokemon/domain/entities/pokemon_type.dart';

class PokemonTypeModel extends PokemonType {
  const PokemonTypeModel({required super.slot, required super.type});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) {
    return PokemonTypeModel(
      slot: json['slot'],
      type: TypeModel.fromJson(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slot': slot,
      'type': type.toJson(),
    };
  }

  @override
  TypeModel get type {
    return TypeModel(name: super.type.name);
  }
}
