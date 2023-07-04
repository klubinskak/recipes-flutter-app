import 'package:fitness/pages/BaseLayout.dart';
import 'package:fitness/pages/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/category_model.dart';
import '../models/diet_model.dart';
import '../models/recipe_model.dart';
import 'categories.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<RecipeModel> recipes = [];
  List<RecipeModel> filteredRecipes = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getDiets();
    _getRecipes();
  }

  void updateList(String value) {
    setState(() {
      filteredRecipes = recipes
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getRecipes() {
    recipes = RecipeModel.getRecipes();
  }


  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      screen: 'Home',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            const SizedBox(height: 40),
            _categoriesSection(categories: categories),
            const SizedBox(height: 40),
            _dietSection(diets: diets, recipes: recipes),
          ],
        ),
      ),
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.11),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                updateList(value);
                setState(() {
                  query = value;
                });
              },
              autofocus: false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search Recipes',
                hintStyle: const TextStyle(
                  color: Color(0xffDDDADA),
                  fontSize: 14,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Search.svg'),
                ),
                suffixIcon: Container(
                  width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const VerticalDivider(
                          color: Colors.black,
                          thickness: 0.1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset('assets/icons/Filter.svg'),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            if (query.isNotEmpty) ...[
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: filteredRecipes.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          height: 124,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              filteredRecipes[index].imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RecipeScreen(
                                  recipe: filteredRecipes[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      bottom: 8), // Add margin to the bottom
                                  child: Text(
                                    filteredRecipes[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(filteredRecipes[index].description,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Breakfast',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
              height: 20, width: 20),
          decoration: const BoxDecoration(color: Color(0xffF7F8F8)),
        ),
      ),
      actions: [
        GestureDetector(
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child:
                SvgPicture.asset('assets/icons/dots.svg', height: 5, width: 5),
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ],
    );
  }
}

class _dietSection extends StatelessWidget {
  const _dietSection({
    Key? key,
    required this.diets,
    required this.recipes,
  }) : super(key: key);

  final List<DietModel> diets;
  final List<RecipeModel> recipes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Popular 🔥',
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 15),
        Container(
            height: 240,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                      color: diets[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        recipes[index].iconPath ?? '',
                        width: 60,
                        height: 60,
                      ),
                      Column(
                        children: [
                          Text(
                            recipes[index].name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            recipes[index].lvl +
                                ' | ' +
                                recipes[index].duration +
                                'min' +
                                ' | ' +
                                recipes[index].kcal +
                                'kcal',
                            style: TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RecipeScreen(recipe: recipes[index]),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: diets[index].viewIsSelected
                              ? const Color(0xff9DCEFF)
                              : Colors.white,
                          onPrimary: diets[index].viewIsSelected
                              ? Colors.white
                              : const Color(0xffC58BF2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Container(
                          height: 45,
                          width: 130,
                          child: Center(
                            child: Text(
                              'View',
                              style: TextStyle(
                                color: diets[index].viewIsSelected
                                    ? Colors.white
                                    : const Color(0xffC58BF2),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 25,
              ),
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
            ))
      ],
    );
  }
}

class _categoriesSection extends StatelessWidget {
  const _categoriesSection({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CategoriesScreen(name: categories[index].name),
                    ),
                  );
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(categories[index].iconPath),
                        ),
                      ),
                      Text(
                        categories[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
