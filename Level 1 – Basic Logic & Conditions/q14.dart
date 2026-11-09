import 'dart:io';

void main(){
  ////////////////////////////////////////////////////////////////////
  ///Shipping Cost Calculator
  ///////////////////////////////////////////////////////////////////////
  print("Please Enter A Destination");
  String destination=stdin.readLineSync()??"".toLowerCase().trim();
  print("Please Enter A Weight");
  double ?weight=double.tryParse(stdin.readLineSync()??"".trim());

  double shippingCost=0;
  while(destination =="" || weight ==null ){
    if(destination==""){
      print("Please Enter A Valid Destination");
      destination=stdin.readLineSync()??"".toLowerCase().trim();
    }
    else{
      print("Please Enter A Valid Weight");
      weight=double.tryParse(stdin.readLineSync()??"".trim());
    }
  }
  if(weight <=0){
    print("invalid weight");
  }
  else{
    if(destination=="local"){
    shippingCost=2*weight;
    }
    else if (destination =="nearby"){
      shippingCost=4*weight;
    }
    else if(destination =="international"){
      shippingCost=shippingCost*weight;
    }
    else{
      print("Invalid Destination");
    }
  }
  print("Shipping Cost = $shippingCost");
  
}