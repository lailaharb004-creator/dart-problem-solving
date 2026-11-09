import 'dart:io';

void main(){
  /////////////////////////////////////////////////////////////////////
  ///Divisibility Checker
  /////////////////////////////////////////////////////////////////////
  print("Please Enter the Number");
  double ?number =double.tryParse(stdin.readLineSync()??"".trim());
  print("Please Enter The Divisor");
  double ?divisor=double.tryParse(stdin.readLineSync()??"".trim());

  while (number ==null || divisor ==null){
    if(number ==null ){
      print("Please Enter A Valid Number");
      number =double.tryParse(stdin.readLineSync()??"".trim());
    }
    
    else {
      print("Please Enter A Valid Divisor");
      divisor=double.tryParse(stdin.readLineSync()??"".trim());
    }
  }
  if(number % divisor ==0){
    print("Divisable");
  }
  else{
    print("Not Divisable");
  }

}