//
//  NetworkManager.swift
//  Fetch Rewards
//
//  Created by Adam on 20/10/2020.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func fetchListItems(completed: @escaping (Result<[ListItem], APIServiceError>) -> Void) {
        guard let url = Endpoint.url else { completed(.failure(.invalidUrl))
            return
        }

        URLSession.shared.dataTask(with: url) { result in
            switch result {
            case .success(let (data, response)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<300 ~= statusCode else {
                    completed(.failure(.invalidResponse))
                    return
                }
                do {
                    let listItems = try JSONDecoder().decode([ListItem].self, from: data)
                    completed(.success(listItems))
                } catch {
                    completed(.failure(.decodeError))
                    return
                }
            case .failure(let error):
                print(error)
                completed(.failure(.apiError))
            }
        }.resume()
    }
}
