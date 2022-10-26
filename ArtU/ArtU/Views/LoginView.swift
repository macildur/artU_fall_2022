//
//  LoginView.swift
//  ArtU
//
//  Created by Trav Feller on 10/19/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var signinViewController: SigninViewController
    @Binding var isLogin: Bool

    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Image("green_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 90.0, height: 90.0)
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.bottom, 20)
                
                //Vinh, this is hardcoded in place bc we probs gonna switch to the other login screen, right? The one on the prototype
                Button(action: {
                    isLogin = !isLogin
                    }, label: {
                        Text("Register")
                            .frame(width: 630, height: 30, alignment: .bottomTrailing)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.bottom, 0)
                            .padding(.top, 0)
                })
                    .padding(.bottom, 0)
                    
                
                HStack {
                    TextField("Username", text: $username)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                        .padding(.leading, 50)
                        .padding(.trailing, 20)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                        .padding(.leading, 20)
                        .padding(.trailing, 50)
                }
                
                HStack {
                    Button(action: {
                        Task {
                            let loginUser = LoginUser(username: username, password: password)
                            signinViewController.login(loginUser: loginUser)
                        }
                    }) {
                        Text("Login")
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                    }
                }
            }
            if signinViewController.isLoading {
                VisualEffectView()
                LoaderView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var isLogin = false
    @ObservedObject static var signinViewController = SigninViewController()

    static var previews: some View {
        LoginView(signinViewController: signinViewController, isLogin: $isLogin)
    }
}
