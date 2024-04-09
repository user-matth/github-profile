//
//  GitHubViewModel.swift
//  github-profile
//
//  Created by Matheus Cardoso on 09/04/24.
//

import SwiftUI

class GitHubViewModel: ObservableObject {
    @Published var user: GitHubUser?
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchUserData(for username: String) {
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            self.errorMessage = "Invalid URL"
            return
        }

        isLoading = true
        errorMessage = nil

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false

                if let error = error {
                    self?.errorMessage = "Error fetching data: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self?.errorMessage = "No data received"
                    return
                }

                do {
                    let user = try JSONDecoder().decode(GitHubUser.self, from: data)
                    self?.user = user
                } catch {
                    self?.errorMessage = "Error decoding data: \(error.localizedDescription)"
                }
            }
        }
        task.resume()
    }
}
