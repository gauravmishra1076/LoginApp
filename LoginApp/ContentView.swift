//
//  ContentView.swift
//  LoginSample
//
//  Created by gaurav.mishra on 28/07/21.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
        NavigationView{
            VStack {
                VStack{
                    Text("Sign In")
                    .padding(.vertical, 10)
                    EntryFiield(sfSymobolName: "", placeholder: "Username", prompt: viewModel.userNamePrompt, field: $viewModel.username, isSecure:false)
                    EntryFiield(sfSymobolName: "", placeholder: "Password", prompt: viewModel.passwordPrompt, field: $viewModel.password, isSecure: true)
                    NavigationLink(destination: MainView(username: viewModel.username)) {
                    Text("Sign In")
                    }
                    .foregroundColor(.white)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(Capsule().fill(Color.blue))
                    .opacity(viewModel.canSubmit ? 1 :0.6)
                    .disabled(!viewModel.canSubmit)
                    
                   
                    
                }
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 20)
                Spacer()
            }
        }
      
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

