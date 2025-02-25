import 'package:zalada_app/core/model/favorite_model_db.dart';
import 'package:zalada_app/core/model/product_model_db.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

class SQLHelper {
  static Future<Database> initDb() async {
    return sql.openDatabase(
      'shop.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<void> createTables(Database database) async {
    await database.execute("""
      CREATE TABLE cart(
        id TEXT PRIMARY KEY NOT NULL,
        title TEXT NOT NULL,
        description TEXT,
        image TEXT,
        quantity INTEGER NOT NULL,
        price REAL NOT NULL
      )
    """);

    await database.execute("""
      CREATE TABLE favorites(
        id TEXT PRIMARY KEY NOT NULL,
        title TEXT NOT NULL,
        description TEXT,
        image TEXT,
        price REAL NOT NULL
      )
    """);

    debugPrint("Tables Created");
  }


  static Future<int> addToCart(CartModelDb product) async {
    final db = await SQLHelper.initDb();
    final id = await db.insert('cart', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint("Product Added to Cart");
    return id;
  }

  static Future<List<CartModelDb>> getCart() async {
    final db = await SQLHelper.initDb();
    final List<Map<String, dynamic>> result =
        await db.query('cart', orderBy: "id");
    return result.map((e) => CartModelDb.fromMap(e)).toList();
  }

  static Future<void> removeFromCart(String productId) async {
    final db = await SQLHelper.initDb();
    await db.delete("cart", where: "id = ?", whereArgs: [productId]);
    debugPrint("Product Removed from Cart");
  }

  static Future<int> updateCartItem(CartModelDb product) async {
    final db = await SQLHelper.initDb();
    final result = await db.update('cart', product.toMap(),
        where: "id = ?", whereArgs: [product.id]);
    return result;
  }

  static Future<int> addToFavorites(FavoriteModelDb product) async {
    final db = await SQLHelper.initDb();
    final id = await db.insert('favorites', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrint("Product Added to Favorites");
    return id;
  }

  static Future<List<FavoriteModelDb>> getFavorites() async {
    final db = await SQLHelper.initDb();
    final List<Map<String, dynamic>> result =
        await db.query('favorites', orderBy: "id");
    return result.map((e) => FavoriteModelDb.fromMap(e)).toList();
  }

  static Future<void> removeFromFavorites(String productId) async {
    final db = await SQLHelper.initDb();
    await db.delete("favorites", where: "id = ?", whereArgs: [productId]);
    debugPrint("Product Removed from Favorites");
  }
}
