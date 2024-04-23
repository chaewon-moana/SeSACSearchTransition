//
//  HomeView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/22/24.
//

import SwiftUI
/*
 1. navigationLink destination이 push 되지 않더라도 무조건 init이 되어버림
 
 2. SwiftUI로 플젝을 만들었을 떄, iOS15, 16으로 해둔다면 버전별 대응을 어떻게 했을지, 궁금증을 유발할 수 있음 -> 버전에 대한 체크 가능
 3.ViewBuilder
 
 */

struct HomeView: View {
    
    let url = URL(string: "https://picsum.photos/200")
    @ViewBuilder
    var posterImage: some View {
        if #available(iOS 15.0, *) {
            AsyncImage(url: url)
        } else {
            Rectangle()
                .background(Color.red)
        }
    }
    
    init() {
        print("homeView init")
    }
    var setionView: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { _ in
                    NavigationLink {
                        NavigationLazyView(HomeDetailView())
                    } label: {
                        posterImage
                    }
                }
            }
        }
    }
    
    var body: some View {
     //   NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(0..<5) { value in
                        Text("\(value) 섹션")
                            .asPointBackground()
                            .padding()
                            .font(.title)
                        setionView
                    }
                }
                .background(Color.yellow)
            }
            .navigationTitle("네비게이셔언")
        }
    //}
}

struct HomeDetailView : View {
    init() {
        print("homeDetailView init")
    }
    var body: some View {
        Text("asdfasdf")
    }
}

#Preview {
    HomeView()
}
