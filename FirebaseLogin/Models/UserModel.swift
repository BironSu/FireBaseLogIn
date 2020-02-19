//
//  UserModel.swift
//  FirebaseLogin
//
//  Created by Biron Su on 2/19/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation

struct UserModel: Equatable, Hashable {
    let userID: String
    let displayName: String
    let email: String
    let photoURL: String?
    let joinedDate: String
    
    // Initializer for saving to firebase
    init(userID: String,
         displayName: String,
         email: String,
         joinedDate: String,
         photoURL: String?) {
        self.userID = userID
        self.displayName = displayName
        self.email = email
        self.joinedDate = joinedDate
        self.photoURL = photoURL
    }
    // Initializer for getting data from firebase
    init(dict: [String: Any]) {
        self.userID = dict[UserCollectionKeys.UserIDKey] as? String ?? ""
        self.displayName = dict[UserCollectionKeys.DisplayNameKey] as? String ?? ""
        self.email = dict[UserCollectionKeys.EmailKey] as? String ?? ""
        self.joinedDate = dict[UserCollectionKeys.JoinedDateKey] as? String ?? ""
        self.photoURL = dict[UserCollectionKeys.CoverImageKey] as? String ?? ""
    }
}
