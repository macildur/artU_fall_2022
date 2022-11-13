//
//  ModuleButtonStyle.swift
//  ArtU
//
//  Created by Eliza Hales on 11/4/22.
//

import SwiftUI

struct ModuleButtonStyle: ButtonStyle {    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack {
                VStack {
                    configuration.label
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundColor(Color.green)
                }
            }
            .padding()
            .foregroundColor(Color(red: 0.0, green: 100.0, blue: 1.0))
            .frame(width: 350, height: 120)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        }.padding(.bottom, 15)
    }
}
