//
//  ContentView.swift
//  FireBaseSwiftUILesson28
//
//  Created by vladimir gennadievich on 16.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SignIn()
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
            
            VStack(alignment:.leading,spacing: 15 ) {
                
            Text("Username")
                .font(.callout)
            TextField("Enter Your User Uame", text: $userName)
            }
            Divider()
                .padding(.bottom,15)
            
            VStack(alignment:.leading,spacing: 15 ) {
            Text("Password")
                .font(.callout)
            TextField("Enter Your Password", text: $userSername)
            }
            Divider()
            
            
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
