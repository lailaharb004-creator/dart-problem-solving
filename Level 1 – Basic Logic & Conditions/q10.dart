import 'dart:io';

void main(){
  /////////////////////////////////////////////////////////////////
  ///Triangle Validator
  ////////////////////////////////////////////////////////////////
  print("Please Enter The First Side");
  int ?sideOne=int.tryParse(stdin.readLineSync()??"".trim());
  print("Please Enter The Second Side");
  int ?sideTwo=int.tryParse(stdin.readLineSync()??"".trim());
  print("Please Enter The Third Side");
  int ?sideThree=int.tryParse(stdin.readLineSync()??"".trim());

  while(sideOne ==null|| sideTwo==null || sideThree==null){
    if(sideOne==null){
      print("Please Enter Vaild First Side");
      sideOne=int.tryParse(stdin.readLineSync()??"".trim());

    }
    if(sideTwo==null){
      print("Please Enter Valid Second Side");
      sideTwo=int.tryParse(stdin.readLineSync()??"".trim());

    }
    if(sideThree==null){
      print("Please Enter Vaild Third Side");
      sideThree=int.tryParse(stdin.readLineSync()??"".trim());
    }
  }

  if((sideOne >0 && sideTwo>0 && sideThree>0)&& (sideOne + sideTwo >sideThree ||sideOne + sideThree>sideTwo || sideTwo + sideThree >sideOne)){
    print("Valid Triangle");
  }
  else{
    print("Invalid Triangle");
  }


  
}