
import 'package:flutter/material.dart';
import 'package:flutter_application_product_cart_app/controller/cart_screen_controller.dart';
import 'package:flutter_application_product_cart_app/controller/home_screen_controller.dart';
import 'package:flutter_application_product_cart_app/controller/product_details_screen_controller.dart';
import 'package:flutter_application_product_cart_app/model/cart_model.dart';
import 'package:flutter_application_product_cart_app/view/home_screen/get_started_screen/get_started_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // hive step 1
  Hive.registerAdapter(CartModelAdapter());
  var box = await Hive.openBox<CartModel>("cartBox"); // hive step 1
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => CartScreenController()),
        ChangeNotifierProvider(
            create: (context) => ProductDetialsScreenController()),
      ],
      child: MaterialApp(
        home: GetStartedScreen(),
      ),
    );
  }
}
