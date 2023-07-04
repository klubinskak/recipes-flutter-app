import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    print("Fav!");
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: toggleFavorite,
          child: Ink(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.black,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
