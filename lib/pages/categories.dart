import 'package:fitness/components/CustomAppBar.dart';
import 'package:fitness/components/FavoriteButton.dart';
import 'package:fitness/pages/BaseLayout.dart';
import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

class CategoriesScreen extends StatelessWidget {
  final String name;

  CategoriesScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> recipes = RecipeModel.getRecipes();

    List<RecipeModel> smoothieRecipes = recipes.where((recipe) {
      return recipe.type.contains(name.toLowerCase());
    }).toList();

    print(smoothieRecipes);

    return BaseLayout(
      screen: 'Categories',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(name,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: smoothieRecipes.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Align(
                    alignment: Alignment.center, // Align the row to the left
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 370,
                          height: 250,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0x0ae8e8e8),
                                        Color(0x66d1d1d1),
                                      ],
                                      stops: [0.2, 1],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          child: Image.asset(
                                            smoothieRecipes[index].imagePath,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 30),
                                        child: Text(
                                          smoothieRecipes[index].name,
                                          style: TextStyle(color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FavoriteButton()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
