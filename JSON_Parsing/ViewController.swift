//
//  ViewController.swift
//  JSON_Parsing
//
//  Created by Kwak Teddy on 2017. 7. 11..
//  Copyright © 2017년 Kwak Teddy. All rights reserved.
//

import UIKit

struct WebsiteDescription: Decodable{
    let name: String
    let description: String
    let courese: [Course]
}

struct Course: Decodable {
    let id : Int?
    let name : String?
    let link : String?
    let imageUrl : String?
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
    
    
}

class ViewController: UIViewController {
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
            } catch let jsonError {
                print(jsonError)
            }
            
            
        }.resume()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

