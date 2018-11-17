//
//  PersonRepository.swift
//  StarTrivia
//
//  Created by Bernardo Teodosio on 17/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class PersonRepository {

    func getRandomPersonUrlSession() {
        guard let url = URL(string: Endpoints.PERSON_ENDPOINT) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint("Error happend; error = \(error!)")
                return
            }
            
            guard let data = data else { return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String : Any] else { return }
                debugPrint(json)
            } catch {
                debugPrint("Error parsing json")
            }
        }
        task.resume()
    }
    
}
