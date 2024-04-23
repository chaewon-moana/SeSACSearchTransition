//
//  ButtonWrapper.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/22/24.
//

import SwiftUI

private struct ButtonWrapeer: ViewModifier {
    
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(action: action, 
               label: { content })
    }
}

extension View {
    func wrapToButton(action: @escaping () -> Void) -> some View {
        modifier(ButtonWrapeer(action: action))
    }
}
