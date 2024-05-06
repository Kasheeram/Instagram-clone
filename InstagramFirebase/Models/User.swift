//
//  User.swift
//  InstagramFirebase
//
//  Created by Kashee on 28/05/23.
//

import Foundation

struct User {
    let uid: String
    let username: String
    let profileImgeUrl: String
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImgeUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}
