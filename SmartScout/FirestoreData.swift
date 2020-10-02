//
//  FirestoreData.swift
//  SmartScout
//
//  Created by Arish Tripathi on 14/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreData: ObservableObject {
    
    let db = Firestore.firestore()
    let currentUser = Auth.auth().currentUser?.uid
    
    @Published var liked: Bool = false
    @Published var userType: String = ""
    @Published var name: String = ""
    
    init(){
        checkLike()
        checkUserType(UID: currentUser!)
    }
    
    func checkLike() {
        
        db.collection("users").document("MvqHJkYNMXT4wcAsdnEEHVTx6tC3")
            .addSnapshotListener{(documentSnapshot, error)  in
                
                guard let document = documentSnapshot else {
                  print("Error fetching document: \(error!)")
                  return
                }
                
                guard let data = document.data() else {
                  print("Document data was empty.")
                  return
                }
                
                self.liked = (document.get("liked")) as! Bool
                print(self.liked)
            }
    }
    
    func checkUserType(UID: String) {
        
        db.collection("users").document(UID).addSnapshotListener{ documentSnapshot, error in
            
            guard let documents = documentSnapshot else {
                print("Error fetching documents: \(error!)")
                return
            }
        
            self.userType = documentSnapshot?.get("type") as! String
            }
        
    }
    
    func checkName(UID: String) {
        
        db.collection("users").document(UID).addSnapshotListener{ documentSnapshot, error in
            
            guard let documents = documentSnapshot else {
                print("Error fetching documents: \(error!)")
                return
            }
        
            self.userType = documentSnapshot?.get("name") as! String
            }
        
    }
}
