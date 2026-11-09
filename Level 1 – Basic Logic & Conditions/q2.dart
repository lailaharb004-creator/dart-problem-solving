import 'dart:io';

void main (){
/////////////////////////////////////////////////////////////////
///Even-Odd
/////////////////////////////////////////////////////////////////
  print("Please Enter A Number ");
  String input=stdin.readLineSync() ?? "".trim();
  int ?number =int.tryParse(input);
  while(number ==null){
    print("Please Enter A Valid Number ");
    input=stdin.readLineSync() ?? "".trim();
    number =int.tryParse(input);
  }
  if(number %2 ==0){
    print("The Number $number Is Even");
  }
  else {
    print("The Number $number Is Odd");
  }
}