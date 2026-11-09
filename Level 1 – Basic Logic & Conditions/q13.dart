import 'dart:io';

void main(){
  /////////////////////////////////////////////////////////////////////////////////
  ///Login Validator
  ////////////////////////////////////////////////////////////////////////////////
  print("Please Enter The Username");
  String uname=stdin.readLineSync()??"";
  print("Please Enter The Password");
  String pass=stdin.readLineSync()??"";

  if(uname=="admin" && pass=="admin123"){
    print("login Successful");
  }
  else if(uname !="admin" && pass=="admin123"){
    print("Invalid Username");
  }
  else if(uname =="admin" && pass!="admin123"){
    print("Invalid Password");
  }
  else{
    print("Invalid Credentials");
  }
}