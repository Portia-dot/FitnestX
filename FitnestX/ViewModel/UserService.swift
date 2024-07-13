//
//  UserService.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-13.
//

import Firebase
import FirebaseFirestore

struct UserService {
    func fetchUser(uid: String, completion: @escaping (User?, Error?) -> Void) {
           let db = Firestore.firestore()
           db.collection("users").document(uid).getDocument { document, error in
               if let error = error {
                   print("Error fetching user: \(error.localizedDescription)")
                   completion(nil, error)
                   return
               }
               guard let document = document, document.exists else {
                   print("No User Found")
                   completion(nil, nil)
                   return
               }
               do {
                   let user = try document.data(as: User.self)
                   completion(user, nil)
               } catch let decodeError {
                   print("Error decoding user: \(decodeError)")
                   completion(nil, decodeError)
               }
           }
       }
}
