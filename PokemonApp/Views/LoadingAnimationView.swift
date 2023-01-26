//
//  LoadingAnimationView.swift
//  PokemonApp
//
//  Created by Anton Aliokhna on 1/26/23.
//

import SwiftUI

struct LoadingAnimationView: View {

    @State private var shouldAnimate = false

    var body: some View {
        HStack {
            customCircle
                .animation(
                    .easeInOut(duration: 0.5).repeatForever(),
                    value: shouldAnimate
                )
            customCircle
                .animation(
                    .easeInOut(duration: 0.5).repeatForever().delay(0.3),
                    value: shouldAnimate
                )
            customCircle
                .animation(
                    .easeInOut(duration: 0.5).repeatForever().delay(0.6),
                    value: shouldAnimate
                )
        }
        .onAppear {
            self.shouldAnimate = true
        }
    }

    var customCircle: some View {
        Circle()
            .fill(.blue)
            .frame(width: 20, height: 20)
            .scaleEffect(shouldAnimate ? 1.0 : 0.5)
            .shadow(color: .cyan.opacity(0.5), radius: 10)
    }
}

struct LoadingAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingAnimationView()
    }
}
