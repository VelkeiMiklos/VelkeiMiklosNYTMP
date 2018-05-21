//
//  VelkeiMiklosNYTMPMainVCTests.swift
//  VelkeiMiklosNYTMPTests
//
//  Created by Velkei Miklós on 2018. 05. 19..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import XCTest
@testable import VelkeiMiklosNYTMP

class VelkeiMiklosNYTMPMainVCTests: XCTestCase {
    
    var sut: MainVC!
    var dataService: DataServices!
    var service: DownloadServices!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: Storyboard_ID.MAIN, bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: Storyboard_ID.MAIN_VC) as! MainVC
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_Has_TableView() {
        XCTAssertNotNil(sut.articleTableView)
    }
    
    func test_TableView_Has_Delegate() {
        XCTAssertNotNil(sut.articleTableView.delegate)
    }
    
    func test_TableView_Has_DataSource() {
        XCTAssertNotNil(sut.articleTableView.dataSource)
    }
    
    func test_TableView_DataSource_Protocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.numberOfSections(in:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
    func test_TableView_Delegate_Protocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func test_has_TableView_Header(){
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:viewForHeaderInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:heightForHeaderInSection:))))
    }
    
    func test_TableViewCell_Has_Reuse_Identifier() {
        sut.articleArray = DataServices.instance.getArticles()
        let cell = sut.tableView(sut.articleTableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? ArticleCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = TableViewCell.ARTICLE_CELL
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func test_TableViewCell_Has_Correct_Label(){
        sut.articleArray = DataServices.instance.getArticles()
        for (index, article) in sut.articleArray.enumerated(){
            let articleCell = sut.tableView(sut.articleTableView, cellForRowAt: IndexPath(row: index, section: 0)) as? ArticleCell
            XCTAssertEqual(articleCell?.titleLbl.text, article.title)
            XCTAssertEqual(articleCell?.authorLbl.text, article.byline)
            XCTAssertEqual(articleCell?.publishedDateLbl.text, article.publishedDate)
        }
    }
    
    func test_Has_SearchBar() {
        XCTAssertNotNil(sut.searchBar)
    }

    func test_Filtered_Article_Has_Four_Element(){
        sut.articleArray = DataServices.instance.getArticles()
        sut.navigationItem.searchController?.searchBar.text = SearchBarText.text_1
        sut.searchBarSearchButtonClicked((sut.navigationItem.searchController?.searchBar)!)
        print(sut.filteredArticleArray.count)
        XCTAssertEqual(sut.filteredArticleArray.count, 4)
    }
    
    func test_Periods(){
        
        sut.selectedPeriod = 1
        let period_one_day = URLHelper.articlesURL(withPeriod: sut.selectedPeriod)
        XCTAssertEqual(period_one_day, PeriodLink.link_1)
        
        sut.selectedPeriod = 7
        let period_one_weak = URLHelper.articlesURL(withPeriod: sut.selectedPeriod)
        XCTAssertEqual(period_one_weak, PeriodLink.link_2)
        
        sut.selectedPeriod = 30
        let period_one_month = URLHelper.articlesURL(withPeriod: sut.selectedPeriod)
        XCTAssertEqual(period_one_month, PeriodLink.link_3)
    }
    
    func test_Sort_Date(){
        
        var sortedMockArray = [Date]()
        var sortedArray = [Date]()
        
        sut.articleArray = DataServices.instance.getArticles()
        let sortedArticle = sut.sortArticle(article: sut.articleArray)
        for sortArt in sortedArticle{
            sortedArray.append(sortArt.publishedDateToSort)
        }
        
        let sortedArticleMock = DataServices.instance.getSortedArticles()
        for sortedMock in sortedArticleMock{
            sortedMockArray.append(sortedMock.publishedDateToSort)
        }

        XCTAssertEqual(sortedArray, sortedMockArray)
    }
}

