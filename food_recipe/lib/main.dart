import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/views/intro_view/intro_view.dart';
import 'package:recipe_app/views/recipe_view/recipe_saved_view.dart';
import 'package:recipe_app/views/save_view/save_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/constants/routes.dart';
import 'components/providers/provider.dart';
import 'views/filter_view/filter_view.dart';
import 'views/recipe_view/recipe_view.dart';
import 'views/scramble_view/scramble_view.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: prefs.getBool("intro") !=null ? const ScrambleView():const IntroView(),
        routes: {
          scrambleViewRoute: (context) => const ScrambleView(),
          filterViewRoute: (context) => const FilterView(),
          recipeViewRoute: (context) => const RecipeView(),
          saveViewRoute: (context) => const SaveView(),
          introViewRoute: (context) => const IntroView(),
          recipeSavedViewRoute: (context) => const RecipeSavedView(),
        },
      ),
    ),
  );
}
