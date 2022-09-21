//
//  ProfileAnimation.swift
//  AnimationSeries
//
//  Created by Kanishk Vijaywargiya on 21/09/22.
//

// Profile animation using matched geometry effect
import SwiftUI

struct ProfileAnimation: View {
    @State private var isProfileExpanded = false
    @Namespace private var profileAnimation
    @Namespace private var profileAvatar
    @Namespace private var profileName
    @Namespace private var profileTitle
    @Namespace private var profileBio
    
    var body: some View {
        VStack {
            if isProfileExpanded {
                expandedProfileView
            } else {
                collapsedProfileView
            }
            videoList
        }
    }
}

struct ProfileAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAnimation().preferredColorScheme(.dark)
    }
}

extension ProfileAnimation {
    private var collapsedProfileView: some View {
        HStack {
            profileImage
                .matchedGeometryEffect(id: profileAvatar, in: profileAnimation)
                .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text("Kanishk Vijaywargiya")
                    .font(.title.bold())
                    .matchedGeometryEffect(id: profileName, in: profileAnimation)
                
                Text("iOS Engineer")
                    .foregroundColor(.secondary)
                    .matchedGeometryEffect(id: profileTitle, in: profileAnimation)
            }
        }
    }
    
    private var expandedProfileView: some View {
        VStack {
            profileImage
                .matchedGeometryEffect(id: profileAvatar, in: profileAnimation)
                .frame(width: 130, height: 130)
            
            VStack {
                Text("Kanishk Vijaywargiya")
                    .font(.title.bold())
                    .matchedGeometryEffect(id: profileName, in: profileAnimation)
                
                Text("iOS Engineer")
                    .foregroundColor(.pink)
                    .matchedGeometryEffect(id: profileTitle, in: profileAnimation)
                
                Text("I went full time content creation in July 2019. I am focused on building my course business as well my app, Creator View.")
                    .matchedGeometryEffect(id: profileBio, in: profileAnimation)
                    .padding()
            }
        }.padding()
    }
    
    private var profileImage: some View {
        Image("img4")
            .resizable()
            .clipShape(Circle())
            .onTapGesture {
                withAnimation(.spring()) {
                    self.isProfileExpanded.toggle()
                }
            }
    }
    
    private var videoList: some View {
        List {
            ForEach(0...10, id: \.self) { _ in
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 180)
                        .foregroundColor(.gray.opacity(0.2))
                    
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(0.3)
                }.padding(.vertical)
            }.listRowSeparator(.hidden)
        }.listStyle(.plain)
    }
}
