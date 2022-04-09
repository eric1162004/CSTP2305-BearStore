//
//  LoginScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct LoginScreen: View {
    
    @ObservedObject var authService: AuthService = Resolver.resolve()
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView{
            VStack {
                
                // title
                Text("Login")
                    .font(.system(size:FontSize.xlarge))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // bear image
                Image("bear")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height:150)
                
                // email
                InputField(text:$email, title: "Email")
                
                // password
                InputField(text:$password, title: "Password", isPasswordField: true)
                
                RoundedCornerButton(label:"Login"){
                    loginUser()
                }
                .padding(.vertical, Dm.small)
                
                
                // navigate to sign up screen
                NavigationLink(destination: SignUpScreen()) {
                    Text("Don't have an account?")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .foregroundColor(Color.black)
                
                Spacer()
                
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
    
    private func loginUser() {
        guard !email.isEmpty && !password.isEmpty else { return }
        
        authService.signIn(email: email, password: password, onError: {_ in}, onSuccess: {})
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
