//
//  ApiRequests.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 13/08/23.
//

import Foundation
import SystemConfiguration

struct CharactersModelResponse : Decodable {
    let results: [Characters]
}

enum ParamsType: String {
    case page = "page"
    case name = "name"
    case status = "status"
}

enum NetworkError : Error {
    case notFound
    case noConnection
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
    
    
    func getCharacters(page: String?, name: String?, status: String?, completion: @escaping(Result<[Characters], NetworkError>) -> Void) {
        
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
                    completion(.failure(.notFound))
                }
            }else{
                if !NetworkReachability.isConnectedToNetwork() {
                    completion(.failure(.noConnection))
                } else {
                    completion(.failure(.notFound))
                }
            }
        }
        
        dataTask.resume()
    }
}

class NetworkReachability {
    static func isConnectedToNetwork() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return isReachable && !needsConnection
    }
}
