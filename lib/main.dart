import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorialapp/data/app_database.dart';
import 'package:tutorialapp/di/di_binding.dart';
import 'package:tutorialapp/screens/getxstmt/home_page.dart';
import 'package:tutorialapp/screens/localauth/local_auth_app.dart';
import 'package:tutorialapp/screens/userlist.dart';
import 'package:tutorialapp/user/auth/login_screen.dart';
import 'package:tutorialapp/di/di_service.dart' as di_service;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await di_service.init();
  runApp(const LocalAuthApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        title: 'Flutter Tutorial App',
        home: FutureBuilder(
            future: $FloorAppDatabase.databaseBuilder('app_database.db').build(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Get.put(snapshot.data?.userDao, tag: 'user_dao');
                return UserList();
              } else if (snapshot.hasError) {
                return Text('Error:: $snapshot');
              } else {
                return Center(
                    child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary));
              }
            }));
  }
}

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  int _count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addCount({int value = 1}) {
    setState(() {
      _count += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Tutorial App'),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is Text Count $_count'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
                child: Text('ElevatedButton'),
                style: const ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(20))),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.add, size: 18),
                label: Text('Add 2 to Count'),
                onPressed: () {
                  addCount(value: 2);
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCount,
        tooltip: 'Add',
        child: const Center(
            child: Text(
          'Add Count',
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
