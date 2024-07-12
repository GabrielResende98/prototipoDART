class Product {
  final String name;
  final num price;
  final String description;
  final String imagePath;
  int quantity;
  double totalPrice;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.imagePath,
      this.quantity = 0,
      this.totalPrice = 0
      });

      void incrementQuantity(){
        quantity++;
        totalPrice += price;
      }

      void decreamentQuantity(){
        quantity--;
        totalPrice -= price;
      }

      void initialQuantity() {
        quantity = 0;
        totalPrice = 0;
      }
}
