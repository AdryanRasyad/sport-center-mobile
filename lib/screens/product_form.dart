import 'package:flutter/material.dart';
import 'package:sport_center/widgets/left_drawer.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sport_center/screens/menu.dart';


class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _id = "";
    String _name = "";
    int _price = 0;
    String _description = "";
    String _category = "footwear"; // default
    String _thumbnail = "";
    bool _isFeatured = false; // default

    final List<String> _categories = [
      'footwear',
      'clothing',
      'accessories',
      'limited collection',
    ];

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Add Product Form',
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
          ),
          drawer: LeftDrawer(),// TODO: Tambahkan drawer yang sudah dibuat di sini
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      // === Product Name ===
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          maxLength: 60,
                          decoration: InputDecoration(
                            hintText: "Product Name",
                            labelText: "Product Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onSaved: (String? value) {
                            _name = value!;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Product name cannot be empty!";
                            }
                            if (value.length > 60) {
                              return "Product name cannot exceed 60 characters!";
                            }
                            return null;
                          },
                        ),
                ),
                  // === Price ===
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Price",
                            labelText: "Price",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onSaved: (String? value) {
                            _price = int.tryParse(value ?? "0") ?? 0;
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Price cannot be empty!";
                            }
                            try {
                              int price = int.parse(value);
                              if (price < 0) {
                                return "Price cannot be negative!";
                              }
                              return null;
                            } catch (e) {
                              return "Price must be a valid integer!";
                            }
                          },
                        ),
                ),
                  // === Description ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 5,
                    maxLength: 500,
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onSaved: (String? value) {
                      _description = value!;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Description cannot be empty!";
                      }
                      if (value.length > 500) {
                        return "Description cannot exceed 500 characters!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Category ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    value: _category,
                    items: _categories
                        .map((cat) => DropdownMenuItem(
                              value: cat,
                              child: Text(
                                  cat[0].toUpperCase() + cat.substring(1)),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _category = newValue!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Category must be selected!";
                      }
                      return null;
                    },
                  ),
                ),

                // === Thumbnail URL ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Thumbnail URL",
                      labelText: "Thumbnail URL",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onSaved: (String? value) {
                      _thumbnail = value!;
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Thumbnail URL cannot be empty!";
                      }
                      try {
                        Uri.parse(value);
                        if (!value.startsWith('http://') && !value.startsWith('https://')) {
                          return "Thumbnail must be a valid URL (http:// or https://)!";
                        }
                        return null;
                      } catch (e) {
                        return "Thumbnail must be a valid URL!";
                      }
                    },
                  ),
                ),

                // === Is Featured ===
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SwitchListTile(
                    title: const Text("Mark as Featured"),
                    value: _isFeatured,
                    onChanged: (bool value) {
                      setState(() {
                        _isFeatured = value;
                      });
                    },
                  ),
                ),
                 // === Save Product Button ===
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
                      ),
                      onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                          // TODO: Replace the URL with your app's URL
                          // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
                          // If you using chrome,  use URL http://localhost:8000
                          
                          final response = await request.postJson(
                            "http://localhost:8000/create-flutter/",
                            jsonEncode({
                              "name": _name,
                              "price": _price,
                              "description": _description,
                              "category": _category,
                              "thumbnail": _thumbnail,
                              "is_featured": _isFeatured,
                            }),
                          );
                          if (context.mounted) {
                            if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Product successfully added!"),
                              ));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(colorScheme: Theme.of(context).colorScheme)),
                              );
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Something went wrong, please try again."),
                              ));
                            }
                          }
                        }
                      },
                      child: const Text(
                        "Save Product",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
                

                
                
                
                ),
            
          ),
        ));
    }
}