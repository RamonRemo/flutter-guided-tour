import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("The Dumbledore App"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ScaffoldBody(),
    );
  }
}

class ScaffoldBody extends StatefulWidget {
  @override
  _ScaffoldBodyState createState() => _ScaffoldBodyState();
}

class _ScaffoldBodyState extends State<ScaffoldBody> {
  List<TargetFocus> targets = List();

  GlobalKey keyDumb = GlobalKey();
  GlobalKey keyHarry1 = GlobalKey();
  GlobalKey keyHarry2 = GlobalKey();
  GlobalKey keyHarry3 = GlobalKey();
  GlobalKey keyHarry4 = GlobalKey();

  @override
  void initState() {
    // initTargets();
    // WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

    @override
  void didChangeDependencies() {
    initTargets();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
  
    return SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://i.pinimg.com/originals/7c/3e/ee/7c3eee5cdf74f53c83548eebbf1fcf40.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            picture(0, keyDumb),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                picture(1, keyHarry1),
                picture(2, keyHarry2),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                picture(3, keyHarry3),
                picture(4, keyHarry4),
              ],
            ),
            botao(context),
          ],
        ),
      ),
    );
  }

  Widget botao(context) {
    return FlatButton(
      child: Text("Show SnackBar", style: TextStyle(color: Colors.white)),
      onPressed: () {
        final snackBar = SnackBar(content: Text('Avada Kedavara!.',textAlign:TextAlign.center,));

        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        Scaffold.of(context).showSnackBar(snackBar);
      },
    );
  }

  Widget picture(int i, Key key) {
    List personagens = [
      "https://pm1.narvii.com/6310/aa996667bbba12b0c463385e895bf07f80247fdd_hq.jpg",
      "https://images2.minutemediacdn.com/image/upload/c_crop,h_1077,w_1600,x_0,y_0/v1554992649/shape/mentalfloss/harrypotterstone_406pyxurz.jpg?itok=Zwi54XGU",
      "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/3fd867a6-463d-4517-8724-3bebc90112e4/dbs4gm6-384c5f1c-389c-44f6-99d8-66d27c12c471.jpg/v1/fill/w_620,h_470,q_75,strp/child_harry_by_mikorin_kun_dbs4gm6-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NDcwIiwicGF0aCI6IlwvZlwvM2ZkODY3YTYtNDYzZC00NTE3LTg3MjQtM2JlYmM5MDExMmU0XC9kYnM0Z202LTM4NGM1ZjFjLTM4OWMtNDRmNi05OWQ4LTY2ZDI3YzEyYzQ3MS5qcGciLCJ3aWR0aCI6Ijw9NjIwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.pf7tRjFV_oGrRxfeu_OARQ1R4PFYkXKcGRVmO3LTyiA",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRyvTIGTOJGQgyKwUmkIcuNB132jNBZexfGfF6n2jWtvFRlDs7G&usqp=CAU",
      "https://omundoeumabola.blogfolha.uol.com.br/files/2020/01/Harry-Potter-1.jpg"
    ];

    return CircleAvatar(
      key: key,
      radius: 70.0,
      backgroundImage: NetworkImage(personagens[i]),
    );
  }

  void initTargets() {
    targets.add(TargetFocus(
      identify: "Target 1",
      keyTarget: keyDumb,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dumbledore:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Primeiramente, Bem vindos. Antes de mais nada, gostaria de esclarecer que esta é uma escola de magia séria e que todos aqui serão tratados com igualdade e justiça.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(TargetFocus(
      identify: "Target 2",
      keyTarget: keyHarry1,
      contents: [
        ContentTarget(
            align: AlignContent.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dumbledore:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Peraí, aquele ali é o harry? Oii Harry! gostei do terninho, ele fica tão bonitinho de terninho né gente?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(TargetFocus(
      identify: "Target 3",
      keyTarget: keyHarry2,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dumbledore:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "Hehehehe, olha esse sorriso, quer saber o que mais? 50! PONTOS PRA GRIFINORIA!!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(TargetFocus(
      identify: "Target 4",
      keyTarget: keyHarry3,
      contents: [
        ContentTarget(
            align: AlignContent.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dumbledore:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "OLHA, OLHA LÁ GENTE, ELE VAI BOTAR O CACHECOLZINHO!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
    targets.add(TargetFocus(
      identify: "Target 5",
      keyTarget: keyHarry4,
      contents: [
        ContentTarget(
            align: AlignContent.top,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dumbledore:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 40.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "AGORA ELE VAI MOSTRAR A CICATRIZ, ELE VAI MOSTRAR MESMO, MACGONAGAL CORRE AQUI!! CARALHO É EM FORMA DE RAIO MESMO, QUE DOIDERA MANO!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.Circle,
    ));
  }

  void showTutorial() {
    TutorialCoachMark(context,
        targets: targets,
        colorShadow: Colors.black,
        textSkip: "SKIP",
        paddingFocus: 10,
        opacityShadow: 0.8, finish: () {
      print("finish");
    }, clickTarget: (target) {
      print(target);
    }, clickSkip: () {
      print("skip");
    })
      ..show();
  }

  void _afterLayout(_) {
    Future.delayed(Duration(milliseconds: 100), () {
      showTutorial();
    });
  }
}
