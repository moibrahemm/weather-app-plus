import 'package:flutter/material.dart';
import 'package:weather_app/extensions/size_extension.dart';

class StatusItem extends StatelessWidget {
  const StatusItem({
    super.key,
    required this.url,
    required this.value,
    required this.itemName,
  });
  final String url;
  final String value;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          url,
          width: context.width * 0.06,
          height: context.width * 0.06,
          errorBuilder:
              (context, error, stackTrace) => Icon(
                Icons.image_not_supported,
                color: Colors.white54,
                size: context.width * 0.06,
              ),
        ),

        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: context.smallText,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          itemName,
          style: TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.bold,
            fontSize: context.smallText,
          ),
        ),
      ],
    );
  }
}
