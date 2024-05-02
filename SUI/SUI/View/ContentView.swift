//
//  ContentView.swift
//  SUI


import SwiftUI

struct ContentView: View {
    
    private enum Constants {
        static let colorName = "bacgroundColor"
        static let loadImageName = "load"
        static let arrowImageName = "arrow"
        static let alertTitle = "Поделиться?"
        static let actionButtonTitle = "ok"
        static let previousImageName = "previous"
        static let playImageName = "play"
        static let nextImageName = "next"
        static let stopImageName = "stop"
    }
    
    @State private var progress: Double = 0
    @State private var showACtionSheet = false
    @State private var isPlaySong = false
    @State private var showAlert = false
    @State private var currentTrackIndex = 1
    @State private var album = StorageSongs()
    
    @ObservedObject var viewModel = PlayerViewModel()
    
    var body: some View {
        ZStack {
            Color(Constants.colorName)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(album.songs[self.currentTrackIndex].photoName)
                    .cornerRadius(12)
                    .frame(width: 280, height: 280)
                    
                    
                HStack {
                    infoSingView
                    Spacer()
                    operationButtons
                }.padding()
                
               sliderView.padding()
                
                buttons
            }
        }
        
        
    }
    
    private var operationButtons: some View {
        HStack {
            Button {
                showACtionSheet = true
            } label: {
                Image(Constants.loadImageName)
            }.actionSheet(isPresented: $showACtionSheet) {
                ActionSheet(
                    title: Text("\(album.songs[self.currentTrackIndex].songName) сохранен в папку 'Загрузки'"),
                    buttons: [.default(Text(Constants.actionButtonTitle))]
                )
            }
            
            Button {
                showAlert = true
            } label: {
                Image(Constants.arrowImageName)
            }.alert(isPresented: $showAlert) {
                Alert(title: Text(Constants.alertTitle))
            }

        }
    }
    
    private var infoSingView: some View {
        HStack {
            Image(album.songs[self.currentTrackIndex].photoName)
                .frame(width: 60, height: 60)
                .cornerRadius(30)
                .aspectRatio(contentMode: .fill)
            VStack {
                Text(album.songs[self.currentTrackIndex].singerName)
                    .font(.system(size: 14, weight: .bold))
                Text(album.songs[self.currentTrackIndex].songName)
                    .font(.system(size: 14))
            }.foregroundColor(.white)
        }
    }
    
    private var buttons: some View {
        HStack {
            Button {
                if currentTrackIndex <= 0 {
                    currentTrackIndex = 3
                } else {
                    currentTrackIndex -= 1
                }
            } label: {
                Image(Constants.previousImageName)
            }.frame(width: 60, height: 60)
            
            Button {
                isPlaySong.toggle()
                isPlaySong ? self.viewModel.play(index: currentTrackIndex) : self.viewModel.stop()
            } label: {
                if isPlaySong {
                    Image(Constants.stopImageName)
                    
                } else {
                    Image(Constants.playImageName)
                }
            }.frame(width: 66.67, height: 66.67)
            
            Button {
                if currentTrackIndex < album.songs.count - 1 {
                    currentTrackIndex += 1
                    isPlaySong ? self.viewModel.play(index: currentTrackIndex) : self.viewModel.stop()
                } else {
                    currentTrackIndex = 0
                    isPlaySong ? self.viewModel.play(index: currentTrackIndex) : self.viewModel.stop()
                }
            } label: {
                Image(Constants.nextImageName)
            }.frame(width: 60, height: 60)
            
        }
    }
    
    
    private var sliderView: some View {
        HStack {
            Slider(value: Binding(get: {
                    self.progress
                }, set: {
                    newValue in
                    print(newValue)
                    self.progress = newValue
                    self.viewModel.setTime(value: newValue)
                }), in: 0...viewModel.maxDuration)
            Text(self.viewModel.time)
                .foregroundColor(.white)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
