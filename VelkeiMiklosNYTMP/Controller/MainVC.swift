//
//  ViewController.swift
//  VelkeiMiklósWUP
//
//  Created by Velkei Miklós on 2018. 05. 14..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
//MARK:- Outlets
    @IBOutlet weak var articleSegmentedControl: UISegmentedControl!
    @IBOutlet weak var articleTableView: UITableView!
    
//MARK:- Variables
    var articleArray =  [Article]()
    var filteredArticleArray = [Article]()
    let searchController = UISearchController(searchResultsController: nil)
    let articleRefreshControl = UIRefreshControl()
    var isConnectedToTheInternet: Bool = false
    var selectedPeriod = 1
    
//MARK:- View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.accessibilityIdentifier = View_ID.VIEW_ID_MAIN_VC
        
        //TableView
        articleTableView.delegate = self
        articleTableView.dataSource = self
        articleTableView.refreshControl = articleRefreshControl
        
        //SegmentedControl
        articleSegmentedControl.addTarget(self, action: #selector(handleSegmentedControlChange), for: .valueChanged)
        
        //RefreshControl
        articleRefreshControl.addTarget(self, action: #selector(downloadData), for: .valueChanged)
        
        //SearchBar
        configureSearchController()
        
        //Configure NavigationBar
        configureNavBar()
        
        //Download data
        initData()
    }
    
//MARK:- Download data
    @objc private func handleSegmentedControlChange(){
        switch articleSegmentedControl.selectedSegmentIndex{
        //1 day period
        case 0:
            self.selectedPeriod = 1
            self.initArticles(urlPeriod: selectedPeriod)
        //1 weak period
        case 1:
            self.selectedPeriod = 7
            self.initArticles(urlPeriod: selectedPeriod)
        //1 month period
        case 2:
            self.selectedPeriod = 30
            self.initArticles(urlPeriod: selectedPeriod)
        //1 day period
        default:
            self.selectedPeriod = 1
            self.initArticles(urlPeriod: selectedPeriod)
        }
    }
    
    @objc func downloadData(){
        if Reachability.isConnectedToNetwork() == true {
            initArticles(urlPeriod: self.selectedPeriod)
            articleRefreshControl.endRefreshing()
        }else{
            AlertUtil.showAlert(in: self, msg: MessageText.INTERNET_ERROR, title: MessageTitle.ERROR)
            articleRefreshControl.endRefreshing()
            return
        }
    }
    
    private func initArticles(urlPeriod: Int){
        DownloadServices.instance.downloadArticles(urlPeriod: self.selectedPeriod) { (isSuccess, returnedArticles, articleError) in
            if isSuccess{
                self.articleArray = [Article]()
                let articles = returnedArticles!
                self.articleArray = self.sortArticle(article: articles)
                self.articleRefreshControl.endRefreshing()
                self.articleTableView.reloadData()
            }else{
                AlertUtil.showAlert(in: self, msg: MessageText.DOWNLOAD_ERROR, title: MessageTitle.ERROR)
                self.articleRefreshControl.endRefreshing()
                return
            }
        }
    }
    
    private func initData(){
        if Reachability.isConnectedToNetwork() == true {
            self.isConnectedToTheInternet = true
            initArticles(urlPeriod: self.selectedPeriod)
        }else{
            self.isConnectedToTheInternet = false
        }
    }
    
//MARK:- Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueID.SHOW_DETAIL {
            if let indexPath = articleTableView.indexPathForSelectedRow {
                let controller = segue.destination  as? DetailVC
                let article = searchController.isActive ? filteredArticleArray[indexPath.row] : articleArray[indexPath.row]
                controller?.article = article
            }
        }
    }
    
//MARK:- Configuarion
    private func configureNavBar(){
        navigationItem.title  = NavBar.MAIN_TITLE
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.backgroundColor = .green
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .white
    }
 
//MARK:- Methods
     func sortArticle(article: [Article])->[Article]{
        let sortedArticle = article.sorted(by: {$0.publishedDateToSort > $1.publishedDateToSort  })
        return sortedArticle
    }
}

//MARK:- TableView
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filteredArticleArray.count : articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.ARTICLE_CELL, for: indexPath) as? ArticleCell else { return UITableViewCell() }
        let article = searchController.isActive ? filteredArticleArray[indexPath.row] : articleArray[indexPath.row]
        cell.configureCell(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueID.SHOW_DETAIL, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        if self.isConnectedToTheInternet == false{
            label.text = MessageText.INTERNET_ERROR
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
        return label
    }
    //Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.articleArray.count > 0 ? 0: 250
    }
}

//MARK:- SearchBar
extension MainVC: UISearchResultsUpdating, UISearchBarDelegate {
    func filterSearchController(_ searchBar: UISearchBar) {
        let searchText = searchBar.text ?? ""
        filteredArticleArray = articleArray.filter { article in
            let isMatchingSearchText = article.title.lowercased().contains(searchText.lowercased()) || searchText.lowercased().isEmpty
            return  isMatchingSearchText
        }
        articleTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterSearchController(searchController.searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterSearchController(searchBar)
    }
}

