//
//  GitHubUserView.swift
//  github-profile
//
//  Created by Matheus Cardoso on 09/04/24.
//

import Foundation
import SwiftUI

struct GitHubUserView: View {
    @StateObject private var viewModel = GitHubViewModel()
    let username: String

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let user = viewModel.user {
                VStack {
                    AsyncImage(url: URL(string: user.avatarUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())

                    Text(user.login).font(.title)
                    Text(user.name ?? "No Name").font(.subheadline)
                    Text(user.bio ?? "No Bio").font(.body).padding()
                    HStack {
                        Label("\(user.publicRepos)", systemImage: "doc.plaintext")
                        Label("\(user.followers)", systemImage: "person.2")
                        Label("\(user.following)", systemImage: "person")
                    }.padding()
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage).foregroundColor(.red)
            }
        }
        .onAppear {
            viewModel.fetchUserData(for: username)
        }
    }
}

struct GitHubUserView_Previews: PreviewProvider {
    static var previews: some View {
        GitHubUserView(username: "your-username")
    }
}
