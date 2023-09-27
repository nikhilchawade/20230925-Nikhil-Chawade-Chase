//
//  SearchViewMock.swift
//  20230925-Nikhil-Chawade-ChaseTests
//
//  Created by Nikhil Chawade on 27/09/23.
//

import XCTest
@testable import _0230925_Nikhil_Chawade_Chase

final class SearchViewMock: SearchViewContract {
    var viewModel: SearchViewModelContract!
    
    var presenter: SearchViewModelContract!
    var state: SearchViewState?

    func changeState(state: SearchViewState) {
        self.state = state
    }
}
