import 'dart:async';
import 'dart:io';
import 'dart:math';
import '00_helloworld.dart'; //测试import files

void variables() {
  var name = 'Voyager I';
  var year = 2018;
  var antennDiameter = 3.7;
  var flybyObjects = {'Jupiter', 'Saturn', 'Uranus', 'Neptune'};
  var image = {
    'tag': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  //字符串当中的变量用$
  print(
      'name is $name,year is $year, antennDiameter is $antennDiameter,flybyObjects is $flybyObjects,image is $image\n');
  print('******流程控制******');
}

void control() {
  //流程控制语句
  print('******流程控制调试******');
  var year = DateTime.now().year;
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  var flybyObjects = ['a', 'b', 'c'];
  for (final object in flybyObjects) {
    print(object);
  }
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  year = 2018;
  while (year < 2022) {
    year += 1;
    print('year is $year');
  }
}

//函数语句
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

//判断String line 中是否含有target
bool is_hit(String line, String target) {
  return line.contains(target);
}

void function_use() {
  print('******函数调用******');
  var n = 15;
  print('菲波那切数列的前15项是$fibonacci(n)');
  var flybyObjects = ['面条', '米饭', '米线', '米粉'];
  flybyObjects.where((name) => name.contains('you')).forEach(print);

  var hit_lines = flybyObjects.where((x) => is_hit(x, '米'));
  for (var one in hit_lines) {
    print('含有‘米’字的有 $one');
  }
}

//类定义
class Spacecraft {
  String name = ' ';
  DateTime? launchDate;

  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {
    //空构造方法
  }
  Spacecraft.unlaunched(String name) : this(name, null);

  //方法
  void describe() {
    print('Spacecraft:$name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched:$launchYear($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

//类的继承
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);
  @override
  void describe() {
    print('****类的继承****');
    super.describe();
    print('altitude is $altitude km');
  }
}

//mixin是在多个类层次中重用代码的方法，减少重复代码
mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('****mixin的调用（减少重复代码）****');
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

//接口与抽象类
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class abstract_class extends Describable {
  @override
  void describe() {
    // TODO: implement describe
    print('****抽象类和接口的调试****');
  }
}

class interface_class implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  interface_class(this.name, this.launchDate);
  @override
  void describe() {
    // TODO: implement describe
    print('***接口的使用***');
  }

  @override
  // TODO: implement launchYear
  int? get launchYear => throw UnimplementedError();
}

//异步
Future<void> the_async() async {
  print('\n');

  print('***异步代码调试****');

  const oneSecond = Duration(seconds: 1);

  Future<void> printWithDelay1(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }

  printWithDelay1('过了1秒钟. 1');
  print('一秒钟过去了.');

  Future<void> printWithDelay2(String message) {
    return Future.delayed(oneSecond).then((_) {
      print(message);
    });
  }

  printWithDelay2('过了1秒钟. 2');
  print('一秒钟又过去了');

  Future<void> createDescriptions(Iterable<String> objects) async {
    for (final object in objects) {
      try {
        var file = File('$object.txt');
        if (await file.exists()) {
          var modified = await file.lastModified();
          print(
              'File for $object already exists. It was modified on $modified.');
          continue;
        }
        await file.create();
        await file.writeAsString('Start Describing $object in this file.');
        print('File for $object created.');
      } on IOException catch (e) {
        print('Cannot create description for $object: $e');
      }
    }
  }

  var the_objects = ['信息第一'];
  createDescriptions(the_objects);

  await Future.delayed(Duration(seconds: 5));
}

//Stream 流
Future<void> the_stream() async {
  print('\n');

  print('Stream（流控制）代码调试');

  const oneSecond = Duration(seconds: 1);

  StreamController<double> ctl1 = StreamController<double>();
  Stream stm1 = ctl1.stream;
  StreamController<int> ctl2 = StreamController<int>();
  Stream stm2 = ctl2.stream;
  StreamController<String> ctl3 = StreamController<String>();
  Stream stm3 = ctl3.stream;
  stm1.listen((event) {
    print('一端的侦听器接受到的double值是: $event');
  });

  stm2.listen((event) {
    print('一端的侦听器接受到的int值是: $event');
  });
  stm3.listen((event) {
    print('一端的侦听器接受到的字符串是: $event');
  });
  Future<void> addWithDelay(value) async {
    await Future.delayed(oneSecond);
    ctl1.add(value);
  }

  Future<void> addWithDelay2(value) async {
    await Future.delayed(oneSecond);
    ctl2.add(value);
  }

  Future<void> addWithDelay3(value) async {
    await Future.delayed(oneSecond);
    ctl3.add(value);
  }

  addWithDelay(19.9);
  addWithDelay2(20);
  addWithDelay3('my age');

  await Future.delayed(Duration(seconds: 5));
}

//异常
Future<void> show_descriptions(flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (ex) {
    print('Could not describe object: $ex');
  } finally {
    flybyObjects.clear();
  }
}

Future<void> main() async {
  variables();
  var result = fibonacci(20);
  print('fibonacci result is $result');
  function_use();
  //使用Spacecraft类
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
  //类的继承
  var obt = Orbiter('天宫号', DateTime(2021, 4, 29), 389.2);
  obt.describe();
  var plt = PilotedCraft('神舟1号', DateTime(1999, 11, 20));
  plt.describe();
  plt.describeCrew();
  //抽象类
  var abs = abstract_class();
  abs.describeWithEmphasis();
  //异步
  await the_async();
  //Stream
  await the_stream();
  //异常
  print('*******异常*******');

  var flybyObjects = ['信息学院', '移动应用开发'];
  print('信息学院.txt中内容是“我在信息学院”,而无移动应用开发.txt');
  show_descriptions(flybyObjects); //信息学院.txt中内容是“我在信息学院”
}
