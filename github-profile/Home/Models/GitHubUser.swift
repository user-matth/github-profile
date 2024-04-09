//
//  GitHubUser.swift
//  github-profile
//
//  Created by Matheus Cardoso on 09/04/24.
//

import Foundation
import SwiftUI

struct GitHubUser: Decodable {
    var login: String
    var name: String?
    var bio: String?
    var avatarUrl: String
    var publicRepos: Int
    var followers: Int
    var following: Int

    enum CodingKeys: String, CodingKey {
        case login, name, bio
        case avatarUrl = "avatar_url"
        case publicRepos = "public_repos"
        case followers, following
    }
}

