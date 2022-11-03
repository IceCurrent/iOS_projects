//
//  constants.swift
//  Flash Chat iOS13
//
//  Created by shreyansh sharma on 11/05/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//


//cool name for constants is K. 
struct K{
    //static keyword makes it a property of the Type: Constants rather than property of an instance of of type constants. So we could now use Constants.registerSegue to access it rather than first creating an object of type constants and then accessing the property throygh that object.
    
        static let appName = "⚡️FlashChat"
        static let cellIdentifier = "ReusableCell"
        static let cellNibName = "MessageCell"
        static let registerSegue = "RegisterToChat"
        static let loginSegue = "LoginToChat"
        
        struct BrandColors {
            static let purple = "BrandPurple"
            static let lightPurple = "BrandLightPurple"
            static let blue = "BrandBlue"
            static let lighBlue = "BrandLightBlue"
        }
        
        struct FStore {
            static let collectionName = "messages"
            static let senderField = "sender"
            static let bodyField = "body"
            static let dateField = "date"
        }
    }
    
    

//Just like there are static variables, we also have static func which are pretty much the same as static variables.

//And static variables need not be the part of only structs, but also they could be a part of classes.
