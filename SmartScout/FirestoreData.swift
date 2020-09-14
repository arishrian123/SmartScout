//
//  FirestoreData.swift
//  SmartScout
//
//  Created by Arish Tripathi on 14/09/2020.
//  Copyright © 2020 Arish Tripathi. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FirestoreData: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var liked: Bool = false
    @Published var userType: String = ""
    
    init(){
        checkLike()
        checkUserType()
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
    
    func checkUserType() {
        
        db.collection("users").document("MvqHJkYNMXT4wcAsdnEEHVTx6tC3").addSnapshotListener{ documentSnapshot, error in
            
            guard let documents = documentSnapshot else {
                print("Error fetching documents: \(error!)")
                return
            }
        
            self.userType = documentSnapshot?.get("type") as! String
            }
        
    }
}
