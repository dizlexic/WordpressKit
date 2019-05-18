//
//  Wordpress.swift
//  WordpressKit
//
//  Created by Giuseppe Sapienza on 05/06/18.
//  Copyright © 2018 Giuseppe Sapienza. All rights reserved.
//

import Foundation
import UIKit

public class Wordpress {
    
    public init(root: String, namespace: String = "/wp/v2") {
        guard let root = URL.init(string: root) else {
            fatalError(WordpressResponseError.rootNotConvertableToURL.localizedDescription)
        }
        
        self.root = root
        self.namespace = namespace
    }
    
    fileprivate let root: URL
    fileprivate let namespace: String
    
    func baseURL() -> URL {
        return self.root.appendingPathComponent(self.namespace)
    }
    
    public func get(endpoint: WordpressEndpoint) -> WordpressGetRequest {
        return WordpressGetRequest.init(
            baseURL: self.baseURL(),
            endpoint: endpoint
        )
    }
    
}