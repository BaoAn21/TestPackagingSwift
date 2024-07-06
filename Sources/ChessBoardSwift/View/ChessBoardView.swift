//
//  ChessBoardView.swift
//  ChessV2
//
//  Created by Trần Ân on 5/7/24.
//

import SwiftUI

@available(iOS 14.0, *)
struct ChessBoardView: View {
    @ObservedObject var chessBoardController: ChessBoardController = ChessBoardController()
    
    var body: some View {
        chessBoardView
    }
    
    @Namespace private var animatePiece
    
    var chessBoardView: some View {
        Grid(horizontalSpacing: 0, verticalSpacing: 0) {
            ForEach(0..<8) { row in
                GridRow {
                    ForEach((row*8)..<(row*8+8), id: \.self) { i in
                        ChessSquareView(
                            index: i,
                            piece: chessBoardController.pieces[i],
                            isRecentMoveFrom: i == chessBoardController.recentMoveFromIndex,
                            isRecentMoveTo: i == chessBoardController.recentMoveToIndex,
                            isPicked: chessBoardController.pieces[i]?.isPicked ?? false,
                            onTap: {
                                withAnimation(.easeInOut.speed(2)) {
                                    chessBoardController.choose(index: i)
                                }
                            }
                        )
                    }
                }
            }
        }
    }
}
