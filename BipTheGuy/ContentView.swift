//
//  ContentView.swift
//  BipTheGuy
//
//  Created by Dani Benet on 3/6/23.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var audioPlayer: AVAudioPlayer!
    @State private var animateImage = true
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("clown")
                .resizable()
                .scaledToFit()
                .scaleEffect(animateImage ? 1.0 : 0.9)
                .onTapGesture {
                    playSound(soundName: "punchSound")
                    animateImage = false // will immediately shring to 90% of it's size
                    
                    withAnimation (.spring(response: 0.3, dampingFraction: 0.3)) {
                        animateImage = true
                    }
                }
                
            
            Spacer()
            
            Button {
                // TODO: Button action here
            } label: {
                Label("Photo Library", systemImage: "photo.fill.on.rectangle.fill")
            }
            

        }
        .padding()
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
