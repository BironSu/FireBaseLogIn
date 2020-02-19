//
//  DBService.swift
//  FirebaseLogin
//
//  Created by Biron Su on 2/19/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

final class DBService {
    private init(){}
    
    public static var firestoreDB: Firestore = {
        let db = Firestore.firestore()
        let settings = db.settings
        db.settings = settings
        return db
    }()
}
