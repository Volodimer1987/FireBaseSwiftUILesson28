//
//  ContentView.swift
//  FireBaseSwiftUILesson28
//
//  Created by vladimir gennadievich on 16.02.2021.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth


struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View {
        VStack {
            if status {
                Home()
            } else  {
                SignIn()
            }
        }.animation(.spring())
        .onAppear {
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil,queue: .main) {
                (_)in
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                self.status = status
            }
        }
    }
}

struct SignIn:View {
    
    @State var message = ""
    @State var alert = false
    @State var show = false

    @State var userName = ""
    @State var userPassword = ""
    
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
                TextField("Enter Your Password", text: $userPassword)
            }
            .padding(.leading,15)
            
            Divider()
                .padding(.horizontal,15)
            
            
            Button(action: {
                signWhithEmail(email:self.userName, password: self.userPassword) { 
                    (ver,stat) in
                    
                    if !ver {
                        self.message = stat
                        self.alert.toggle()
                    } else {
                        UserDefaults.standard.set(true,forKey: "status")
                        NotificationCenter.default.post(name:NSNotification.Name("statusChange"),object:nil
                        )}
                }
            }) {
                Text("Sign In")
                    .frame(width: 300, height: 40, alignment: .center)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.top,30)
                    .alert(isPresented: $alert, content: {
                        Alert(title: Text("Error"), message: Text(self.message), dismissButton: .default(Text("Ok")))
                    })
                
            }
            
            
            Text("(or)")
                .padding(.top,30)
                .font(.callout)
                .opacity(0.8)
            
            HStack {
                Text("Dont have any account?")
                    .font(.callout)
                    .opacity(0.8)
                Button(action: {
                    self.show.toggle()
                }
                , label: {
                    Text("Sign Up")
                        
                })
                .font(.callout)
                
            }.padding(.top,20)
            .sheet(isPresented: $show, content: {
                SignUp(show:$show)
            })
        }
    }
}

struct SignUp:View {
    
    @State var message = ""
    @State var alert = false
    @Binding var show :Bool
    
    @State var userName = ""
    @State var userPassword = ""
    
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
                TextField("Enter Your Password", text: $userPassword)
            }
            .padding(.leading,15)
            
            Divider()
                .padding(.horizontal,15)
            
            
            Button(action: {
                signUpWhithEmail(email: userName, password: userPassword){
                    (ver,stat) in
                    
                    if !ver {
                        self.message = stat
                        self.alert.toggle()
                    } else {
                        UserDefaults.standard.set(true,forKey: "status")
                        self.show.toggle()
                        NotificationCenter.default.post(name:NSNotification.Name("statusChange"),object:nil
                        )}
                }
            }) {
                Text("Sign Up")
                    .frame(width: 300, height: 40, alignment: .center)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .padding(.top,30)
            }
        }
    }
}

struct Home:View {
    var body: some View {
        VStack(spacing:15) {
            Text("Home")
            Button(action: {
                    UserDefaults.standard.setValue(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                
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

func signWhithEmail(email:String,password:String, complition: @escaping (Bool,String) -> (Void)) {
    Auth.auth().signIn(withEmail: email, password: password, completion: { (res,err) in
        if err != nil {
            complition(false,(err?.localizedDescription)!)
            return
        }
        complition(true,(res?.user.email)!)
    })
}


func signUpWhithEmail(email:String,password:String, complition: @escaping (Bool,String) -> (Void)) {
    Auth.auth().createUser(withEmail: email, password: password, completion: { (res,err) in
        if err != nil {
            complition(false,(err?.localizedDescription)!)
            return
        }
        complition(true,(res?.user.email)!)
    })
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
