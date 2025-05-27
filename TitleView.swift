import SwiftUI

struct TitleView: View {
    @State var showInstructions = false
    @StateObject var audioManager = AudioManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                
                //                VStack(spacing: 40) {
                //                    Spacer()
                //
                //                    Image("songle")
                //                    // .frame(width: 200, height: 170)
                //                    // .font(.system(size: 85, weight: .bold))
                //                    // .foregroundStyle(Color.black)
                //                    // .background(.black)
                //                    // .foregroundColor(.white)
                //                    // .cornerRadius(10)
                //                    // .shadow(color: .red, radius: 15, x: 0, y: 0)
                //
                //
                //                    //                    Text("Songle 🎵")
                //                    //                        .font(.custom("Futura", size: 45))
                //                    //                        .fontWeight(.heavy)
                //                    //                        .foregroundColor(.white)
                //                    //                        .shadow(color: .black.opacity(0.7), radius: 5, x: 2, y: 2)
                //                }
                Divider()
                    .background(Color.white.opacity(0.7))
                    .padding(.horizontal, 40)
                VStack //(alignment: .leading, spacing: 12)
                {
 
                    //            ZStack {
                    //                LinearGradient(
                    //                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                    //                    startPoint: .top,
                    //                    endPoint: .bottom
                    //                )
                    VStack(spacing: 15) {
                
                        Image("transongle")
                            .frame(width: 200, height: 170)
                            .shadow(color: .red, radius: 10, x: 0, y: 0)
                        
                    
                    Divider()
                    
                        Text("How to Play")
                            .font(.custom("Futura", size: 32))
                            .underline()
                        VStack(spacing: 10){
                            Text("• A snippet of a song will play 👂        ")
                            Text("• You have 6 tries to guess the song 🎶")
                            Text("• Try to guess as fast as you can! 💨")
                        }
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(.white.opacity(0.85))
                        .frame(maxWidth: 350, alignment: .leading)
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 1)
                        
                        Divider()
                            .background(Color.white.opacity(0.7))
                            .padding(.horizontal, 40)
                        
                 //       Spacer()
                        
                        NavigationLink(destination: GuessView()) {
                            Text("Start the game!")
                                .font(.custom("Futura", size: 38))
                                .fontWeight(.bold)
                                .frame(width: 300, height: 100)
                                .background(
                                    LinearGradient(
                                        colors: [Color.red, Color.blue],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(color: Color.purple.opacity(0.8), radius: 20, x: 0, y: 5)
                        }
                        .padding(.bottom, 50)
                        
                        Spacer(minLength: 40)
                    }
                    .padding()
                    .frame(width:350, alignment: .leading)
                    .opacity(0.75)
                    .font(.custom("Futura", size: 18))
                    Divider()
//                    Spacer()
//                    NavigationLink("Start the game!", destination: GuessView())
//                        .frame(width: 300, height: 100)
//                        .font(.custom("Futura", size: 38))
//                        .foregroundStyle(.white)
//                        .padding()
//                        .background(.blue)
//                        .cornerRadius(10)
//                        .shadow(color: .purple, radius: 22, x: 0, y: 0)
//                        .padding()
                    Spacer(minLength: 200)
                    Text("Created by: Alex V, Aryan P, Leo J, & David N")
                        .font(.custom("Futura", size: 16))
//                    Button {
//                        showInstructions.toggle()
//                    } label: {
//                                        Text("Instructions for Guess View")
//                                            .font(.title3)
//                                            .foregroundStyle(.white)
//                                            .padding()
//                                            .background(.red)
//                                            .cornerRadius(10)
//                                            .shadow(color: .orange, radius: 5)
//                                    }
//                                    .padding(.top, 20)
//                                    .alert(isPresented: $showInstructions) {
//                                        Alert(
//                                            title: Text("Guess View Instructions"),
//                                            message: Text("• You have 6 tries to guess the correct song. 🎶\n\n• If you get it wrong, the song will play again. 👂\n\n• If you don't guess the correct song within 6 tries, the title will be revealed. 🎧"),
//                                            dismissButton: .default(Text("Got it!"))
//                                        )
//                        
//                    }
                }
            }
        }
    }
}
