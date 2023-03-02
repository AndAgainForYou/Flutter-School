void main() {

  // Оператор ??=
  int? x;
  print(x ??= 5); // якщо x == null, то присвоюємо йому 5 і виводимо 5
  print(x ??= 10); // x не null, тому виводимо 5


  // Використання лямбда-функцій, замикань
  int a = 5;
  Function addA = (int b) => a + b; // лямбда-функція замкнена на змінній 'a'
  print(addA(10)); // виводить 15


  // Використання параметрів за замовчуванням
  Function defaultParams = ({int x = 1, int y = 2}) => 'x = $x, y = $y';
  print(defaultParams());


  // Робота з різними типами колекцій
  List<int> list = [1, 2, 3];
  Set<int> set = {3, 2, 1};
  Map<String, int> map = {'a': 1, 'b': 2, 'c': 3};

  print(list); // виводить [1, 2, 3]
  print(set); // виводить {3, 2, 1}
  print(map); // виводить {a: 1, b: 2, c: 3}

}


// Використання ключового слова assert
double divideNumbers(double x, double y) {
  assert(y != 0, 'Ділення на 0'); // перевірка на ділення на 0
  return x / y;
}



// Різні варіанти конструкторів
// Фабричний конструктор
class Rectangle {
  int width;
  int height;

  Rectangle(this.width, this.height);

  factory Rectangle.square(int size) {
    return Rectangle(size, size);
  }
}



// Конструктор ініціалізації
class Person {
  String name;
  int age;

  Person(this.name, {required this.age});
}



// Використання міксинів
mixin Jumping {
  void jump() {
    print('Jumping!');
  }
}

class Animal {
  String name;

  Animal(this.name);
}

class Cat extends Animal with Jumping {
  Cat(String name) : super(name);
}