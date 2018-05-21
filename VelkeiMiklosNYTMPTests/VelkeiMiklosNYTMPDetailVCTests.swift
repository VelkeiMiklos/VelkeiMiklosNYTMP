//
//  VelkeiMiklosNYTMPDetailVCTests.swift
//  VelkeiMiklosNYTMPTests
//
//  Created by Velkei Miklós on 2018. 05. 18..
//  Copyright © 2018. NeonatCore. All rights reserved.
//

import XCTest
@testable import VelkeiMiklosNYTMP

class VelkeiMiklosNYTMPDetailVCTests: XCTestCase {
    
    var sut: DetailVC!
    var dataService: DataServices!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: Storyboard_ID.MAIN, bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: Storyboard_ID.DETAIL_VC) as! DetailVC
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_Labels_Has_Correct_Label(){
        
        sut.article = DataServices.instance.getArticle() 
        sut.typeLbl.text = sut.article?.type
        sut.sectionLbl.text = sut.article?.section
        sut.abstractLbl.text = sut.article?.abstract
        sut.navigationItem.title = sut.article?.source
        sut.captionLbl.text = sut.article?.media.caption
        
        XCTAssertEqual(sut.typeLbl.text, sut.article?.type)
        XCTAssertEqual(sut.sectionLbl.text, sut.article?.section)
        XCTAssertEqual(sut.abstractLbl.text,sut.article?.abstract)
        XCTAssertEqual(sut.navigationItem.title, sut.article?.source)
        XCTAssertEqual(sut.captionLbl.text, sut.article?.media.caption)
    }

}

