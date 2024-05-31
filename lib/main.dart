import 'package:flutter/material.dart';
import 'package:test_app/helpers/helper_func.dart';
import 'package:test_app/helpers/helper_widgets.dart';
import 'package:test_app/helpers/radio_model.dart';
import 'package:test_app/helpers/sizeConfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation); //ensures screen
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const MyHomePage(title: 'Flutter Demo Home Page'),
            );
          },
        );
      },
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
  List<RadioModel> bottomitems = [
    RadioModel(name: "Home", intval: 0, isselected: true, icon: Icons.add),
    RadioModel(name: "Favorite", intval: 1, isselected: false, icon: Icons.abc),
    RadioModel(
      name: "",
      intval: 2,
      isselected: false,
    ),
    RadioModel(
        name: "To-do", intval: 3, isselected: false, icon: Icons.ac_unit),
    RadioModel(
        name: "Settings",
        intval: 4,
        isselected: false,
        icon: Icons.access_alarm_outlined),
  ];

  int seletedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f8ff),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(calculateSize(4)),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(calculateSize(8)),
                        border: Border.all(color: Color(0xffc6c6c6))),
                    child: Icon(
                      Icons.menu,
                      size: calculateSize(25),
                      color: Colors.black,
                    ),
                  ),
                  horizontalspace(20.0),
                  appText(
                    "All Notes",
                    16,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              appText("Categories", 16,
                  weight: FontWeight.w500, bottommargin: 20.0, topmargin: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  cusView1(
                    color: const Color(0xfff0e4f7),
                    icon: Icons.person,
                    iconColor: const Color(0xffbf75db),
                    text: "Personal",
                  ),
                  cusView1(
                    color: const Color(0xffe4f4ee),
                    icon: Icons.person,
                    iconColor: const Color(0xff77daa0),
                    text: "Work",
                  ),
                  cusView1(
                    color: const Color(0xfffaeedf),
                    icon: Icons.person,
                    iconColor: const Color(0xfffeb03b),
                    text: "Shop",
                  ),
                  cusView1(
                    color: const Color(0xfffadde0),
                    icon: Icons.person,
                    iconColor: const Color(0xfff17c7c),
                    text: "Health",
                  ),
                  cusView1(
                    color: Colors.transparent,
                    icon: Icons.add,
                    iconColor: const Color(0xffc6c6c6),
                    text: "Add",
                    bordercolor: const Color(0xffc6c6c6),
                  )
                ],
              ),
              verticalspace(20.0),
              ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (ctx, i) => cusView2(
                  title: "Team meet",
                  subtitle: "hgsdg sdhsghds shdshdsd ",
                  day: "Today",
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: calculateSize(120),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: calculateSize(10.0)),
                height: calculateSize(80),
                decoration: BoxDecoration(
                  color: const Color(0xfff0f8ff),
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bottomitems.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) => GestureDetector(
                    onTap: () {
                      for (var element in bottomitems) {
                        element.isselected = false;
                      }

                      bottomitems[i].isselected = true;
                      seletedIndex = bottomitems[i].intval!;
                      print(seletedIndex);
                      setState(() {});
                    },
                    child: view(
                      bottomitems[i],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: Color(0xff7e7dbc),
                  size: calculateSize(80.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class view extends StatelessWidget {
  //const cusView({super.key});
  RadioModel? _model;

  view(this._model);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width / 5,
      duration: Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _model!.icon == null
              ? Container()
              : Icon(_model!.icon,
                  size: calculateSize(30),
                  color: _model!.isselected!
                      ? const Color(0xff050505)
                      : Color(0xff97979a)),
          appText(
            _model!.name!,
            12,
            topmargin: 6.0,
            weight: _model!.isselected! ? FontWeight.w800 : FontWeight.w300,
            color: _model!.isselected!
                ? const Color(0xff050505)
                : Color(0xff97979a),
          )
        ],
      ),
    );
  }
}
