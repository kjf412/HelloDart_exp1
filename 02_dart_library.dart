import 'dart:math';

void num_String() {
  print('******数字、集合、字符串等代码调试******');
  print('assert()语句错误时 运行时不会报错 但是在debug中会');
//使用 int 和 double 的 parse() 方法将字符串转换为整型或双浮点型对象
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);
  //或者使用 num 的 parse() 方法，该方法可能会创建一个整型，否则为浮点型对象
  assert(num.parse('42.5') is double);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);
//通过添加 radix 参数可以指定整数的进制基数
  assert(int.parse('42', radix: 16) == 66);

  assert(42.toString() == '42');

// 使用 toString() 方法将整型或双精度浮点类型转换为字符串类型。
  assert(123.456.toString() == '123.456');

// 使用 toStringAsFixed(). 可以指定小数点右边的位数。
  assert(123.456.toStringAsFixed(2) == '123.46');

// 使用 toStringAsPrecision(): 指定字符串中的有效数字的位数。
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
//可以在字符串内查找特定字符串的位置，以及检查字符串是否以特定字符串作为开头或结尾
  // 检查字符串是否包含另一个字符串
  assert('Never odd or even'.contains('odd'));

// 检查字符串是否以两一个字符串为开头
  assert('Never odd or even'.startsWith('Never'));

// 检查一个字符串是否以另一个字符串结尾
  assert('Never odd or even'.endsWith('even'));

// 在字符串中查找字符串的位置
  assert('Never odd or even'.indexOf('odd') == 6);
// 分割出一个子串.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // 使用字符串模式分割出字符串
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  // 通过索引获取UTF-16代码单元（作为字符串）
  assert('Never odd or even'[0] == 'N');

  // 使用带有空字符串参数的split（）来获取
  //所有字符（作为字符串）的列表;
  // 适合迭代
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // 获取字符串中的所有UTF-16代码单元 此处是N的utf16编码
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  // 转化为大写
  print('教程中说toUpperCase()是首字母转换大小写，但是其作用是转换所有字母大小写');
  assert('web apps'.toUpperCase() == 'WEB APPS');
  print('web apps'.toUpperCase());
  // 转化为小写
  assert('WEB APPS'.toLowerCase() == 'web apps');

  // 修建字符串，即去除首尾的空格.
  assert('  hello  '.trim() == 'hello');

// 检查一个字符串是否为空
  assert(''.isEmpty);
// 有空格的字符串不是空的。
  assert('  '.isNotEmpty);
//字符串是不可变的对象，也就是说字符串可以创建但是不能被修改
//例如，方法 replaceAll() 返回一个新字符串，并没有改变原始字符串：
  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');
  print(greeting);
  print(greetingTemplate);
// greetingTemplate没有变化.
  if (greeting != greetingTemplate) {
    print('greetingTemplate没有变化.');
  }
  assert(greeting != greetingTemplate);

//构建一个字符串，可以使用StringBuffer
  print('构建一个字符串，可以使用StringBuffer');
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  print('在调用 toString() 之前， StringBuffer 不会生成新字符串对象。');
  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  // 这是一个或多个数字的正则表达式。
  print('RegExp 类提供与 JavaScript 正则表达式相同的功能。使用正则表达式可以对字符串进行高效搜索和模式匹配。');
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

// contains（）可以使用正则表达式。
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
// 用另一个字符串替换每个匹配项。
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
}

