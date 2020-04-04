import 'package:crudserviciosrest/src/blocs/provider.dart';
import 'package:crudserviciosrest/src/pages/home_page.dart';
import 'package:crudserviciosrest/src/pages/login_page.dart';
import 'package:crudserviciosrest/src/pages/producto_page.dart';
import 'package:crudserviciosrest/src/pages/registro_page.dart';
import 'package:crudserviciosrest/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new PreferenciasUsuario();
    print(prefs.token);
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form Validation App',
        initialRoute: 'login',
        routes: {
          'registro': (BuildContext context) => RegistroPage(),
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'producto': (BuildContext context) => ProductoPage(),
        },
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
