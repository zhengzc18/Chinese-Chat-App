//
//  MsgModel.swift
//  FireStoreDemo
//
//  Created by JAESOON on 2021/02/05.
//

import SwiftUI

import FirebaseFirestoreSwift

// For Onchange...
struct MsgModel: Codable, Identifiable, Hashable {
    
    @DocumentID var id :String?
    
    var msg: String
    var user: String
    var timestamp: Date
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case msg
        case user
        case timestamp
        }
    }
    

    
    
