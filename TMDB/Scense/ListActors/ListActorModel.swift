//
//  ListActorModel.swift
//  TMDB
//
//  Created by Ahmed Refaat on 9/29/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ListActorModel: ListActorsModelProtocol {
    func getActors(forPage page: Int, compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getActors(pageNumber: page) { (result, statusCode) in
            do {
                let results = try result.get().results
                compelation(.success(results!))
            } catch {
                print(error)
            }
        }
    }
    
    func getSearchActors(forPage page: Int, query:String, compelation: @escaping (Result<Any, Error>) -> Void) {
        NetworkManager.shared.getSearchActors(pageNumber: page, query: query) { (result, statusCode) in
            do {
                let results = try result.get().results
                compelation(.success(results!))
            } catch {
                print(error)
            }
        }
    }
}
