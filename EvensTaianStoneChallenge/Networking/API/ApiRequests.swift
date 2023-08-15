//
//  ApiRequests.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 13/08/23.
//

import Foundation

struct CharactersModelResponse : Decodable {
    let results: [Characters]
}

enum ParamsType: String {
    case page = "page"
    case name = "name"
    case status = "status"
}

class ApiRequests {
    private func getConfiguration() -> URLSessionConfiguration {
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "Content-Type" : "application/json"]
        config.requestCachePolicy = .returnCacheDataElseLoad
        return config
    }

    private func getSession() -> URLSession{
        return URLSession(configuration: getConfiguration())
    }
    
    
    func getCharacters(page: String?, name: String?, status: String?, completion: @escaping(Result<[Characters], Error>) -> Void) {
        
        let url = "\(ApiConstants.baseURL)character"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        var queryParams : [URLQueryItem] = []
        
        if let page =  page {
            queryParams.append(URLQueryItem(name: ParamsType.page.rawValue, value: page))
        }
        
        if let name = name {
            queryParams.append(URLQueryItem(name: ParamsType.name.rawValue, value: name))
        }
        
        if let status = status {
            queryParams.append(URLQueryItem(name: ParamsType.status.rawValue, value: status))
        }

        guard var components = URLComponents(string: url) else {
            return
        }

        components.queryItems = queryParams
        request.url = components.url
        
        let dataTask = getSession().dataTask(with: request) { data, response, error in
            if error == nil {
                
                do {
                    if let data = data {
                        let charactersResponse : CharactersModelResponse = try JSONDecoder().decode(CharactersModelResponse.self, from: data)
                        completion(.success(charactersResponse.results))
                    }
                } catch {
                    completion(.failure(error))
                }
            }else{
                completion(.failure(error!))
            }
        }
        
        dataTask.resume()
    }
}
