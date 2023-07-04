import 'package:fitness/pages/BaseLayout.dart';
import 'package:flutter/material.dart';

import '../components/CustomAppBar.dart';
import '../models/recipe_model.dart';

class RecipeScreen extends StatelessWidget {
  final RecipeModel recipe;
  RecipeScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      screen: 'Recipe',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 1.0, // Adjust the aspect ratio as needed
              child: Image.asset(
                recipe.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    recipe.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Ingredients',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: recipe.ingredients.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(recipe.ingredients[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
