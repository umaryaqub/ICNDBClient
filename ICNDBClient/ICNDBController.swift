//
//  ICNDBController.swift
//  ICNDBClient
//
//  Created by Umar Yaqub on 20/12/2018.
//  Copyright © 2018 Umar Yaqub. All rights reserved.
//

import UIKit

class ICNDBController: UIViewController {

    let client = ICNDBClient.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.fetchRandomJokes(count: 5) { (result, error) in
            guard let jokes = result?.jokes else { return }
            jokes.forEach({ (joke) in
                print(joke.id, joke.text)
            })
            
        }
        client.fetchJokeUsing(jokeID: 15) { (joke, error) in
            if let joke = joke {
                print(joke.id, joke.text)
            }
        }
        
        client.fetchPersonalisedRandomJoke("John", "Doe") { (joke, error) in
            if let joke = joke {
                print(joke.id, joke.text)
            }
        }
    }

}