void list() {
  // 创建字符串的空列表。
  print('lists 可以通过字面量来创建和初始化');
  var grains = <String>[];
  assert(grains.isEmpty);

// 使用列表文字创建列表。
  var fruits = ['apples', 'oranges'];

// add为添加单个，添加到列表。
  fruits.add('kiwis');

// addall为添加多个，将多个项目添加到列表中。
  fruits.addAll(['grapes', 'bananas']);

// 获取列表长度
  assert(fruits.length == 5);

// 删除单个元素
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

// 删除所有元素
  fruits.clear();
  assert(fruits.isEmpty);

// 还可以使用其中一个构造函数创建列表。
  print('可以使用 List 的构造函数');
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  fruits = ['bananas', 'apples', 'oranges'];
  // 按索引访问列表项。
  assert(fruits[0] == 'bananas');
  //在列表中查找项目。
  assert(fruits.indexOf('apples') == 1);

  // 对列表进行排序
  print('使用 sort() 方法排序一个 list 。你可以提供一个排序函数用于比较两个对象。');
  print('比较函数在 小于 时返回 \ <0，相等 时返回 0，bigger 时返回 > 0 。');

  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
  // Error: 'int' can't be assigned to 'String'
  // fruits.add(5);
}

void sets() {
  // 创建一组空字符串
  var fruits = <String>{};

  // 向其中添加新项目
  fruits.addAll(['苹果', '葡萄', '小番茄']);
  assert(fruits.length == 3);

  // 添加重复项无效
  fruits.add('葡萄');
  assert(fruits.length == 3);
  print(fruits);
  // 删除一个项目
  fruits.remove('苹果');
  assert(fruits.length == 2);
  print(fruits);
  // 也可以使用set创建
  // 其中一个构造方法如下
  var atomicNumbers = Set.from([79, 22, 54]);
  print(atomicNumbers);

  print('使用 contains() 和 containsAll() 来检查一个或多个元素是否在 set 中');
  var vegetable = Set<String>();
  vegetable.addAll(['青菜', '西葫芦', '茄子']);

  // 检查项目是否在集合中.
  assert(vegetable.contains('青菜'));

  // 检查是否所有项目都在集合中.
  assert(vegetable.containsAll(['西葫芦', '茄子']));
  vegetable.add('小番茄');
  // 创建两个集的交点.
  var intersection = fruits.intersection(vegetable);
  assert(intersection.length == 1);
  assert(intersection.contains('小番茄'));
}

void maps() {
  print(
      'map 是一个无序的 key-value （键值对）集合，就是大家熟知的 dictionary 或者 hash。 map 将 kay 与 value 关联，以便于检索。和 JavaScript 不同，Dart 对象不是 map');
  // Maps通常使用字符串作为键s.
  var food = {
    'fruits': ['西瓜', '苹果', '葡萄'],
    'vegetables': ['西兰花', '菠菜'],
  };

  // Maps can be built from a constructor.
  //可以从构造函数构建映射
  var a_map = Map();

  // Maps 是参数化类型；您可以指定键和值应为的类型。
  var meat = Map<int, String>();

  meat = {88: '牛肉'}; // 惰性气体
  print('通过大括号语法可以为 map 添加，获取，设置元素。使用 remove() 方法从 map 中移除键值对。');
  // 使用键检索值.
  assert(meat[88] == '牛肉');
  print(meat[88]);

// 检查map是否包含键值.
  assert(meat.containsKey(88));

// 删除键及其值.
  meat.remove(88);
  assert(!meat.containsKey(54));
  //可以从一个 map 中检索出所有的 key 或所有的 value

// 将所有键值作为无序集合获取
// (an Iterable).
  var keys = food.keys;

  assert(keys.length == 2);
  assert(Set.from(keys).contains('fruits'));

// 将所有值作为无序集合获取
// (an Iterable of Lists).
  var values = food.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));
  // any （https://blog.csdn.net/qq_42351033/article/details/108161475）

//使用 containsKey() 方法检查一个 map 中是否包含某个key 。
//因为 map 中的 value 可能会是 null ，所有通过 key 获取 value，
//并通过判断 value 是否为 null 来判断 key 是否存在是不可靠的。
  assert(food.containsKey('fruits'));
  assert(!food.containsKey('vegetable')); //少了s
