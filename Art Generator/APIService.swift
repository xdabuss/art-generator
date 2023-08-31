//
//  APIService.swift
//  Art Generator
//
//  Created by Alex Bussan on 8/31/23.
//

import Foundation

class APIService {
    let baseURL = "https://api.openai.com/v1/images/"
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func fetchImages(with data: Data) async throws {
        guard let apiKey else { fatalError("Could not get APIKey") }
        guard let url = URL(string: baseURL + "generations") else {
            fatalError("Error: invalid url")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse) != nil else {
            fatalError("Error: data request error")
        }
        print(String(decoding: data, as: UTF8.self))
    }
}