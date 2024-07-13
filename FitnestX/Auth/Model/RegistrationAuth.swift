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
    @Published var currentUser: User?
    var service = UserService()
    
    @Published var showLogOutAlert = false
    
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
                    self.fetchUser()
                }else{
                    self.logout()
                    self.showLogOutAlert = true
                    //Show Alert
                }
            }
        }
    }
    
    //Login
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Login failed with error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            guard let user = result?.user else {
                print("Login failed: Unknown error occurred.")
                completion(.failure(NSError(domain: "LoginError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred."])))
                return
            }
            
            self.userSession = user
            print("Login successful, user session is set.")
            completion(.success(()))
        }
    }

    
    //Logout
     func logout() {
         print("Debug: Logging Out \(String(describing: self.userSession))")
         do{
             try Auth.auth().signOut()
             self.userSession = nil
             
             print("Debug 2: Successfully logged out. \(String(describing: self.userSession))")
         } catch let signOutError as NSError{
             print("Debug: Error signing out:", signOutError)
         }
     }
    
    
//    func setupAuthListener() {
//        Auth.auth().addStateDidChangeListener { auth, user in
//            if let user = user {
//                print("User is logged in with uid: \(user.uid)")
//                self.userSession = user
//            } else {
//                print("User is logged out.")
//                self.userSession = nil
//            }
//        }
//    }
    
    //Fetch User
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {
            print("Debug Fetch User: User Session Is Empty")
            return
        }
        service.fetchUser(uid: uid) { user, error in
            if let error = error {
                print("Debug: Error \(error.localizedDescription)")
                return
            }
            if let user = user {
                DispatchQueue.main.async {
                    self.currentUser = user
                    print("Fetch user: \(user.firstName)")
                }
            }else{
                print("User Not Found")
            }
        }
    }
}
