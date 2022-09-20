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
                ForEach(viewModel.userAndPosts) { userAndPosts in
                    NavigationLink {
                        PostListView(posts: userAndPosts.posts)
                    } label: {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(userAndPosts.user.name)
                                    .font(.title)
                                
                                Spacer()
                                Text("\(userAndPosts.numberOfPosts)")
                            }
                            Text(userAndPosts.user.email)
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
            .task {
                await viewModel.fetchUser()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
