//
//  PostListView.swift
//  IOS concurrency
//
//  Created by didin amarudin on 20/09/22.
//

import SwiftUI

struct PostListView: View {
    @StateObject var viewModel = PostListViewModel()
    var userId: Int?
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    
                    Text(post.body)
                        .font(.callout)
                        .foregroundColor(.secondary)
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
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
        .onAppear {
            viewModel.userId = userId
            viewModel.fetchPosts()
        }
    }
}



struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(userId: 1)
    }
}
