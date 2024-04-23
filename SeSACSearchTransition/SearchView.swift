//
//  SearchView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/19/24.
//

import SwiftUI

struct Category: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

struct SearchView: View {
    let category = [
        Category(name: "스릴러", count: 1),
        Category(name: "스릴러", count: 2),
        Category(name: "SF", count: 1),
        Category(name: "로맨스", count: 1),
        Category(name: "애니메이션", count: 1)
    ]
    
    @State private var query = "모아나"
    
    var filterCategory: [Category] {
        return query.isEmpty ? category : category.filter { $0.name.contains(query) }
    }
    
    func setupRows(_ category: Category) -> some View {
        HStack {
            Image(systemName: "person")
            Text("\(category.name) \(category.count)")
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filterCategory, id: \.self) { value in
                    NavigationLink {
                        SearchDetailView(category: value)
                    } label: {
                        setupRows(value)
                    }
                }
            }
            .navigationTitle("영화아")
            .searchable(text: $query,
                        placement: .navigationBarDrawer,
                        prompt: "영화를 검색해보세요")
            .onSubmit(of: .search) { //엔터치면 동작, 쿼리가 입력이 될 때마다 동작할 수 있는 상태로 만들어줌
                print("asdfasdf")
            }
        }
    }
}

struct SearchDetailView: View {
    
    let category: Category
    
    var body: some View {
        Text("\(category.name), \(category.count)")
    }
}

    
//    var body: some View {
//        VStack {
//            ForEach(category, id: \.self) { value in //id를 판단하는 것. \.self는 그냥 그 자체를 보겠다는 것
//                //\.self를 \.name으로 고유성을 판단해서 처리를 한다! -> 똑같은 걸 만나버리면 이미 있는거라고해서 같은걸 보여줌
//                //그래서 id는 Hashable해야함! 아니면 이상한 상황을 맞이하게 될것이야
//                //내부적으로 Hashable하게 판단하기 위해서 UUID id를 사용하고, 쓸 수 있음
//                HStack {
//                    Image(systemName: "person")
//                    Text("\(value.name) \(value.count)")
//                }
//            }
//        }
//    }
    
    
//    var body: some View {
//        VStack {
//            ForEach(0..<5) { index in
//                Text(category[index])
//            }
//       
//        }
//    }


#Preview {
    SearchView()
}
