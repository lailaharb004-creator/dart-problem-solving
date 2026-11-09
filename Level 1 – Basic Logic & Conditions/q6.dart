import 'dart:io';

void main(){
  ///////////////////////////////////////////////////////////////////////////////
  ///Leap Year Checker
  ///////////////////////////////////////////////////////////////////////////////
  print("Please Enter A Year");
  String input=stdin.readLineSync()??"";
  int ?year=int.tryParse(input);

  while(year==null){
    print("Please Enater A Valid Year");
    input=stdin.readLineSync()??"";
    year=int.tryParse(input);
  }
  if(year %400 ==0 || (year %4==0 && year %100 !=0)){
    print ("$year it is leap year");
  }
  else {
    print("$year it is not a leap year");
  }
}