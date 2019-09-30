//
//  ListActorsPresenter.swift
//  TMDB
//
//  Created by Ahmed Refaat on 9/29/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ListActorsPresenter: ListActorsPresenterProtocol{
    
    private var listActorView: ListActorsViewProtocol
    private var listActorModel: ListActorsModelProtocol
    var currentPage: Int
    
    func activateSearch(query: String) {
        currentPage = 1
        listActorModel.getSearchActors(forPage: currentPage, query: query) {(result) in
            do {
                let results = try result.get() as! [Person]
                self.listActorView.renderViewWithObjects(list: results)
            } catch {
                print(error)
            }
        }
    }
    
    func cancelSearch() {
        currentPage = 1
        listActorModel.getActors(forPage: currentPage) {(result) in
            do {
                let results = try result.get() as! [Person]
                self.listActorView.renderViewWithObjects(list: results)
            } catch {
                print(error)
            }
        }
    }
    
    func loadActors() {
        listActorModel.getActors(forPage: currentPage) {(result) in
            do {
                let results = try result.get() as! [Person]
                self.listActorView.renderViewWithObjects(list: results)
            } catch {
                print(error)
            }
        }
    }
    
    func refreshActores() {
        currentPage = 1
        listActorModel.getActors(forPage: currentPage) {(result) in
            do {
                let results = try result.get() as! [Person]
                self.listActorView.renderViewWithObjects(list: results)
            } catch {
                print(error)
            }
        }
    }
    
    func loadMoreActores() {
        currentPage += 1
        listActorModel.getActors(forPage: currentPage) {(result) in
            do {
                let results = try result.get() as! [Person]
                self.listActorView.renderViewWithObjects(list: results)
            } catch {
                print(error)
            }
        }
    }
    
    required init(view: ListActorsViewProtocol, model: ListActorsModelProtocol) {
        listActorView = view
        listActorModel = model
        currentPage = 1
    }
    
    
}
