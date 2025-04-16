import SwiftUI

struct GuessView: View {
    var body: some View {
        VStack {
            Image("Bristol")
                .resizable()
                .frame(width: 300, height: 300)
                .blur(radius: 20)
            Text("Song: Bristol")
            Text("Artist: Feng")
        }
    }
}

#Preview {
    GuessView()
}

