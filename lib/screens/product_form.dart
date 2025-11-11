import 'package:flutter/material.dart';
import 'package:sport_center/widgets/left_drawer.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _productName = "";
    String _price = "";
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
                            _productName = value!;
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
                            _price = value!;
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Save form field values from onSaved callbacks
                          _formKey.currentState!.save();
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Product successfully saved!'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Product Name: $_productName'),
                                        Text('Price: $_price'),
                                        Text('Description: $_description'),
                                        Text('Category: $_category'),
                                        Text('Thumbnail: $_thumbnail'),
                                        Text(
                                            'Featured: ${_isFeatured ? "Yes" : "No"}'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _formKey.currentState!.reset();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
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