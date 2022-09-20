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
    var posts: [Post]
    var body: some View {
        List {
            ForEach(posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    
                    Text(post.body)
                        .font(.callout)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Posts")
        .navigationBarTitleDisplayMode(.inline)
        .listStyle(.plain)
    }
}



struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(posts: Post.mockSingleUserPostsArray)
    }
}
