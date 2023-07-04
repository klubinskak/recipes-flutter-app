class RecipeModel {
  String name;
  String description;
  List<String> ingredients;
  List<String> instructions;
  String imagePath;
  String duration;
  String kcal;
  String? iconPath;
  String lvl;
  String type;

  RecipeModel({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.imagePath,
    required this.duration,
    required this.kcal,
    this.iconPath,
    required this.lvl,
    required this.type,
  });

  static List<RecipeModel> getRecipes() {
    List<RecipeModel> recipes = [];

    recipes.add(
      RecipeModel(
          name: 'Classic Pancakes',
          description: 'The all-time favorite fluffy pancakes.',
          duration: '10',
          kcal: '500',
          lvl: 'Easy',
          type: "cake, pie, breakfast",
          ingredients: [
            '1 cup all-purpose flour',
            '1 tablespoon sugar',
            '1 teaspoon baking powder',
            '1/2 teaspoon salt',
            '1 cup milk',
            '1 egg',
            '2 tablespoons melted butter'
          ],
          instructions: [
            'In a bowl, whisk together the flour, sugar, baking powder, and salt.',
            'In another bowl, whisk together the milk, egg, and melted butter.',
            'Pour the wet ingredients into the dry ingredients and stir until just combined.',
            'Heat a griddle or non-stick pan over medium heat.',
            'Pour 1/4 cup of batter onto the griddle for each pancake.',
            'Cook until bubbles form on the surface, then flip and cook the other side until golden brown.',
            'Serve hot with your favorite toppings.'
          ],
          imagePath: 'assets/images/classic_pancakes.jpg',
          iconPath: 'assets/icons/pancakes.svg'),
    );

    recipes.add(
      RecipeModel(
        name: 'Blueberry Pancakes',
        kcal: '570',
        duration: '15',
        lvl: 'Easy',
        type: "cake, pie, breakfast",
        description: 'Delicious pancakes filled with fresh blueberries.',
        ingredients: [
          '1 1/2 cups all-purpose flour',
          '3 tablespoons sugar',
          '1 tablespoon baking powder',
          '1/2 teaspoon salt',
          '1 cup milk',
          '1/2 cup plain yogurt',
          '1 egg',
          '2 tablespoons melted butter',
          '1 cup fresh blueberries'
        ],
        instructions: [
          'In a bowl, whisk together the flour, sugar, baking powder, and salt.',
          'In another bowl, whisk together the milk, yogurt, egg, and melted butter.',
          'Pour the wet ingredients into the dry ingredients and stir until just combined.',
          'Gently fold in the blueberries.',
          'Heat a griddle or non-stick pan over medium heat.',
          'Pour 1/4 cup of batter onto the griddle for each pancake.',
          'Cook until bubbles form on the surface, then flip and cook the other side until golden brown.',
          'Serve hot with maple syrup.'
        ],
        imagePath: 'assets/images/bluberry_pancakes.jpg',
        iconPath: 'assets/icons/blueberry_pancakes.svg',
      ),
    );

    recipes.add(
      RecipeModel(
        name: 'Canai Bread',
        description:
            'Roti canai or roti paratha is a crispy, buttery and flaky Indian flat bread originated from southern India.',
        duration: '40',
        lvl: 'Intermediate',
        kcal: '480',
        type: "cake, pie, breakfast",
        ingredients: [
          '3 1/2 cups all purpose flour',
          '1 1/2 teaspoon kosher salt',
          '1 teaspoon granulated sugar',
          '3/4 cup ghee (room temperature)',
          '1 large egg',
          '3/4 cup whole milk',
          '1/2 cup water'
        ],
        instructions: [
          'Combine flour, salt, sugar and 1/4 cup of the ghee in the bowl of a stand mixer. Run on low speed with a dough hook until mixture clumps.',
          'Add egg, milk and water. Continue to mix until a smooth, elastic dough is formed. Knead into a smooth, soft, elastic dough, about 8 to 10 minutes. The dough should be a bit sticky, but not wet.',
          'Transfer the dough out and cut into eight equal pieces, about 4 oz. each (113 g). Form into smooth balls.',
          'Coat each ball with one teaspoon of ghee, slathering them well. Arrange in a single layer on a plate, cover with a damn cloth and allow them to rest at room temperature for at least 6 hours. (The dough can be made a day ahead and kept in the refrigerator.)',
          'Heat a griddle or large sauté pan over low heat.',
          'Firmly flatten and spread one disc of dough until it is 7 inches to 8 inches in diameter or (18 to 20 cm). The dough will be elastic, and may pull back a little.'
              'Drizzle the griddle with a little ghee. Add one bread to the pan, and cook slowly, turning once, 3 to 4 minutes per side, rotating occasionally to ensure even browning. Cook until each side is deep golden brown.'
              'Transfer the breads to a work surface, and then use a clapping motion (careful, it will be hot), slapping the bread together between your hands to separate the layers.'
              'Repeat with remaining roti, cooking as many as will fit in the pan at one time. Serve immediately with curry sauce or sugar.'
        ],
        imagePath: 'assets/images/canai_bread.jpeg',
        iconPath: 'assets/images/canai-bread.svg',
      ),
    );

    recipes.add(
      RecipeModel(
        name: 'Honey Pancakes',
        kcal: '530',
        duration: '15',
        lvl: 'Easy',
        type: "cake, pie, breakfast",
        description: 'Delicious sweet pancakes with honey.',
        ingredients: [
          '1½ cups all-purpose flour',
          '2 tsp baking powder',
          '1 egg',
          '1¼ cup milk',
          '1 tsp salt',
          '1 tsp Pua-a-Tane Honey',
          '3 tbsp butter (melted)',
        ],
        instructions: [
          'In a large bowl, sift together flour, baking powder and salt.',
          'Make well in the centre and pour in the milk, egg, melted butter and honey. Mix until smooth.',
          'Heat a lightly oiled griddle or frying pan over medium heat.',
          'Pour or scoop the batter onto the griddle, using approximately ¼ cup for each pancake.',
          'Finish off with your favourite fruit and drizzle with Tawari Honey.',
          'Serve with whipped cream or dust with icing sugar if you are a total sweet tooth.'
        ],
        imagePath: 'assets/images/honey_pancakes.jpg',
        iconPath: 'assets/icons/honey-pancakes.svg',
      ),
    );

    recipes.add(
      RecipeModel(
        name: 'Strawberry smoothie',
        kcal: '170',
        duration: '5',
        lvl: 'Easy',
        type: "smoothies, drink",
        description:
            'Get your fruit fix with our strawberry smoothie made with banana and orange juice. Itss free from dairy, so its vegan too – making it a great start to anyones day.',
        ingredients: [
          '10 strawberries, hulled',
          '1 small banana, sliced',
          '100ml orange juice, chilled',
        ],
        instructions: [
          'Blitz the strawberries in a blender with the banana and orange juice until smooth.',
          'Pour the smoothie into a tall glass to serve.',
        ],
        imagePath: 'assets/images/smoothie-1.jpg',
      ),
    );

    recipes.add(
      RecipeModel(
        name: 'Forest fruit & banana smoothie',
        kcal: '50',
        duration: '5',
        lvl: 'Easy',
        type: "smoothies, drink",
        description:
            'For a smooth start to your day try this ultra-easy breakfast drink',
        ingredients: [
          'frozen fruits of the forest',
          'banana, sliced',
          'low-fat fruits of the forest yogurt',
        ],
        instructions: [
          'Whizz frozen fruits of the forest and sliced banana in a food processor with low-fat fruits of the forest yogurt.',
        ],
        imagePath: 'assets/images/smoothie-2.jpg',
      ),
    );

    return recipes;
  }
}
