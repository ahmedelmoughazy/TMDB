//
//  ListActorsProtocals.swift
//  TMDB
//
//  Created by Bassem Abbas on 9/24/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

protocol ListActorsPresenterProtocol: BasePresenterProtocol {
    
    var currentPage:Int { get set }
    
    func activateSearch(query: String)
    func cancelSearch()
    func loadActors()
    func refreshActores()
    func loadMoreActores()
    
}

protocol ListActorsViewProtocol:BaseViewProtocol {
    func renderViewWithObjects(list: [Person])
}

protocol ListActorsModelProtocol:BaseModelProtocol {
    func getActors(forPage page:Int , compelation: @escaping (_ result: Result<Any,Error>) -> Void)
    func getSearchActors(forPage page: Int, query:String, compelation: @escaping (Result<Any, Error>) -> Void)
}