//如果当且仅当该 key 不存在于 map 中，且要为这个 key 赋值，
//可使用 putIfAbsent() 方法。该方法需要一个方法返回这个 value。
  var teamAssignments = <String, String>{};
  String pickToughestKid() {
    return "pickToughestKid";
  }

  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
  print(teamAssignments['Catcher']);
}

void public_method() {
  //List, Set, 和 Map 共享许多集合中的常用功能。
  //其中一些常见功能由 Iterable 类定义，这些函数由 List 和 Set 实现。

  //使用 isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素'
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
  //使用 forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法'
  teas = ['green', 'black', 'chamomile', 'earl grey'];
  teas.forEach((tea) => print('I drink $tea'));
//当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });
//Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中
  teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

//使用 map().toList() 或 map().toSet() ，可以强制在每个项目上立即调用函数
  var loadTeas_str = loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
  print(loadTeas_str);
//使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。
//使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件。
  teas = ['green', 'black', 'chamomile', 'earl grey'];

// 洋甘菊不含咖啡因
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

// 使用where（）仅查找返回true的项从提供的函数
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
// or teas.where(isDecaffeinated)

// 使用any（）检查集合是否至少有一个满足条件
  assert(teas.any(isDecaffeinated));

// 使用every（）检查集合是否全部满足条件
  assert(!teas.every(isDecaffeinated));
}

void date_time() {
  print('时间和日期');
  print('*' * 25);

// 获取当前日期和时间e.
  var now = DateTime.now();
  print(now);
// 使用本地时区创建新的DateTime.
  var y2k = DateTime(2020);
  print(y2k);
// 指定月份和日期
  y2k = DateTime(2022, 6, 2);
  print(y2k);
// 将日期指定为UTC时间.
  y2k = DateTime.utc(2021); // 1/1/2021, UTC
  print(y2k);
// 指定自Unix纪元以来的日期和时间（毫秒)
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  print(y2k);
// 解析ISO 8601日期.
  y2k = DateTime.parse('2022-04-12T00:00:00Z');
  print(y2k);

  //日期中 millisecondsSinceEpoch 属性返回自 “Unix 纪元（January 1, 1970, UTC）”以来的毫秒数：
  // 1/1/2000, UTC
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);
  y2k = DateTime.utc(2020);
  print(y2k.microsecondsSinceEpoch);
// 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);
  print('unixEpoch的utc是$unixEpoch.microsecondsSinceEpoch');
  y2k = DateTime.utc(2000);

// 加一年.
  var y2001 = y2k.add(const Duration(days: 366 * 20));
  assert(y2001.year == 2001);

// 减去30天.
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

// 计算两个日期之间的差值。
// 返回持续时间对象。
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366); // y2k was a leap year.
  int days = duration.inDays;
  print('$y2k和$y2001相差$days天');
}

void math_and_random() {
  print('数学和随机数');
  print('*' * 25);

  // cos
  assert(cos(pi) == -1.0);

// sin
  var degrees = 30;
  var radians = degrees * (pi / 180);
  print(radians);
// 弧度现在为0.52359.角度为30度
  var sinOf30degrees = sin(radians);
// sin 30° = 0.5
  assert((sinOf30degrees - 0.5).abs() < 0.01);
  print('Math 库提供 max() 和 min() 方法：');
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);

  //在 Math 库中可以找到你需要的数学常数，例如，pi， e
  // 有关其他常量，请参见数学库
  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951

//使用 Random 类产生随机数。可以为 Random 构造函数提供一个可选的种子参数
  var random = Random();
  var value1 = random.nextDouble(); // Between 0.0 and 1.0: [0, 1)
  print('nextDouble: $value1');
  var value2 = random.nextInt(10); // Between 0 and 9.
  print('nextInt: $value2');
  var value3 = random.nextBool(); // true or false
  print('nextBool: $value3');
}

void main(List<String> args) {
  // 数字、集合、字符串等
  num_String();
  // 集合
  list();
  sets();
  maps();
  public_method();
  // 时间和日期
  date_time();
  // 数学和随机数
  math_and_random();
}
