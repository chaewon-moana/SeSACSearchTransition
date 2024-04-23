//
//  ForegroundWrapper.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/22/24.
//

import SwiftUI

private struct ForegroundWrapper: ViewModifier { //이런식으로 새로 만들어서 버전대응을 할 수 있음. if else 계속 쓰면 구조가 더라워지니
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(color)
    }
}

extension View { //애플이 권장한 스타일
    func foreground(_ color: Color) -> some View {
        modifier(ForegroundWrapper(color: color))
    }
}
