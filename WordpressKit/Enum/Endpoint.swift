//
//  WordpressRequestType.swift
//  WordpressKit
//
//  Created by Giuseppe Sapienza on 06/06/18.
//  Copyright © 2018 Giuseppe Sapienza. All rights reserved.
//

import Foundation

public enum WordpressEndpoint {
    case posts
    case post(id: String)
    case revisions
    case categories
    case tags
    case pages
    case comments
    case taxonomies
    case media
    case users
    case types
    case statuses
    case settings
    case custom(path: String)
}


extension WordpressEndpoint: RawRepresentable {
    public typealias RawValue = String
    typealias endpoint = WordpressEndpoint
    
    public init?(rawValue: RawValue) {
        return nil
    }
    
    public var rawValue: RawValue {
        switch self {
        case .post(let id): return "\(endpoint.posts)/" + id
        case .custom(let path): return path
        default: return "\(self)"
        }
    }
}