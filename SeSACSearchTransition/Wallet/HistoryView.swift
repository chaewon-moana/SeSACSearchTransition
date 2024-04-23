//
//  HistoryView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/23/24.
//

import SwiftUI

struct HistoryView: View {
    @State var money: [Money] = []
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack {
                            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                                bannerView()
                            }
                        }
                    }
                    .frame(height: 150)
                    LazyVStack {
                        ForEach(money) { value in
                            ItemView(item: value)
                        }
                    }
                }
            }
            .navigationTitle("Moana Wallet")
            .onAppear { //서버통신 많이 함
                money = dummy.shuffled()
            }
//            .task { //iOS15+ -> 추후에 사용해볼 예정
//
//            }
            .refreshable { //iOS15+
                money = dummy.shuffled()
            }
        }
    }
    
//    func rowView(_ item: Money) -> some View {
//        HStack {
//            VStack(alignment: .leading) {
//                Text(item.product)
//                    .fontWeight(.bold)
//                    .font(.body)
//                Text(item.category.rawValue)
//                    .font(.caption)
//                    .foregroundStyle(.gray)
//            }
//            Spacer()
//            Text(item.amountFormat)
//        }
//        .padding()
//    }
    
    func bannerView() -> some View {
        Rectangle()
            .fill(Color.random())
            .overlay(alignment: .leading) {
                Circle()
                    .fill(.white.opacity(0.2))
                    .scaleEffect(1.1) //현재 기준으로 얼마나 키워라!
                    .frame(width: 200, height: 300)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25.0)) //잘라주어서 옆에서 튀어나오는 것을 막아줌
            .frame(width: 300)
            .padding()
    }
}

struct ItemView: View {
    
    var item: Money
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.product)
                    .fontWeight(.bold)
                    .font(.body)
                Text(item.category.rawValue)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text(item.amountFormat)
        }
        .padding()
    }
}

#Preview {
    HistoryView()
}
