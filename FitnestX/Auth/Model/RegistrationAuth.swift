//
//  RegistrationAuth.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-11.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

class RegistrationAuth : ObservableObject {
    static let shared = RegistrationAuth()
    @Published var userSession: FirebaseAuth.User?
    
     init(){
         self.userSession = Auth.auth().currentUser
         self.verifyUserSession()
     }
    
    func registerUser(email: String, password: String, firstName: String, lastName: String, gender: String, dateOfBirth: Date,
                      weight: String, height: String, weightUnit: String, heightUnit: String, completion:
                      @escaping (Result <Void, Error>) -> Void){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error {
                print("Debug: Failed to register with error \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            guard let user = result?.user else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not authenticated"])))
                return
            }
            
            let data: [String: Any] = [
                "email": email,
                "firstName": firstName,
                "lastName": lastName,
                "gender": gender,
                "dateOfBirth": dateOfBirth,
                "weight" : weight,
                "height": height,
                "weightUnit": weightUnit,
                "heightUnit": heightUnit,
                "uid": user.uid
            ]
            
            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData(data){error in
                if let error = error {
                                    print("Debug: Failed to upload user data to Firestore with error \(error.localizedDescription)")
                                    completion(.failure(error))
                } else {
                    print("Debug: User data uploaded to Firestore successfully")
                    completion(.success(()))
                }
            }
        }
        
    }
    // Verify User Session
    
    func verifyUserSession(){
        if let currentUser = Auth.auth().currentUser {
            let db = Firestore.firestore()
            db.collection("users").document(currentUser.uid).getDocument { document, error in
                if let document = document, document.exists{
                    self.userSession = currentUser
                }else{
                    self.logout()
                    //Show Alert
                }
            }
        }
    }
    
    //Login
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let user = result?.user else {
                    completion(.failure(NSError(domain: "LoginError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred."])))
                    return
                }
                
                self.userSession = user
                completion(.success(()))
            }
        }
    
    
    //Logout
     func logout() {
         do{
             try Auth.auth().signOut()
             self.userSession = nil
             print("Debug: Successfully logged out.")
         } catch let signOutError as NSError{
             print("Debug: Error signing out:", signOutError)
         }
     }
}
