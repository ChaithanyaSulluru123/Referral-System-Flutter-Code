
import 'package:flutter/material.dart';

class AddNewShopScreen extends StatelessWidget {
  const AddNewShopScreen({super.key});

  static const Color green = Color(0xFF21845F);
  static const Color darkText = Color(0xFF183B3B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: darkText),
          onPressed: () {},
        ),
        title: const Text('Refer a Shop',
          style: TextStyle(color: darkText,fontSize: 17,fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
                child: Column(
                  children: [
                    ShopInputField(
                      label: 'Shop Name *',
                      hint: 'Enter shop name',
                      icon: Icons.store,
                    ),
                    SizedBox(height: 12),

                    ShopInputField(
                      label: 'Shop Address *',
                      hint: 'Enter complete address',
                      icon: Icons.location_on,
                      maxLines: 2,
                    ),
                    SizedBox(height: 12),

                    ShopInputField(
                      label: 'Shop Phone',
                      hint: 'Enter phone number',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 18),

                    PhotoUploadBox(),

                    SizedBox(height: 14),

                    LocationButton(),

                    SizedBox(height: 12),

                    CoordinateField(
                      label: 'Latitude',
                      value: '--.----',
                    ),

                    SizedBox(height: 8),

                    CoordinateField(
                      label: 'Longitude',
                      value: '--.----',
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11),),
                  ),
                  child: const Text(
                    'Submit Shop',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShopInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final int maxLines;
  final TextInputType keyboardType;

  const ShopInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon,color: AddNewShopScreen.green,size: 20,),

          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                  style: const TextStyle(color: AddNewShopScreen.darkText,fontSize: 11,fontWeight: FontWeight.w600,),
                ),

                const SizedBox(height: 3),
                TextField(
                  maxLines: maxLines,
                  keyboardType: keyboardType,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: const TextStyle(color: Colors.grey,fontSize: 12,),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoUploadBox extends StatelessWidget {
  const PhotoUploadBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFFF6FAFB),
        border: Border.all(
          color: const Color(0xFFD0DADD),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt,color: AddNewShopScreen.green,size: 28,),

          const SizedBox(height: 4),
          const Text('Capture shop photo',
            style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: AddNewShopScreen.darkText,
            ),
          ),

          const SizedBox(height: 3),
          Text('Take a photo or choose from gallery',
            style: TextStyle(fontSize: 9,color: Colors.grey.shade600,),
          ),
        ],
      ),
    );
  }
}

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F4E8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.location_on,color: AddNewShopScreen.green,size: 22,),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Use current location',
                  style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold,color: AddNewShopScreen.darkText,
                  ),
                ),
                SizedBox(height: 2),
                Text('Get GPS coordinates automatically',style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right,color: AddNewShopScreen.darkText,size: 20,
          ),
        ],
      ),
    );
  }
}

class CoordinateField extends StatelessWidget {
  final String label;
  final String value;

  const CoordinateField({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.navigation,color: AddNewShopScreen.green,size: 15,),
          const SizedBox(width: 9),
          Expanded(
            child: Text(label,
              style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w600,color: AddNewShopScreen.darkText,
              ),
            ),
          ),

          Container(
            width: 80,
            height: 23,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F5F5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(value,
              style: const TextStyle(fontSize: 10,
                color: AddNewShopScreen.darkText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
