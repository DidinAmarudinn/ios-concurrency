//
//  ContentView.swift
//  IOS concurrency
//
//  Created by didin amarudin on 19/09/22.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.users) { user in
                    NavigationLink {
                        PostListView(userId: user.id)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.title)
                            
                            Text(user.email)
                        }
                    }
                    
                }
            }
            .overlay(content: {
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                }
            })
            .alert("Application Error", isPresented: $viewModel.showAlert, actions: {
                Button("Ok"){}
            }, message: {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                }
            })
            .navigationTitle("Users")
            .listStyle(.plain)
            .onAppear {
                viewModel.fetchUser()
            }
        }
    }
}
extension UserListViewModel {
    convenience init(forPreview: Bool = false) {
        self.init()
        if forPreview {
            self.users = User.mockUsers
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
