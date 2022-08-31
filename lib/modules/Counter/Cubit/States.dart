// ignore_for_file: camel_case_types, file_names

abstract class counterstates {}

class counterinitialstate extends counterstates {}

class counterPlus extends counterstates {
  final int counter;

  counterPlus(this.counter);
}

class counterMinus extends counterstates {
  final int counter;

  counterMinus(this.counter);
}
