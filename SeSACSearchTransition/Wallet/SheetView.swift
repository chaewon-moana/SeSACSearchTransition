//
//  SheetView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/23/24.
//

import SwiftUI

struct SheetView: View {
    
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green.ignoresSafeArea() //Color 자체도 뷰이기 때문에 가능함
                    
                VStack {
                    NavigationLink {
                        NavigationLazyView(HomeView())
                    } label: {
                        Text("네비게이션")
                    }

                    Text("Hello, World!ㄴㅇㄹㄴㅇㄹ")
                        .background(.black)
                        .foreground(.white)
                        .font(.title)
                        .wrapToButton {
                            print("asdfasdf")
                            showSheet.toggle()
                    }
                    ShareLink(item: "https://www.naver.com") {
                        Text("네이버로 가즈아")
                            .foregroundStyle(.red)
                    }
                    Text("Link")
                        .font(.title)
                }
            }
            .sheet(isPresented: $showSheet, content: {
                Text("asdfasdffffff")
                    .presentationDetents([.medium, .large, .small]) //높이조절까지 가능함!
                    .interactiveDismissDisabled()
                    
        })
        }
    }
}

extension PresentationDetent {
    static let small = Self.height(100) //그럼 왜 self 소문자가 아닌 Self? 대문자인가?
}

#Preview {
    SheetView()
}
