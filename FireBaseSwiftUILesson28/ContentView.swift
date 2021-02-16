//
//  ContentView.swift
//  FireBaseSwiftUILesson28
//
//  Created by vladimir gennadievich on 16.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignUp()
    }
}

struct SignIn:View {
    
    @State var userName = ""
    @State var userSername = ""
    
    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom,10)
            
            VStack(alignment:.leading,spacing: 10 ) {
                Text("Username")
                    .font(.system(size: 18))
                TextField("Enter Your User Uame", text: $userName)
            }
            .padding(.leading,15)
            
            Divider()
                .padding(.bottom,15)
                .padding(.horizontal,15)
            
            VStack(alignment:.leading,spacing: 10 ) {
                Text("Password")
                    .font(.system(size: 18))
                TextField("Enter Your Password", text: $userSername)
            }
            .padding(.leading,15)
            
            Divider()
                .padding(.horizontal,15)
            
            
            Button(action: {
                //
            }, label: {
                Text("Sign In")
                    .frame(width: 300, height: 40, alignment: .center)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.top,30)
            })
            Text("(or)")
                .padding(.top,30)
                .font(.callout)
                .opacity(0.8)
            
            HStack {
                Text("Dont have any account?")
                    .font(.callout)
                    .opacity(0.8)
                Button(action: {
                    //
                }
                , label: {
                    Text("Sign Up")
                        .font(.callout)
                })
            }.padding(.top,20)
        }
    }
}

struct SignUp:View {
    
    @State var userName = ""
    @State var userSername = ""
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.title)
                .fontWeight(.black)
                .padding(.bottom,10)
            
            VStack(alignment:.leading,spacing: 10 ) {
                Text("Username")
                    .font(.system(size: 18))
                TextField("Enter Your User Uame", text: $userName)
            }
            .padding(.leading,15)
            
            Divider()
                .padding(.bottom,15)
                .padding(.horizontal,15)
            
            VStack(alignment:.leading,spacing: 10 ) {
                Text("Password")
                    .font(.system(size: 18))
                TextField("Enter Your Password", text: $userSername)
            }
            .padding(.leading,15)
            
            Divider()
                .padding(.horizontal,15)
            
            
            Button(action: {
                //
            }, label: {
                Text("Sign Up")
                    .frame(width: 300, height: 40, alignment: .center)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.top,30)
            })
        }
    }
}

struct Home:View {
    var body: some View {
        VStack(spacing:15) {
            Text("Home")
            Button(action: {
                print("Dont no now")
            }, label: {
                Text("LogOut")
                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
