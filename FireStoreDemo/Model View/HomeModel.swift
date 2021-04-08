//
//  HomeModel.swift
//  FireStoreDemo
//
//  Created by JAESOON on 2021/02/05.
//

import SwiftUI
import Firebase

// Alert with TextFields
class HomeModel: ObservableObject {
    
    @Published var txt =  ""
    @Published var msgs: [MsgModel] = []
    @AppStorage("current_user") var user = ""
    let db = Firestore.firestore()
    
    init() {
        readAllMsgs()
        
    }
    
    func onAppear() {
        
        // MARK: Checking whether user is joined already
        
        if user == ""{
            
            // MARK: Join Alert
            UIApplication.shared.windows.first?.rootViewController?.present(alertView(), animated: true)
        }
    }
    
    func alertView()->UIAlertController {
        
        let alert = UIAlertController(title: "Join Chinese Learning Chat", message: "Enter User name", preferredStyle: .alert)
        
        alert.addTextField { (txt) in
            txt.placeholder = "Choon"
        }
        
        let join = UIAlertAction(title: "Join", style: .default) { (_) in
            
            // MARK: Checking for empty click
            let user = alert.textFields![0].text ?? ""
            
            if user != ""{
                
                self.user = user
                return
                
            }
            
            // MARK: repromiting alert view
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
        }
        
        alert.addAction(join)
        return alert
    }
    
    //MARK:  Reading Messages From Firebase
    func readAllMsgs() {
        
        db.collection("Message").order(by: "timestamp", descending: false).addSnapshotListener { (snapshot, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
          
            guard let data = snapshot else{return}
            data.documentChanges.forEach { (doc) in
                
                // adding when data added
                if doc.type == .added {
                    let msg = try! doc.document.data(as:MsgModel.self)!
                    
                    
                    DispatchQueue.main.async {
                        self.msgs.append(msg)
                    }
                }
    
}
}
    
}
    
    //MARK: Writing Messages To FireBase Database
    func writeMsgs() {
        
        let msg = MsgModel(msg: txt, user: user, timestamp: Date())
        
        let _ = try! db.collection("Message").addDocument(from: msg) { (error) in
         
            if error != nil {
                
                print(error!.localizedDescription)
                return
            }
            
            self.txt = ""
        }
    }
}
