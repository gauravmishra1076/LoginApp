//
//  EntryFiield.swift
//  LoginSample
//
//  Created by gaurav.mishra on 28/07/21.
//

import SwiftUI

struct EntryFiield: View {
    var sfSymobolName :String
    var placeholder:String
    var prompt :String
    @Binding var field:String
    var isSecure = false
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: sfSymobolName)
                    .foregroundColor(.gray)
                    .font(.headline)
                    .frame(width: 20)
                if isSecure{
                    SecureField(placeholder,text:$field)
                }
                else{
                    TextField(placeholder,text:$field)
                }
            }.autocapitalization(.none)
            .padding(8)
            .background(Color(.secondarySystemBackground))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            Text(prompt)
                .fixedSize(horizontal: false, vertical: true)
                .font(.caption)
        }
       
        
        
    }
}

struct EntryFiield_Previews: PreviewProvider {
    static var previews: some View {
        EntryFiield(sfSymobolName: "", placeholder: "Username", prompt: "Enter valid username", field: .constant(""))
    }
}

