//
//  ReleaseTrackView.swift
//  Patched Sur - For Catalina
//
//  Created by Benjamin Sova on 10/16/20.
//

import VeliaUI

struct ReleaseTrackView: View {
    @Binding var track: ReleaseTrack
    @Binding var p: PSPage
    @State var hovered: String?
    
    var body: some View {
        VStack {
            Text("Set Update Track")
                .font(.system(size: 15)).bold()
            Text("Your update track defines what versions of macOS get. The Release track is the most stable, and probably what you're using already. Beta gives you access to new features of macOS early, but it's unstable at times.")
                .multilineTextAlignment(.center)
                .padding(.vertical)
            HStack {
                VIButton(id: "RELEASE", h: $hovered) {
                    Image("TriUpCircle\(track != .release ? "" : "Fill")")
                    Text("Release")
                        .fontWeight(track != .release ? .regular : .heavy)
                } onClick: {
                    track = .release
                }.inPad()
                .btColor(.gray)
                .useHoverAccent()
                VIButton(id: "BETA", h: $hovered) {
                    Image("AntCircle\(track != .developer ? "" : "Fill")")
                    Text("Beta")
                        .fontWeight(track != .developer ? .regular : .heavy)
                } onClick: {
                    track = .developer
                }.inPad()
                .btColor(.gray)
                .useHoverAccent()
            }.padding(.bottom)
            VIButton(id: "CONTINUE", h: $hovered) {
                Text("Continue")
                Image("ForwardArrowCircle")
            } onClick: {
                withAnimation {
                    p = .macOS
                }
            }.inPad()
        }
    }
}