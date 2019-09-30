//
//  ListActorsModule.swift
//  TMDB
//
//  Created by Ahmed Refaat on 9/29/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ListActorsModule {
    class func getListActorsView() -> ListActorsViewController {
        let listActorsView = ListActorsViewController()
        let listActorsModel = ListActorModel()
        let presenter = ListActorsPresenter(view: listActorsView, model: listActorsModel)
        
        listActorsView.setPresenter(presenter: presenter)
        
        return listActorsView
        
    }
}
