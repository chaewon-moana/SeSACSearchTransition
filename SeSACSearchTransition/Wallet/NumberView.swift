//
//  NumberView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/23/24.
//
/*
 navigationView -> 언젠가 디프리케이트 됨
 navigationStack
 
 */
import SwiftUI

struct NumberView: View {
    let numberArray = [1,2,3,4,5,6,7]
    
    var body: some View {
        NavigationStack {
            List(numberArray, id: \.self) { number in
                NavigationLink(value: number) { //화면이동을 시켜주는 역할
                    Text("셀: \(number)")
                }
            }
            .navigationTitle("타이틀")
            .navigationDestination(for: Int.self) { result in //화면의 목적지를 담당!
                NumberDetailView(number: result)
            }
        }
    }
}

struct NumberDetailView: View {
    let number: Int
    var body: some View {
        Text("상세화면: \(number)")
    }
}

#Preview {
    NumberView()
}
//NavigationView {
//    List(numberArray, id: \.self) { value in
//        NavigationLink {
//            Text("\(value)")
//        } label: {
//            Text("\(value)")
//        }
//
//    }
//}
