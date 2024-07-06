//
//  SwiftUIView.swift
//  
//
//  Created by Trần Ân on 6/7/24.
//

import SwiftUI

@available(iOS 14.0, *)
struct ChessSquareView: View {
    let index: Int
    let piece: Piece?
    let isRecentMoveFrom: Bool
    let isRecentMoveTo: Bool
    let isPicked: Bool
    let onTap: () -> Void
    @Namespace var animatePiece
    
    var squareColor: Color {
        if isRecentMoveFrom {
            return .orange
        } else if isRecentMoveTo {
            return .yellow
        } else {
            return .white
        }
    }
    
    @available(iOS 15.0, *)
    var body: some View {
        Rectangle().stroke()
            .overlay {
                if let piece = piece {
                    Image(piece.image)
                        .resizable()
                        .scaledToFit()
                        .zIndex(1)
                        .matchedGeometryEffect(id: piece.id, in: animatePiece)
                        .background(isPicked ? Color.brown : nil)
                }
            }
            .background(squareColor)
            .aspectRatio(1.0, contentMode: .fit)
            .onTapGesture {
                onTap()
            }
    }
}

