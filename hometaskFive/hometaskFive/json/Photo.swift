//
//  Photo.swift
//  hometaskFive
//
//  Created by kinitaleino on 12/20/20.
//  Copyright © 2020 kinitaleino. All rights reserved.
//

import RealmSwift

final class Photo: Object, Decodable {
    @objc dynamic private(set) var url: String
}
