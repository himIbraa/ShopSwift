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
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
  final TextEditingController _productCategoryController =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImagePicker(),
              const SizedBox(height: 20),
              const Text(
                'Product Information',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildTextFormField('Product ID', _productIdController),
              _buildTextFormField('Product Name', _productNameController),
              _buildTextFormField(
                  'Product Description', _productDescriptionController),
              _buildTextFormField(
                  'Product Category', _productCategoryController),
              const SizedBox(height: 30),
              _buildTextFormField('Price', _priceController),
              _buildTextFormField('Quantity', _quantityController),
              const SizedBox(height: 20),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker() {
    return InkWell(
      onTap: _selectImage,
      child: SizedBox(
        height: 100,
        child: Card(
          margin: EdgeInsets.zero,
          color: Color(0xFFF5BA41),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _selectImage,
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
    );
  }

  void _selectImage() async {
    ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);

    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No image was selected.'),
        ),
      );
    }
  }

  Widget _buildTextFormField(
      String hintText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }

  Widget _buildSaveButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Implement save functionality
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
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
