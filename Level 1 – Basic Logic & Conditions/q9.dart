import 'dart:io';

void main(){
  //////////////////////////////////////////////////////////
  ///Temperature Checker
  //////////////////////////////////////////////////////////
  print("Please Enter A Tempreture In Celsius");
  String input=stdin.readLineSync()??"".trim();
  int ?temp=int.tryParse(input);

  while(temp ==null){
    print("Please Enter A Tempreture In Celsius");
    input=stdin.readLineSync()??"".trim();
    temp=int.tryParse(input);
  }

  if(temp<0){
    print("$temp C Freezing ");
  }
  else if(temp <=15){
    print("$temp C Cold ");
  }
  else if(temp<=25){
    print("$temp C Moderate ");
  }
  else if(temp<=35){
    print("$temp C Warm ");
  }
  else{
    print("$temp C Hot ");
  }
}