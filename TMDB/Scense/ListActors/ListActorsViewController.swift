//
//  ListActorsViewController.swift
//  Sample MVP
//
//  Created by Bassem Abbas on 9/18/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class ListActorsViewController: BaseViewController<ListActorsPresenter>, ListActorsViewProtocol {
    
    @IBOutlet private weak var actorsTableView: UITableView!
    private var adapter = ListActorsAdapter()
    private var searchBar :UISearchBar!
    private var queryText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actorsTableView.dataSource = adapter
        actorsTableView.delegate = self
        actorsTableView.separatorStyle = .none
        
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        searchBar.placeholder = "Search people"
        
        actorsTableView.tableHeaderView = searchBar
        actorsTableView.refreshControl = UIRefreshControl()
        actorsTableView.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        actorsTableView.refreshControl!.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        
        adapter.setTableView(actorsTable: actorsTableView)
        adapter.reloadData = reloadActorsData
        adapter.loadMoreData = loadMoreActors
        presenter.loadActors()
    }
    
    @objc func refresh() {
        adapter.clear(reload: true)
        presenter.refreshActores()
    }
    
    func reloadActorsData(){
        actorsTableView.separatorStyle = .singleLine
        actorsTableView.reloadData()
        actorsTableView.refreshControl?.endRefreshing()
    }
    
    func loadMoreActors(){
        presenter.loadMoreActores()
    }
    
    func renderViewWithObjects(list: [Person]) {
        adapter.add(items: list)
    }
}

extension ListActorsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //  PeopleRouter.showDetail(at: self.navigationController!, with: (peoplePresenter?.getPerson(index:indexPath.row))!)
    }
}

extension ListActorsViewController: UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        searchBar.text = ""
        adapter.clear(reload: true)
        presenter.cancelSearch()
        refresh()
    }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar){
        
        if queryText != "" {
            adapter.clear(reload: true)
            presenter.activateSearch(query: queryText)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        queryText = searchText
        
    }
    
}

