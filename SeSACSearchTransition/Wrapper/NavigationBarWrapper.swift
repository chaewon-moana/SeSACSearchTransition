//
//  NavigationBarWrapper.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/22/24.
//

import SwiftUI

private struct NavigationBarWrapper<L: View, T: View>: ViewModifier {
    let leading: L
    let trailing: T
    
    init(@ViewBuilder leading: () -> L, @ViewBuilder trailing: () -> T) {
        self.leading = leading()
        self.trailing = trailing()
    }
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    leading
                }
                ToolbarItem(placement: .topBarTrailing) {
                    trailing
                }
            }
    }
}

extension View {
    func navigationBar(@ViewBuilder leading: () -> some View, @ViewBuilder trailing: () -> some View) -> some View { //leading과 trailing도 그냥 무언가가 들어와서 뷰로 처리를 해줄거야! 라는 의미로 해둠
        modifier(NavigationBarWrapper(leading: leading, trailing: trailing))
    }
}
