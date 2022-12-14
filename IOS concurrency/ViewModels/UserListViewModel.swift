//
//  UserListViewModel.swift
//  IOS concurrency
//
//  Created by didin amarudin on 20/09/22.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    func fetchUser() {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        isLoading.toggle()
        apiService.request { (result: Result<[User], APIError>) in
            defer {
                DispatchQueue.main.async {
                    self.isLoading.toggle()
                }
            }
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.users = users
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert = true
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
