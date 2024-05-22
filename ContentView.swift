import SwiftUI

struct ContentView: View {
    @State var arrowImage = "arrow.up"
    
    @State private var imageName = ""
    @State private var size:Double = 100
    @State private var enteredText = ""
    @State private var arrowNumber = 0
    @State private var alertPresented = false
    @State private var alertText:String = ""
    
    var body: some View {
        
        Group {
            Divider()
            Text("Events Challenge")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title)
            Divider()
        }
        
        NavigationView {
            VStack {
                NavigationLink("Change Your Disposition") { 
                    MVPView()
                }
                Spacer()
                
                
                Image(imageName)
                    .resizable()
                    .frame(width: size, height: size)
                //MARK: MVP
                    .onAppear {
                        if imageName == "SadFace"{
                            imageName = "HappyFace"
                        } else {
                            imageName = "SadFace"
                        }
                    }   
                
                    .onDisappear{
                        size += 50
                    }
                
                
                
                
                
                
                TextField("Enter HappyFace or SadFace", text: $enteredText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                //MARK: Stretch #1
                    .onSubmit {
                        size = 100
                        imageName = enteredText
                        enteredText = "100"
                    }
                
                
                
                
                
                
                Image(systemName: arrowImage)
                    .frame(width: 100, height: 100)
                    .font(.system(size: 100))
                //MARK: Stretch #2
                    .onTapGesture {
                    arrowNumber += 1
                        switch arrowNumber {
                        case 1:
                            arrowImage = "arrow.up"
                        case 2:
                            arrowImage = "arrow.right"
                        case 3:
                            arrowImage = "arrow.down"
                     default:
                            arrowImage = "arrow.left"
                            arrowNumber = 0
                        }
                    }
                
                
            }
            
        }
        .navigationViewStyle(.stack)
        
        Group {
            Divider()
            Image("MobileMakersEduNB")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
            //MARK: Stretch #3
//                .onLongPressGesture{
//                    alertPresented.toggle()
//                    
//                }
//                .alert("Size Desired", isPresented: $alertPresented){
//                    TextField("Enter Desired Size", value: $size = 100)
//                }
//            
//            
            
            
            
        }
        .padding()
    }
}


