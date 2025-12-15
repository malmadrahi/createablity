//
////  Created by Corey Johnson on 12/1/25.
//

import SwiftUI

enum Section: Hashable {
    case home, commitment, calendar, journal, selfCare, rewind
}

struct ContentView: View {
    @State private var selection: Section = .home
    @Environment(\.dismiss) private var dismiss
    @State private var zodiacSign: String = ""
    @State private var userName: String = ""

    var body: some View {
        NavigationStack {
            ZStack {
               
                
                // Background galaxy with overlays
              GeometryReader { geo in
                    Image("galaxy")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                        .overlay(Color.black.opacity(0.55))
                        .overlay(
                            LinearGradient(
                                colors: [
                                    .purple.opacity(0.25),
                                    .black.opacity(0.7)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .ignoresSafeArea()
                }
                .ignoresSafeArea()

              

                // Foreground content
                GeometryReader { geometry in
                    ScrollView {
                        VStack(alignment: .leading, spacing: 8) {
                            Spacer(minLength: 0)

                            // Title
                           // Text("Settings")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [Color.white, Color.purple],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                    )
                            

                            // User name search field
                            // Checkerboard overlay
                            HStack {
                                Spacer ()
                            }
                            Image("checker board")
                                .font(.system(size: 28))
                                .scaledToFill()
                                .ignoresSafeArea()
                            Text("Name")
                                .font(.system(size:28))
                                .foregroundStyle(.white.opacity(0.9))
                                .padding(.top, 4)
                            
                            

                            HStack(spacing: 8) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundStyle(.green.opacity(0.8))
                                TextField("Name", text: $userName)
                                    .textInputAutocapitalization(.words)
                                    .autocorrectionDisabled(true)
                                    .foregroundStyle(.purple)
                                    .submitLabel(.done)
                                if !userName.isEmpty {
                                    Button {
                                        userName = ""
                                    } label: {
                                        Image(systemName: "magnifyingglass")
                                            .foregroundStyle(.white.opacity(0.6))
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(12)
                            .background(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .fill(.white.opacity(0.12))
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(.white.opacity(0.25), lineWidth: 1)
                            )
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 12)
                            
                            

                            // Zodiac sign
                            Text("What's your zodiac?")
                                .font(.headline)
                                .foregroundStyle(.blue.opacity(0.9))

                            TextField("Find", text: $zodiacSign)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .padding(12)
                                .background(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(.white.opacity(0.12))
                                    
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .stroke(.white.opacity(0.25), lineWidth: 2)
                                )
                            
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(.white)
                                .padding(.top, 14)

                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(minHeight: geometry.size.height * 0.75)
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                HStack(spacing: 25) {
                    Button {
                        selection = .home
                    } label: {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                                .font(.caption)
                                .opacity(0.9)
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(selection == .home ? .white : .white.opacity(0.9))

                    Button {
                        selection = .commitment
                    } label: {
                        VStack {
                            Image(systemName: "ring.dashed")
                            Text("Commitment")
                                .font(.caption)
                                .opacity(0.9)
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(selection == .commitment ? .white : .white.opacity(0.9))

                    Button {
                        selection = .calendar
                    } label: {
                        VStack {
                            Image(systemName: "calendar")
                            Text("Calendar")
                                .font(.caption)
                                .opacity(0.9)
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(selection == .calendar ? .white : .white.opacity(0.9))

                    Button {
                        selection = .journal
                    } label: {
                        VStack {
                            Image(systemName: "pencil.and.scribble")
                            Text("Journal")
                                .font(.caption)
                                .opacity(0.9)
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(selection == .journal ? .white : .white.opacity(0.9))

                    Button {
                        selection = .selfCare
                    } label: {
                        VStack {
                            Image(systemName: "person.fill")
                            Text("Self Care")
                                .font(.caption)
                                .opacity(0.9)
                        }
                    }
                    .buttonStyle(.plain)
                    .foregroundStyle(selection == .selfCare ? .white : .white.opacity(0.9))
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .background(.ultraThinMaterial)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        HStack(spacing: 1) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
