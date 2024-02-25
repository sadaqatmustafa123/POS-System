import 'dart:io';

class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  @override
  String toString() {
    return 'Product: $name, Price: \$${price.toStringAsFixed(2)}, Quantity: $quantity';
  }
}

class PointOfSalesApp {
  List<Product> inventory = [];

  void addProduct() {
    print("Enter product name:");
    String name = stdin.readLineSync()!;
    print("Enter product price:");
    double price = double.parse(stdin.readLineSync()!);
    print("Enter product quantity:");
    int quantity = int.parse(stdin.readLineSync()!);

    Product newProduct = Product(name, price, quantity);
    inventory.add(newProduct);

    print("\nProduct added successfully!\n");
  }

  void viewProducts() {
    if (inventory.isEmpty) {
      print("Inventory is empty!");
    } else {
      print("\nProducts in Inventory:");
      for (var product in inventory) {
        print(product);
      }
      print("");
    }
  }

  void updateProduct() {
    if (inventory.isEmpty) {
      print("Inventory is empty!");
    } else {
      viewProducts();
      print("Enter the index of the product you want to update:");
      int index = int.parse(stdin.readLineSync()!);
      index--; // Adjusting index to match list indexing (starts from 0)
      if (index >= 0 && index < inventory.length) {
        print("Enter updated product name:");
        inventory[index].name = stdin.readLineSync()!;
        print("Enter updated product price:");
        inventory[index].price = double.parse(stdin.readLineSync()!);
        print("Enter updated product quantity:");
        inventory[index].quantity = int.parse(stdin.readLineSync()!);

        print("\nProduct updated successfully!\n");
      } else {
        print("Invalid index!");
      }
    }
  }

  void deleteProduct() {
    if (inventory.isEmpty) {
      print("Inventory is empty!");
    } else {
      viewProducts();
      print("Enter the index of the product you want to delete:");
      int index = int.parse(stdin.readLineSync()!);
      index--; // Adjusting index to match list indexing (starts from 0)
      if (index >= 0 && index < inventory.length) {
        inventory.removeAt(index);
        print("\nProduct deleted successfully!\n");
      } else {
        print("Invalid index!");
      }
    }
  }
}

void main() {
  PointOfSalesApp posApp = PointOfSalesApp();
  bool exit = false;

  while (!exit) {
    print("===== Point of Sales Application =====");
    print("1. Add a new product");
    print("2. View products in inventory");
    print("3. Update a product");
    print("4. Delete a product");
    print("5. Exit");
    print("======================================");
    print("Enter your choice (1/2/3/4/5):");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        posApp.addProduct();
        break;
      case '2':
        posApp.viewProducts();
        break;
      case '3':
        posApp.updateProduct();
        break;
      case '4':
        posApp.deleteProduct();
        break;
      case '5':
        exit = true;
        break;
      default:
        print("Invalid choice! Please try again.");
    }
  }
}
