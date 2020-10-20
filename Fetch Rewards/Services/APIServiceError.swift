//
//  APIServiceError.swift
//  Fetch Rewards
//
//  Created by Adam on 20/10/2020.
//

import Foundation

enum APIServiceError: Error {
    case invalidUrl
    case invalidResponse
    case decodeError
    case apiError
}
