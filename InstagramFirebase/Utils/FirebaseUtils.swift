//
//  FirebaseUtil.swift
//  InstagramFirebase
//
//  Created by Kashee on 28/05/23.
//

import Foundation
import FirebaseDatabase

extension Database {
    static func fetchUserWithUID(uid: String, completion: @escaping (User) -> ()) {
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value) { snapshot in
            if (snapshot.value != nil) {
                guard let userdictionary = snapshot.value as? [String: Any] else { return }
                let user = User(uid: uid, dictionary: userdictionary)
                completion(user)
            } else {
                print("Failed to fetch user for posts")
            }
        }
    }
}
