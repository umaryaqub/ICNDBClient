//
//  ICNDBClient.swift
//  ApiManager
//
//  Created by Umar Yaqub on 18/12/2018.
//  Copyright © 2018 Umar Yaqub. All rights reserved.
//

import Foundation

typealias ICNDBJokesCallback = (Result?, Error?) -> Void
typealias ICNDBJokeCallback = (Joke?, Error?) -> Void
typealias NetworkCallback = (Data?, URLResponse?, Error?) -> Void

class ICNDBClient {

    static let shared = ICNDBClient()
    let baseURL = "http://api.icndb.com/jokes/"
    static let randomJoke = "random"
    
    func fetchRandomJokes(count: Int, completion: @escaping ICNDBJokesCallback) {
        guard let url = URL(string: baseURL + ICNDBClient.randomJoke + "/\(count)") else { return }
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "GET"
        clientAPICall(with: urlrequest) { (data, response, error) in
            if let data = data {
                do {
                    let jokes = try JSONDecoder().decode(Result.self, from: data)
                    completion(jokes, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchJokeUsing(jokeID: Int, completion: @escaping ICNDBJokeCallback) {
        guard let url = URL(string: baseURL + "\(jokeID)") else { return }
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "GET"
        clientAPICall(with: urlrequest) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(Result.self, from: data)
                    result.jokes.forEach({ (joke) in
                        completion(joke, nil)
                    })
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchPersonalisedRandomJoke(_ firstName: String, _ lastName: String, completion: @escaping ICNDBJokeCallback) {
        guard let url = URL(string: baseURL + ICNDBClient.randomJoke + "?firstName=\(firstName)&" + "lastName=\(lastName)") else { return }
        var urlrequest = URLRequest(url: url)
        urlrequest.httpMethod = "GET"
        clientAPICall(with: urlrequest) { (data, response, error) in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(Result.self, from: data)
                    result.jokes.forEach({ (joke) in
                        completion(joke, nil)
                    })
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    private func clientAPICall(with request: URLRequest, completion: @escaping NetworkCallback) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
            }.resume()
    }

}
