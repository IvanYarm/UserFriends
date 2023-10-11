//
//  ContentView.swift
//  UserFriends
//
//  Created by Ivan Yarmoliuk on 8/20/23.
//

import SwiftUI

struct ContentView: View {
    
    
  
    @State var users: [User]?
    @State var showAlert = false
    @State var alertMessege: String = ""
    @State var showView = false
    
        var body: some View {
        
        NavigationView {
            Group {
                 if let unwreppedUsers = users {
                    Listview(users: unwreppedUsers)
                 } else {
                     Text("Loading")
                 }
            }
            
            
            
            .navigationTitle("Users Info")
            
            
            .alert("Sorry!", isPresented: $showAlert, actions: {
                Button("Cancel", role: .cancel) {
                //
                }
                Button("Try again") {
                    Task {
                        do {
                            users = try await getUsers()
                            
                        } catch UserInternetError.invalidURL {
                            alertMessege = "Invalid interner link, loading from Cash"
                            showView = true
                            showAlert = true
                            
                        } catch UserInternetError.invalidData {
                            alertMessege = "Invalid data, Loading from Cash"
                            showView = true
                            showAlert = true
                           
                        } catch UserInternetError.ivalidResponse {
                            alertMessege = "Invalid response, Loading from Cash"
                            showView = true
                            showAlert = true
                           
                        } catch {
                           alertMessege = "\(error.localizedDescription), Loading from Cash"
                            showView = true
                            showAlert = true
                          
                        }
                    }
                }
            }, message: {
                Text(alertMessege)
            })
            .task {
                  do {
                      users = try await getUsers()
                     
                      
                  } catch UserInternetError.invalidURL {
                      alertMessege = "Invalid interner link"
                      showAlert = true
                  } catch UserInternetError.invalidData {
                      alertMessege = "Invalid data"
                      showAlert = true
                  } catch UserInternetError.ivalidResponse {
                      alertMessege = "Invalid response"
                      showAlert = true
                  } catch {
                     alertMessege = error.localizedDescription
                      showAlert = true
                  
                }
                
            }
            
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        var use = [User(id: "32", isActive: true, name: "Ivan yar", registered: "2015-11-10T01:47:18-00:00", friends: [Friends(id: "74", name: "Me"), Friends(id: "25", name: "He")]), User(id: "2", isActive: false, name: "Zhanna Kim",registered: "2015-11-10T01:47:18-00:00", friends: [Friends(id: "74", name: "Me"), Friends(id: "25", name: "He")])]
        ContentView(users: use)
    }
}




extension ContentView {
    
    func getUsers() async throws -> [User] {
        let endpoint = "https://www.hackingwithswift.com/samples/friendface.json"
        //Craating URL Object
        guard let url = URL(string: endpoint) else {
            throw UserInternetError.invalidURL
        }
        //Creating get reguest with url
        let(data, response) = try await URLSession.shared.data(from: url)
        
        //Checking response for 200 if not return error
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw UserInternetError.ivalidResponse
        }
        
        //Decode JSON
        do {
            let decoder = JSONDecoder()
            //Need stratagy to canvert registered data to standart
            decoder.dateDecodingStrategy = .iso8601
            let decodedUser: [User] = try await MainActor.run {
                try decoder.decode([User].self, from: data)
            }
           
            return decodedUser
        } catch {
            print(error.localizedDescription)
            throw UserInternetError.invalidData
            
        }
    }
}
