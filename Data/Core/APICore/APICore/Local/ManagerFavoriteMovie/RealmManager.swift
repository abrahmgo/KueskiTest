//
//  RealmManager.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import Foundation
import RealmSwift

class RealmManager {

    var localRealm: Realm!
    
    static var shared: RealmManager = RealmManager()
    
    init() {
        let identifier = "TheMovieDB"
        let config = Realm.Configuration(
            inMemoryIdentifier: identifier)
        // Open the realm
        localRealm = try! Realm(configuration: config)
    }
}
