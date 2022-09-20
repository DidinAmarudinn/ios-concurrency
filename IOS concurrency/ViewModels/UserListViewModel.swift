//
//  UserListViewModel.swift
//  IOS concurrency
//
//  Created by didin amarudin on 20/09/22.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var userAndPosts: [UserAndPosts] = []
    @Published var isLoading = false
    @Published var showAlert = false
    @Published var errorMessage: String?
    
    @MainActor
    func fetchUser() async {
        let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
        let apiServicePost = APIService(urlString: "https://jsonplaceholder.typicode.com/posts")
        isLoading.toggle()
        
        defer {
            isLoading.toggle()
        }
        do {
          async let users: [User] = try await apiService.request()
            async let posts: [Post] = try await apiServicePost.request()
            let (fetchedUsers, fetchedPosts) = await (try users, try posts)
            var userAndPostTemp: [UserAndPosts] = []
            for user in fetchedUsers {
                let userPosts = fetchedPosts.filter { $0.userId == user.id }
                let newUserAndPosts = UserAndPosts(user: user, posts: userPosts)
                userAndPostTemp.append(newUserAndPosts)
            }
            self.userAndPosts = userAndPostTemp
        } catch {
            showAlert = true
            errorMessage = error.localizedDescription
        }
        
        //        apiService.request { (result: Result<[User], APIError>) in
        //            defer {
        //                DispatchQueue.main.async {
        //                    self.isLoading.toggle()
        //                }
        //            }
        //            switch result {
        //            case .success(let users):
        //                DispatchQueue.main.async {
        //                    self.users = users
        //                }
        //            case .failure(let error):
        //                DispatchQueue.main.async {
        //                    self.showAlert = true
        //                    self.errorMessage = error.localizedDescription
        //                }
        //            }
        //        }
    }
}
