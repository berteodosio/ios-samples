//
//  PersonRepository.swift
//  StarTrivia
//
//  Created by Bernardo Teodosio on 17/11/18.
//  Copyright © 2018 Bernardo Teodosio. All rights reserved.
//

import UIKit

class PersonRepository {

    func getRandomPersonUrlSession(randomPersonId: Int, _ completion: @escaping (Person?) -> Void) {
        guard let url = URL(string: Endpoints.PERSON_ENDPOINT + "\(randomPersonId)") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint("Error happend; error = \(error!)")
                DispatchQueue.main.async { completion(nil) }
                return
            }
            
            guard let data = data else { DispatchQueue.main.async { completion(nil) }; return }
            
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonAny as? [String : Any] else { return }
                let person = self.parsePersonFromJson(json)
                DispatchQueue.main.async { completion(person) }
            } catch {
                debugPrint("Error parsing json")
                DispatchQueue.main.async { completion(nil) }
            }
        }
        task.resume()
    }
    
    private func parsePersonFromJson(_ json: [String : Any]) -> Person {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hairColor = json["hair_color"] as? String ?? ""
        let skinColor = json["skin_color"] as? String ?? ""
        let eyeColor = json["eye_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmsUrls = json["films"] as? [String] ?? []
        let vehiclesUrls = json["vehicles"] as? [String] ?? []
        let starshipsUrls = json["starships"] as? [String] ?? []
        
        return Person.init(name: name, height: height, mass: mass, hairColor: hairColor,
                           skinColor: skinColor, eyeColor: eyeColor, birthYear: birthYear,
                           gender: gender, homeworldUrl: homeworldUrl, filmsUrl: filmsUrls,
                           vehiclesUrl: vehiclesUrls, starshipsUrl: starshipsUrls)
    }
    
}
