//
//  DBService-UserCollectionKey.swift
//  FirebaseLogin
//
//  Created by Biron Su on 2/19/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

struct UserCollectionKeys {
    static let CollectionKey = "users"
    static let UserIDKey = "userID"
    static let DisplayNameKey = "displayName"
    static let EmailKey = "email"
    static let JoinedDateKey = "joinedDate"
    static let CoverImageKey = "photoURL"
    
}

extension DBService {
    static public func createUser(user: UserModel, completion: @escaping (Error?)-> Void) {
        firestoreDB.collection(UserCollectionKeys.CollectionKey)
            .document(user.userID)
            .setData([
                UserCollectionKeys.UserIDKey: user.userID,
                UserCollectionKeys.EmailKey: user.email,
                UserCollectionKeys.JoinedDateKey: user.joinedDate,
                UserCollectionKeys.DisplayNameKey: user.displayName,
                UserCollectionKeys.CoverImageKey: user.photoURL ?? ""
            ]) { (error) in
                if let error = error {
                    completion(error)
                } else {
                    completion(nil)
                }
        }
    }
    static public func fetchUser(userID: String, completion: @escaping(Error?, UserModel?) -> Void) {
        DBService.firestoreDB
            .collection(UserCollectionKeys.CollectionKey)
            .whereField(UserCollectionKeys.UserIDKey, isEqualTo: userID)
            .getDocuments { (snapshot, error) in
                if let error = error {
                    completion(error, nil)
                } else if let snapshot = snapshot?.documents.first {
                    let fetchedUser = UserModel(dict: snapshot.data())
                    completion(nil, fetchedUser)
                }
        }
        
    }
}
