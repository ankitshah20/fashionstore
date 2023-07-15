import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? category;
  String? productName;
  String? detail;
  int? price;
  String? contact;
  String? address;
  int? quantity;
  List<String>? imagesUrl;
  String? purpose;
  bool? isPopular;

  ProductModel({
    this.category,
    this.productName,
    this.detail,
    this.price,
    this.contact,
    this.address,
    this.quantity,
    this.imagesUrl,
    this.purpose,
    this.isPopular,
  });
  CollectionReference db = FirebaseFirestore.instance.collection('apartments');

  Future<void> addProduct(ProductModel productModel) async {
    Map<String, dynamic> data = {
      "category": productModel.category,
      "productName": productModel.productName,
      "detail": productModel.detail,
      "price": productModel.price,
      "contact": productModel.contact,
      "address": productModel.address,
      "quantity": productModel.quantity,
      "imagesUrl": productModel.imagesUrl,
      "purpose": productModel.purpose,
      "isPopular": productModel.isPopular,
    };
    await db.add(data);
  }

  Future<void> updateProduct(String id, ProductModel updateProduct) async {
    Map<String, dynamic> data = {
      "category": updateProduct.category,
      "productName": updateProduct.productName,
      "price": updateProduct.price,
      "contact": updateProduct.contact,
      "detail": updateProduct.detail,
      "address": updateProduct.address,
      "quantity": updateProduct.quantity,
      "imagesUrl": updateProduct.imagesUrl,
      "purpose": updateProduct.purpose,
      "isPopular": updateProduct.isPopular,
    };
    await db.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    await db.doc(id).delete();
  }
}
