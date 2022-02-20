//
//  FavoriteInteractorTests.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/21/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import SpaceX
import XCTest

class FavoriteInteractorTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: FavoriteInteractor!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupFavoriteInteractor()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupFavoriteInteractor()
  {
    sut = FavoriteInteractor()
  }
  
  // MARK: Test doubles
  
  class FavoritePresentationLogicSpy: FavoritePresentationLogic
  {
    var presentFavoriteCalled = false
    
      func presentRoketList(response: Favorite.getFavoriteList.Response)
    {
        presentFavoriteCalled = true
    }
  }
    
    class RocketsWorkerSpy: RocketWorker
    {
        // MARK: Method call expectations
        
        var fetchRocketCalled = false
        
        // MARK: Spied methods
        
        override func getRocketList(completionHandler: @escaping RocketListHandler, failure: @escaping ErrorHandler) {
            fetchRocketCalled = true
            let list: [Rocket] = [Seeds.Rockets.rocket1, Seeds.Rockets.rocket2]
            completionHandler(list)
        }
    }
  
  // MARK: Tests
  
    func testFetchRocketShouldAskRocketWorkerToFetchRocketsAndPresenterToFormatResult()
    {
        // Given
        let favoritePresentationLogicSpy = FavoritePresentationLogicSpy()
        sut.presenter = favoritePresentationLogicSpy
        let rocketsWorkerSpy = RocketsWorkerSpy()
        sut.worker = rocketsWorkerSpy
        
        // When
        let request = Favorite.getFavoriteList.Request()
        sut.getRockestList(request: request)
        
        // Then
        XCTAssert(rocketsWorkerSpy.fetchRocketCalled, "fetch rocket")
        XCTAssert(favoritePresentationLogicSpy.presentFavoriteCalled, "favorite result")
    }
}
