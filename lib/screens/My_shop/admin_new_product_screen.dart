import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewProductScreen extends StatefulWidget {
  static const String routeName = '/new-product-screen';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => NewProductScreen(),
    );
  }

  const NewProductScreen({Key? key}) : super(key: key);

  @override
  _NewProductScreenState createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add a Product',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFFF5BA41),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                ImagePicker _picker = ImagePicker();
                final XFile? _image =
                    await _picker.pickImage(source: ImageSource.gallery);

                if (_image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No image was selected.'),
                    ),
                  );
                }
              },
              child: SizedBox(
                height: 100,
                child: Card(
                  margin: EdgeInsets.zero,
                  color: Color(0xFFF5BA41),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () async {
                          ImagePicker _picker = ImagePicker();
                          final XFile? _image = await _picker.pickImage(
                              source: ImageSource.gallery);

                          if (_image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No image was selected.'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Add an Image',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Product Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildTextFormField('Product ID'),
            _buildTextFormField('Product Name'),
            _buildTextFormField('Product Description'),
            _buildTextFormField('Product Category'),
            const SizedBox(height: 30),
            _buildTextFormField('Price'),
            _buildTextFormField('Quantity'),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Saved');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5BA41),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildCheckbox(String title) {
    return Row(
      children: [
        SizedBox(
          width: 125,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: true,
          checkColor: Colors.black,
          activeColor: Colors.black12,
          onChanged: (value) {},
        ),
      ],
    );
  }

  TextFormField _buildTextFormField(String hintText) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
