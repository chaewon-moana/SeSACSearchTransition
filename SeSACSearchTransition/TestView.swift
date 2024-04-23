//
//  TestView.swift
//  SeSACSearchTransition
//
//  Created by cho on 4/22/24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("terst")
                    .wrapToButton {
                        print("버어트능")
                    } //이렇게 사용해서 View에서 Button을 부를 필요가 없도록 만듦
                Image(systemName: "star")
                    .wrapToButton {
                        print("이미지이")
                    }
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100)
                    .wrapToButton {
                        print("roundRectangle")
                    }
            }
            .navigationTitle("fdfdf")
            .navigationBar {
                Text("메뉴")
                    .wrapToButton {
                        print("메뉴 눌림")
                    }
            } trailing: {
                Rectangle()
                    .clipShape(.capsule)
                    .wrapToButton {
                        print("랙탱글 눌림")
                    }
            }

        }
    }
}

#Preview {
    TestView()
}
