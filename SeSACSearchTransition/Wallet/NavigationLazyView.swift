//
//  NavigationLazyView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/23/24.
//

import SwiftUI

struct NavigationLazyView<T: View>: View { //이 뷰를 활용하면 HomeView에서 누르지 않았는데도, HomeDetail을 다 불러오는 것을 막을 수 있음
    
    let build: () -> T
    
    init(_ build: @autoclosure @escaping () -> T) {
        self.build = build
    }
    var body: some View {
        build()
    }
}
