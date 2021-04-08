//
//  ChatRow.swift
//  FireStoreDeomo
//
//  Created by JAESOON on 2021/02/10.
//

import SwiftUI

struct ChatRow: View {
    var chatData : MsgModel
    @AppStorage("current_user") var user = ""
    var body: some View {
        
        HStack(spacing: 15) {
            
            // NickName View...
            if chatData.user != "student" {
                
                NickName(name: chatData.user)
                    
            }
         
            if chatData.user == "student"{Spacer(minLength: 0)}
             
            VStack(alignment: chatData.user == user ? .trailing : .leading, spacing: 5, content: {
                Text(chatData.msg)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(ChatBubble(myMsg: chatData.user == "student"))
                
                Text(chatData.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(chatData.user != user ? .leading : .trailing, 10)
            })
            
            
            if chatData.user == "student" {
                
                NickName(name: chatData.user)
                    
            }
         
            if chatData.user != "student"{Spacer(minLength: 0)}
             
    }
        .padding(.horizontal)
        .id(chatData.id)
}
}

struct NickName : View {
    var name: String
    @AppStorage("current_user") var user = ""
    
    var body: some View {
        
        Text(String(name.first!))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .frame(width:50, height:50)
            .background((name == "student" ? Color.blue: Color.purple).opacity(0.3))
            .clipShape(Circle())
            
    }
}

