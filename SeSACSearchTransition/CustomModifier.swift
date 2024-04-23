//
//  CustomModifier.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/22/24.
//

import SwiftUI

private struct PointBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding(10)
            .background(Color.red)
            .foreground(.red) //버전대응을 할 수 있음
            .clipShape(.capsule)
    }
}

extension View {
    func asPointBackground() -> some View {
        modifier(PointBackground())
    }
}
