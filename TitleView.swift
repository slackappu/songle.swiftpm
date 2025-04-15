import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack{
            Text("Songle")
                .font(.largeTitle)
            Spacer()
        }
        NavigationStack{
            NavigationLink("Go to guess view", destination: GuessView())
        }
    }
}
