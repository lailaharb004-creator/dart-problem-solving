import 'dart:io';

void main(){
  /////////////////////////////////////////////////////////////////////////////
  ///Discount Calculator
  /////////////////////////////////////////////////////////////////////////////
  print("Please Enter Total Purchase Amount ");
  String input=stdin.readLineSync()??"".trim();
  double ?amount=double.tryParse(input);
  double discountPerc=0;
  double discountAmount=0;
  while(amount ==null ){
    print("Please Enter A Valid Total Purchase Amount ");
    input=stdin.readLineSync()??"".trim();
    amount=double.tryParse(input);
  }

  if(amount>=50 && amount<100){
    discountPerc=0.05;
  }
  else if (amount>=100 && amount<200){
    discountPerc=0.10;
  }
  else if(amount >=200){
    discountPerc=0.15;
  }
  discountAmount=amount*discountPerc;
  print("Purchase Amount = $amount");
  print("Discount Percentage = $discountPerc");
  print("Discount Amount = $discountAmount");
  print("Final Amount = ${amount-discountAmount}");
}