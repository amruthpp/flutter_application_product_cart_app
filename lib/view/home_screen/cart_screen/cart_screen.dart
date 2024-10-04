
import 'package:flutter/material.dart';
import 'package:flutter_application_product_cart_app/controller/cart_screen_controller.dart';
import 'package:flutter_application_product_cart_app/view/home_screen/cart_screen/widgets/cart_item_widget.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    
    context.read<CartScreenController>().getProducts();
  },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Providerobj = context.watch<CartScreenController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return CartItemWidget(
                    title: Providerobj.cart[index].name.toString(),
                    desc: Providerobj.cart[index].desc.toString(),
                    qty: Providerobj.cart[index].qty.toString(),
                    image:
                        Providerobj.cart[index].image.toString(),
                    onIncrement: () {},
                    onDecrement: () {},
                    onRemove: () {
                      context.read<CartScreenController>().removeProcuct(index);
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: Providerobj.cart.length)),
      ),
    );
  }
}
