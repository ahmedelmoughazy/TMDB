//
//  ListActorsAdapter.swift
//  TMDB
//
//  Created by Ahmed Refaat on 9/29/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit

class ListActorsAdapter: NSObject, BaseListAdapterProtocal{
    
    typealias DataType = Person
    
    private let cellReuseIdentifier = "TableCell"
    internal var list: [Person]?
    var tableView: UITableView?
    
    var reloadData: (() -> Void)?
    var loadMoreData:(() -> Void)?
    
    var showEmptyState: ((Bool) -> Void)?
    
    func setTableView(actorsTable: UITableView){
        let cellNib = UINib(nibName: cellReuseIdentifier, bundle: Bundle.main)
        tableView = actorsTable
        tableView?.register(cellNib, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func add(item: Person) {
        
    }
    
    func add(items: [Person]) {
        if list == nil {
            list = []
        }
        list?.append(contentsOf: items)
        reloadData?()
    }
    
    func update(item: Person) {
        
    }
    
    func count() -> Int {
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        return index.row == count()-3
    }
    
    func clear(reload: Bool) {
        switch reload {
        case true:
            list?.removeAll()
            reloadData?()
        default:
            list?.removeAll()
        }
    }
}

extension ListActorsAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! TableCell
        
 //        if reached last row, load next batch
        if ( isLastIndex(index: indexPath) ){
            loadMoreData?()
        }
        
        if count() != 0 {
            cell.configure(indexPathRow: indexPath.row, person: list![indexPath.row])
        }
        return cell
    }
}
