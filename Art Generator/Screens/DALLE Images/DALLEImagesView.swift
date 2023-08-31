//
//  ContentView.swift
//  Art Generator
//
//  Created by Alex Bussan on 8/31/23.
//

import SwiftUI

struct DALLEImagesView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if !vm.urls.isEmpty {
                    HStack {
                        ForEach(vm.dallEImages) { dalleImage in
                            if let uiImage = dalleImage.uiImage {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                            } else {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                        }
                    }
                }
                if !vm.fetching {
                    if vm.urls.isEmpty {
                        Text("The more descriptive you can be, the better")
                        TextField("Image Description...", text: $vm.prompt, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal)
                        Button("Fetch") {
                            vm.fetchImages()
                        }
                        .disabled(vm.prompt.isEmpty)
                        .buttonStyle(.borderedProminent)
                    } else {
                        Button("Try another") {
                            vm.clearProperties()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("Art Generator")
            // "Mechatronic cheetah making a fortune on wall street trading floor
        }
    }
}

struct DALLEImagesView_Previews: PreviewProvider {
    static var previews: some View {
        DALLEImagesView()
    }
}
