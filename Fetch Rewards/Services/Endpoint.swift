//
//  Endpoint.swift
//  Fetch Rewards
//
//  Created by Adam on 20/10/2020.
//

import Foundation

struct Endpoint {
    // I separate the strings out to make it clearer and easier to build on if needed
    private static let scheme = "https"
    private static let host = "fetch-hiring.s3.amazonaws.com"
    private static let path = "hiring.json"
    
    static var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        return components.url
    }
}
