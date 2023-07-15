// ignore_for_file: prefer_const_constructors

import 'package:fashionstore/models/categories.dart';
import 'package:fashionstore/post/post_list_page.dart';
import 'package:flutter/material.dart';


class CategoryList extends StatefulWidget {
  static const id = "/CategoryList";
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<Category> newList = List.from(categories);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlue),
        ),
        child: Column(
          children: newList
              .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ProductPage.id,
                          arguments: {
                            "category": e.name,
                            "icon": e.icon,
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: const [
                                Color.fromARGB(255, 229, 226, 229),
                                Color.fromARGB(255, 45, 45, 231)
                              ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  e.name as String,
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Icon(
                                e.icon,
                                size: 35,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
