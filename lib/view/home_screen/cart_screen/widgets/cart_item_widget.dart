import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.title,
    required this.desc,
    required this.qty,
    this.onIncrement,
    this.onDecrement,
    this.onRemove,
    this.image,
  });
  final String title;
  final String desc;
  final String qty;
  final String? image;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  image!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      desc,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: onIncrement, child: Icon(Icons.add)),
                  Text(
                    qty,
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  ElevatedButton(
                      onPressed: onDecrement, child: Icon(Icons.remove)),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: onRemove,
            child: Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Remove",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}