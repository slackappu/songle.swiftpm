import SwiftUI

@main
struct MyApp: App {
    @State var showApp = false
    var body: some Scene {
        WindowGroup {
    //       if showApp {
                ContentView()
   //         } else {
//                Image("songle")
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                            showApp = true
//                        }
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
          //  }
        }
    }
}
