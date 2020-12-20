//
//  Presenter.swift
//  hometaskFive
//
//  Created by kinitaleino on 12/20/20.
//  Copyright © 2020 kinitaleino. All rights reserved.
//

import Foundation
import RealmSwift

class Presenter{
    
    private var imageURL: URL {URL(string:"https://jsonplaceholder.typicode.com/photos")!}
    private unowned var view: JSONViewController
    
    init(view:JSONViewController){
        self.view = view
    }
    
    func loadImages(){
        let realm = try! Realm()
        let imageURLs = Array(
        realm.objects(Photo.self)
            .map(\.url)
            .compactMap(URL.init)
        )
        
        if imageURLs.isEmpty {
            URLSession.shared.dataTask(with: imageURL){ data, _, _ in
                if
                    let data = data,
                    let photos = try? JSONDecoder().decode([Photo].self, from: data){
                    let imageURLStrings = photos.map(\.url)
                    DispatchQueue.main.async {
                        try! realm.write{
                            realm.add(photos)
                        }
                        self.view.updateImages(with: imageURLStrings.compactMap(URL.init))
                    }
                }
            }.resume()
        }else{
            view.updateImages(with: imageURLs)
        }
    }
}
