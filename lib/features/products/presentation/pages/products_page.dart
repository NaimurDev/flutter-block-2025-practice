import 'package:flutter/material.dart';
import 'package:lets_learn_bloc/features/products/domain/models/product.dart';
import 'package:lets_learn_bloc/features/products/presentation/widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
      List<Product> products = [
      {
        "id": 3,
        "title": "Classic Heather Gray Hoodie",
        "price": 69,
        "description":
            "Stay cozy and stylish with our Classic Heather Gray Hoodie. Crafted from soft, durable fabric, it features a kangaroo pocket, adjustable drawstring hood, and ribbed cuffs. Perfect for a casual day out or a relaxing evening in, this hoodie is a versatile addition to any wardrobe.",
        "images": [
          "https://i.imgur.com/cHddUCu.jpeg",
          "https://i.imgur.com/CFOjAgK.jpeg",
          "https://i.imgur.com/wbIMMme.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 4,
        "title": "Classic Grey Hooded Sweatshirt",
        "price": 90,
        "description":
            "Elevate your casual wear with our Classic Grey Hooded Sweatshirt. Made from a soft cotton blend, this hoodie features a front kangaroo pocket, an adjustable drawstring hood, and ribbed cuffs for a snug fit. Perfect for those chilly evenings or lazy weekends, it pairs effortlessly with your favorite jeans or joggers.",
        "images": [
          "https://i.imgur.com/R2PN9Wq.jpeg",
          "https://i.imgur.com/IvxMPFr.jpeg",
          "https://i.imgur.com/7eW9nXP.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 5,
        "title": "Classic Black Hooded Sweatshirt",
        "price": 79,
        "description":
            "Elevate your casual wardrobe with our Classic Black Hooded Sweatshirt. Made from high-quality, soft fabric that ensures comfort and durability, this hoodie features a spacious kangaroo pocket and an adjustable drawstring hood. Its versatile design makes it perfect for a relaxed day at home or a casual outing.",
        "images": [
          "https://i.imgur.com/cSytoSD.jpeg",
          "https://i.imgur.com/WwKucXb.jpeg",
          "https://i.imgur.com/cE2Dxh9.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 6,
        "title": "Classic Comfort Fit Joggers",
        "price": 25,
        "description":
            "Discover the perfect blend of style and comfort with our Classic Comfort Fit Joggers. These versatile black joggers feature a soft elastic waistband with an adjustable drawstring, two side pockets, and ribbed ankle cuffs for a secure fit. Made from a lightweight and durable fabric, they are ideal for both active days and relaxed lounging.",
        "images": [
          "https://i.imgur.com/ZKGofuB.jpeg",
          "https://i.imgur.com/GJi73H0.jpeg",
          "https://i.imgur.com/633Fqrz.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 9,
        "title": "Classic Navy Blue Baseball Cap",
        "price": 61,
        "description":
            "Step out in style with this sleek navy blue baseball cap. Crafted from durable material, it features a smooth, structured design and an adjustable strap for the perfect fit. Protect your eyes from the sun and complement your casual looks with this versatile and timeless accessory.",
        "images": [
          "https://i.imgur.com/R3iobJA.jpeg",
          "https://i.imgur.com/Wv2KTsf.jpeg",
          "https://i.imgur.com/76HAxcA.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 10,
        "title": "Classic Blue Baseball Cap",
        "price": 86,
        "description":
            "Top off your casual look with our Classic Blue Baseball Cap, made from high-quality materials for lasting comfort. Featuring a timeless six-panel design with a pre-curved visor, this adjustable cap offers both style and practicality for everyday wear.",
        "images": [
          "https://i.imgur.com/wXuQ7bm.jpeg",
          "https://i.imgur.com/BZrIEmb.jpeg",
          "https://i.imgur.com/KcT6BE0.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 11,
        "title": "Classic Red Baseball Cap",
        "price": 35,
        "description":
            "Elevate your casual wardrobe with this timeless red baseball cap. Crafted from durable fabric, it features a comfortable fit with an adjustable strap at the back, ensuring one size fits all. Perfect for sunny days or adding a sporty touch to your outfit.",
        "images": [
          "https://i.imgur.com/cBuLvBi.jpeg",
          "https://i.imgur.com/N1GkCIR.jpeg",
          "https://i.imgur.com/kKc9A5p.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 12,
        "title": "Classic Black Baseball Cap",
        "price": 58,
        "description":
            "Elevate your casual wear with this timeless black baseball cap. Made with high-quality, breathable fabric, it features an adjustable strap for the perfect fit. Whether you’re out for a jog or just running errands, this cap adds a touch of style to any outfit.",
        "images": [
          "https://i.imgur.com/KeqG6r4.jpeg",
          "https://i.imgur.com/xGQOw3p.jpeg",
          "https://i.imgur.com/oO5OUjb.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 13,
        "title": "Classic Olive Chino Shorts",
        "price": 84,
        "description":
            "Elevate your casual wardrobe with these classic olive chino shorts. Designed for comfort and versatility, they feature a smooth waistband, practical pockets, and a tailored fit that makes them perfect for both relaxed weekends and smart-casual occasions. The durable fabric ensures they hold up throughout your daily activities while maintaining a stylish look.",
        "images": [
          "https://i.imgur.com/UsFIvYs.jpeg",
          "https://i.imgur.com/YIq57b6.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      },
      {
        "id": 14,
        "title": "Classic High-Waisted Athletic Shorts",
        "price": 43,
        "description":
            "Stay comfortable and stylish with our Classic High-Waisted Athletic Shorts. Designed for optimal movement and versatility, these shorts are a must-have for your workout wardrobe. Featuring a figure-flattering high waist, breathable fabric, and a secure fit that ensures they stay in place during any activity, these shorts are perfect for the gym, running, or even just casual wear.",
        "images": [
          "https://i.imgur.com/eGOUveI.jpeg",
          "https://i.imgur.com/UcsGO7E.jpeg",
          "https://i.imgur.com/NLn4e7S.jpeg"
        ],
        "creationAt": "2025-01-17T06:07:56.000Z",
        "updatedAt": "2025-01-17T06:07:56.000Z",
        "category": {
          "id": 1,
          "name": "Clothes",
          "image": "https://i.imgur.com/QkIa5tT.jpeg",
          "creationAt": "2025-01-17T06:07:56.000Z",
          "updatedAt": "2025-01-17T06:07:56.000Z"
        }
      }
    ].map((e) => Product.fromJson(e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
