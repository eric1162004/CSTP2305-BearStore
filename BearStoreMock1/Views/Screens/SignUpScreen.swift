//
//  SignUpScreen.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI
import Resolver

struct SignUpScreen: View {
    
    @ObservedObject var authService: AuthService = Resolver.resolve()
    
    // allow us to pop the current view off the navigation stack
    @Environment(\.presentationMode) var presentation
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            
            // title
            Text("Register")
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
            
            // password
            InputField(text:$confirmPassword, title: "Confirm Password", isPasswordField: true)
            
            RoundedCornerButton(label:"Register"){
                registerUser()
            }
            .padding(.vertical, Dm.small)
            
            // navigate to sign up screen
            Text("Already have an account?")
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    presentation.wrappedValue.dismiss()
                }
            
            Spacer()
            
        }
        .padding()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    private func registerUser() {
        guard !email.isEmpty && !password.isEmpty && confirmPassword == password else { return }
        
        authService.signUp(email: email, password: password, onError: {_ in}, onSuccess: {})
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
