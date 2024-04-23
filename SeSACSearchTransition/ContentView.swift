//
//  ContentView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/19/24.
//

import SwiftUI
//스유 버전 확인
//우선순위
//적용순서

/*
 Swift
- Opaque Type: some / any
 Property Wrapper: wrappedValue / projectedValue
 - var body nonmutationg get
 - @state, @binding -> body 안에서는 프로퍼티의 변경이 불가능해서 property wrapper 요런걸루 해결
 - SwiftUI View Rendering: body 프로퍼티 연산
 
 Modifier
 - 적용순서
- 우선 순위
 - ViewModifier 활용한 Custom Modifier
 
 버전
 - ScrollView: iOS17+
 - NavigationStack: iOS16+
 - AsyncImage: iOS15+
 - LazyVStack: iOS14+
 */


//Transition
struct ContentView: View {
    
    @State private var isFullPresented = false
    @State private var isSheetPresented = false
    @State private var navigationPush = false
    var customButtonView: some View {
        HStack {
            Image(systemName: "star")
            Text("Button")
            Image(systemName: "star")
        }
        .padding(50) //여기 패딩을 주면 버튼 전체를 클릭할 수 있게 됨! 적용순서와 범위 잘 생각하기!
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button { //Button Custom하기 위해서 많이 사용
                    print("커스텀 버튼 클릭")
                } label: {
                    customButtonView
                }
                //.padding(50)
                .background(Color.green)
                
                Button("Full Present") {
                    // isFullPresented = true
                }
                .padding(50)
                .background(Color.yellow)
                Button("Sheet Present") {
                    isSheetPresented = true
                }
//                NavigationLink("Navigation Psuh") { //button과 달리, 오로지 push 기능만 담당함
//                      NavigationPushView()
//                }
                NavigationLink {
                    NavigationPushView()
                } label: {
                    Image(systemName: "star")
                }

//                Button("Navigation Push") {
//                    navigationPush = true
//                }
            }
            .font(.title)
            .fullScreenCover(isPresented: $isFullPresented) {
                FullPresentView()
            }
            .sheet(isPresented: $isSheetPresented) {
                FullPresentView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("네에비이게이셔언")
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button {
                        print("right 클릭")
                    } label: {
                        Text("하이하이")
                    }
                }
            }
//            .navigationDestination(isPresented: $navigationPush) {
//                NavigationPushView()
//            }
        }
     
    }
}

struct FullPresentView: View {
    var body: some View {
        Text("Full PresentView")
    }
}

struct SheetPresentView: View {
    var body: some View {
        Text("Sheet PresentView")
    }
}

struct NavigationPushView: View {
    var body: some View {
        Text("Navigation Push View;")
    }
}

#Preview {
    ContentView()
}
