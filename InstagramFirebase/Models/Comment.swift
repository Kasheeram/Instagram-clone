//
//  Comment.swift
//  InstagramFirebase
//
//  Created by kashee on 11/06/23.
//

import Foundation


struct Comment {
    let user: User
    let text: String
    let uid: String
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
