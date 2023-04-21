import 'package:flutter/material.dart';
import 'package:flutter_pokedex_sample/themes/theme_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pokedex_sample/features/pokemon/presentation/bloc/bloc.dart';
import 'package:flutter_pokedex_sample/features/pokemon/presentation/bloc/favorites_bloc.dart';
import 'package:flutter_pokedex_sample/features/pokemon/presentation/widgets/widgets.dart';
import 'package:flutter_pokedex_sample/injection_container.dart' as di;

class FavoritesPage extends StatelessWidget {
  static const String routeName = 'favorites';

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    String favoritesTxt = 'Favorites';
    return BlocProvider(
      create: (context) => di.sl<FavoritesBloc>(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(favoritesTxt, style: appTitleBar),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<FavoritesBloc, FavoritesState>(
              builder: (context, state) {
                if (state is Loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is LoadedFavorites) {
                  final pokemons = state.pokemons;

                  if (pokemons.isEmpty) {
                    return const MessageDisplay(
                      message: 'No hay favoritos por mostrar',
                    );
                  }

                  return FavoritesList(pokemons: pokemons);
                }

                if (state is ErrorFavorites) {
                  return MessageDisplay(message: state.message);
                }

                // Start loading favorites.
                BlocProvider.of<FavoritesBloc>(context).add(
                  const GetPokemonsFromFavorites(),
                );

                return Container();
              },
            ),
          )),
    );
  }
}
