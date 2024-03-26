//
//  RealmPopularMovie.swift
//  APICore
//
//  Created by Andrés Bonilla Gómez on 25/03/24.
//

import CoreEntities
import RealmSwift

class RealmPopularMovie: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var originalLanguage: String = ""
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var poster: String = ""
    @objc dynamic var releaseDate: Date = Date()
    @objc dynamic var title: String = ""
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var voteCount: Int = 0
    
    func mapTo() -> PopularMovie {
        return PopularMovie(id: id,
                            originalLanguage: originalLanguage,
                            originalTitle: originalTitle,
                            overview: overview,
                            popularity: popularity,
                            poster: URL(string: poster),
                            releaseDate: releaseDate,
                            title: title,
                            voteAverage: voteAverage,
                            voteCount: voteCount)
    }
}
