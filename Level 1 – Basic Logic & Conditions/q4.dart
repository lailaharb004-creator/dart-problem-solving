import 'dart:io';

void main(){
  /////////////////////////////////////////////////////////////////////
  ///Grade Calculator
  /////////////////////////////////////////////////////////////////////
  print("Enter A valid Mark between 0-100");
  String input =stdin.readLineSync() ?? "".trim();
  double ?mark=double.tryParse(input);

  while(mark==null || mark<0 || mark>100){
    print("Enter A valid Mark between 0-100");
    input =stdin.readLineSync() ?? "".trim();
    mark=double.tryParse(input);
  }

  if(mark >=90){
    print("$mark grade =A");
  }
  else if(mark >=80){
    print("$mark grade =B");
  }
  else if(mark >=70){
    print("$mark grade =C");
  }
  else if(mark >=60){
    print("$mark grade =D");
  }
  else{
    print("$mark grade =F");
  }
}