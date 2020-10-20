//
//  URLSession+ResultType.swift
//  Fetch Rewards
//
//  Created by Adam on 20/10/2020.
//

import Foundation

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(Data, URLResponse), Error>) -> Void) -> URLSessionDataTask {

        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((data, response)))
        }
    }
}
