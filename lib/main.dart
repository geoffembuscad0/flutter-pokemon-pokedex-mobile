import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_pokedex_sample/core/themes/theme.dart';
import 'package:flutter_pokedex_sample/features/pokemon/presentation/bloc/bloc.dart';
import 'package:flutter_pokedex_sample/features/pokemon/presentation/pages/pages.dart';
import 'package:flutter_pokedex_sample/injection_container.dart' as di;

void main() {
  // Inject dependencies.
  di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<PokemonBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (_) => const HomePage(),
          FavoritesPage.routeName: (_) => const FavoritesPage(),
        },
        theme: AppTheme.theme,
      ),
    );
  }
}
