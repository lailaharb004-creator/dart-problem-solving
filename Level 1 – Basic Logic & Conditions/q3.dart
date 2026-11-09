import 'dart:io';

void main(){
////////////////////////////////////////////////////////////////
  ///Positive, Negative, or Zero
///////////////////////////////////////////////////////////////
  print("Please Enter A Number");
  String input =stdin.readLineSync() ?? "".trim();
  int ?number =int.tryParse(input);
  
  while(number ==null){
    print("Please Enter A Valid Number");
    input =stdin.readLineSync() ?? "".trim();
    number =int.tryParse(input);

  }
  if(number==0){
    print (number);
  }
  else if(number>0){
    print("Positive");
  }
  else{
    print("Negative");
  }
}