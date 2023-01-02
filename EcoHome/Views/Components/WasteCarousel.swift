//
//  WasteCarousel.swift
//  EcoHome
//
//  Created by Sam Davis Omekara  on 9/21/22.
//

import SwiftUI

struct WasteCarousel: View {
    var body: some View {
        SomeView()
    }
}

struct SomeView: View {
    
    @State var menu = 0
    @State var page = 0
    
    var body: some View{
 
            VStack{
                GeometryReader{g in

                Carousel(width: UIScreen.main.bounds.width, page: self.$page, height: 500)
                .frame(height: 300)
            
                }
                .frame(height: 300)
                
                PageControl(page: self.$page)
                    .padding(.top, 10)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.white)
                            .shadow(radius: 6)
                        VStack {
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 20)
                                Text("Schedule a pick-up")
                                    .font(.system(size: 25))
                                Spacer()
                            }
                            .padding(.leading)
                            Divider()
                            HStack {
                                Image(systemName: "exclamationmark.triangle")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 20)
                                Text("Report missed pick-up")
                                    .font(.system(size: 25))
                                Spacer()
                            }
                            .padding(.leading)
                            Divider()
                            HStack {
                                Image(systemName: "creditcard")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 20)
                                Text("Payment and invoice")
                                    .font(.system(size: 25))
                                Spacer()
                            }
                            .padding(.leading)


                          
                            
                        }

                    }
                    .padding(10)
                    
                }
                .frame(width: UIScreen.main.bounds.width, height: 180, alignment: .top)
                
            }
            .shadow(radius: 6)

    }
}

struct List: View {
    
    @Binding var page: Int
    var body: some View {
        HStack(spacing: 0){
            
            ForEach(data){i in

                Card(page: self.$page, level: Double(i.percentFull) ?? 0, width: UIScreen.main.bounds.width, data: i)
            }
            
        }
    }
}

struct Card: View {
    @Binding var page : Int
    @State var level: Double
    var width: CGFloat
    var data: Type
    
    var body: some View{
        
        VStack{
            
            VStack(alignment: .leading, spacing: 20){
                HStack(alignment: .top ,spacing: 10) {
                    Image(systemName: "leaf.circle.fill")
                        .foregroundColor(.green)
                    Text(self.data.name)
                        .font(.system(size: 22))
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                }
                
                
                HStack(spacing: 5){
                    Text(self.data.cName)
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
    
                    Text("\(self.data.percentFull)%")
                        .font(.system(size: 22))
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                    Text("full")
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                }
            
                Slider(value: $level, in: 0...100)
                    .accentColor(.green)
                    
                    
                
                Button(action: {}){
                    Text("Request Pickup")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.vertical, 10)
                        .padding(.horizontal, 90)
                }
                .disabled(self.data.percentFull != "100")
                .background(self.data.percentFull == "100" ?.teal : .gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 10)
                
                
                Text("Regular Pickup time is \(self.data.pickupDay)")
                
            
                
                // For Filling Empty Space ...
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 25)
            .background(.white)
            .cornerRadius(20)
            .padding(.top, 25)
            
        }
        .frame(width: self.width)
        

    }
}


struct PageControl: UIViewRepresentable {
    
    @Binding var page: Int
    
    func makeUIView(context: Context) ->  UIPageControl {
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .green
        view.pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.currentPage = page
        view.numberOfPages = data.count
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        DispatchQueue.main.async {
            print("In Update UI View: Page:", self.page)
            uiView.currentPage = self.page
        }
    }
}

struct Carousel : UIViewRepresentable {
    
    var width : CGFloat
    @Binding var page : Int
    var height : CGFloat
    
    func makeCoordinator() -> Coordinator {
        return Carousel.Coordinator(parent1: self)
    }
    
    func makeUIView(context: Context) -> some UIView {
        
        let total = width * CGFloat(data.count)
        let view = UIScrollView()
        view.isPagingEnabled = true
        // 1.0 For DIsabling Vertical Scroll
        view.contentSize = CGSize(width: total , height: 1.0)
        view.bounces = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delegate = context.coordinator
        
        let view1 = UIHostingController(rootView: List(page: self.$page))
        view1.view.frame = CGRect(x: 0, y: 0, width: total, height: 300)
        
        view1.view.backgroundColor = .clear
        
        view.addSubview(view1.view)
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate{
        
        var parent: Carousel
        init(parent1: Carousel) {
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            let page = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            print(page)
            self.parent.page = page
        }
    }
    
}

struct Type : Identifiable {
    var id: Int
    var name: String
    var cName: String
    var percentFull: String
    var pickupDay: String
    var image: String
    
}

var data = [
    Type(id: 0, name: "Compost Trash Level", cName:"Your Trash Can Level is", percentFull: "100", pickupDay:"Monday", image:"Bathroom1"),
    Type(id: 1, name: "Regular Trash Level", cName:"Your Trash Can Level is", percentFull: "45", pickupDay:"Monday", image:"Bathroom1"),
    Type(id: 2, name: "Recycle Trash Level", cName:"Your Trash Can Level is", percentFull: "50", pickupDay:"Monday", image:"Bathroom1"),

]


struct WasteCarousel_Previews: PreviewProvider {
    static var previews: some View {
        WasteCarousel()
    }
}
