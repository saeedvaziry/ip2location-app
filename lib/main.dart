import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ip2location/presentation/home/screens/home_screen.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const IP2LocationApp()));
}

class IP2LocationApp extends StatelessWidget {
  const IP2LocationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: MaterialApp(
        title: 'IP2Location',
        theme: ThemeData(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          primarySwatch: Colors.indigo,
          shadowColor: Colors.indigoAccent.withOpacity(0.5),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          primarySwatch: Colors.indigo,
          shadowColor: Colors.black12.withOpacity(0.5),
        ),
        home: const Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
