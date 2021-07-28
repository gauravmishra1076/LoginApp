//
//  LoginModel.swift
//  LoginSample
//
//  Created by gaurav.mishra on 28/07/21.
//

import Foundation
import Combine
class LoginViewModel: ObservableObject {
    @Published  var username = ""
    @Published  var password = ""
    @Published var isuserNameValid = false
    @Published var isPasswordValid = false
    @Published var canSubmit = false
    private var cancellableSet :Set<AnyCancellable> = []
    let paaswordPredicate = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{5,}$")
    init() {
        $username
            .map{username  in
                return self.hasSpeccialChar(serchStr: username)
            }
            .assign(to: \.isuserNameValid,on: self)
            .store(in: &cancellableSet)
        
        $password
            .map{password  in
            return self.paaswordPredicate.evaluate(with: password)
            }
            .assign(to: \.isPasswordValid,on: self)
            .store(in: &cancellableSet)
        
        Publishers.CombineLatest($isuserNameValid ,$isPasswordValid)
            .map{isuserNameValid,isPasswordValid in
                return(isuserNameValid && isPasswordValid)
            }
            .assign(to: \.canSubmit ,on: self)
            .store(in: &cancellableSet)
       
        
    }
    var userNamePrompt:String{
        isuserNameValid ?
            ""
            :
        "Enter proper user name"
    }
    var passwordPrompt:String{
        isPasswordValid ?
            ""
            :
        "Password not meeting the criteria"
    }
    func login() {
        print("login in \(username).")
    }
    func hasSpeccialChar(serchStr : String) -> Bool {
        if serchStr.count == 0{
            return false
        }
        else
        {
        let regex = try! NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        if regex.firstMatch(in: serchStr, options: NSRegularExpression.MatchingOptions(), range:NSMakeRange(0, serchStr.count)) != nil {
            return false
        }
        else{
            return true
            
        }
      }
    }
}




