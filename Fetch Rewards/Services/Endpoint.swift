//
//  Endpoint.swift
//  Fetch Rewards
//
//  Created by Adam on 20/10/2020.
//

import Foundation

struct Endpoint {
    private static let scheme = "https"
    private static let host = "fetch-hiring.s3.amazonaws.com"
    private static let path = "/hiring.json"

    static var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        return components.url
    }
}
