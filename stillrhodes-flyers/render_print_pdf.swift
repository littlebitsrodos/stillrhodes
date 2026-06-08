import AppKit
import CoreGraphics

let root = URL(fileURLWithPath: "/Users/hermes/projects/stillrhodes-flyer")
let out = root.appendingPathComponent("print-assets")
let W: CGFloat = 420.0
let H: CGFloat = 595.0
let sx = W / 148.0
let sy = H / 210.0

func url(_ rel: String) -> URL { root.appendingPathComponent(rel) }
func yTop(_ y: CGFloat, _ h: CGFloat = 0) -> CGFloat { H - (y * sy) - h }
func mmRect(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat) -> CGRect { CGRect(x: x*sx, y: H - (y+h)*sy, width: w*sx, height: h*sy) }
func mmPoint(_ x: CGFloat, _ y: CGFloat) -> CGPoint { CGPoint(x: x*sx, y: H - y*sy) }
func color(_ hex: UInt32, _ alpha: CGFloat = 1) -> NSColor { NSColor(calibratedRed: CGFloat((hex>>16)&255)/255, green: CGFloat((hex>>8)&255)/255, blue: CGFloat(hex&255)/255, alpha: alpha) }
func fillRect(_ r: CGRect, _ c: NSColor) { c.setFill(); r.fill() }
func roundRect(_ r: CGRect, _ radius: CGFloat, _ c: NSColor) { c.setFill(); NSBezierPath(roundedRect: r, xRadius: radius, yRadius: radius).fill() }
func strokeLine(_ p1: CGPoint, _ p2: CGPoint, _ c: NSColor, _ width: CGFloat) { let p=NSBezierPath(); p.move(to:p1); p.line(to:p2); c.setStroke(); p.lineWidth=width; p.stroke() }
func drawText(_ s:String, x:CGFloat, yMM:CGFloat, size:CGFloat, fontName:String, color c:NSColor, weight:NSFont.Weight = .regular, align:NSTextAlignment = .left, tracking:CGFloat = 0, width:CGFloat = 1000) {
    let font = NSFont(name: fontName, size: size) ?? NSFont.systemFont(ofSize: size, weight: weight)
    let para=NSMutableParagraphStyle(); para.alignment=align
    let attrs:[NSAttributedString.Key:Any] = [.font:font,.foregroundColor:c,.paragraphStyle:para,.kern:tracking]
    let h = size * 1.45
    let rect = CGRect(x:x, y:yTop(yMM,h), width:width, height:h)
    (s as NSString).draw(in: rect, withAttributes: attrs)
}
func drawImageMeet(_ image:NSImage, page:CGRect) {
    let imgSize = image.size
    let sc = min(page.width/imgSize.width, page.height/imgSize.height)
    let w = imgSize.width*sc, h = imgSize.height*sc
    image.draw(in: CGRect(x:page.midX-w/2, y:page.midY-h/2, width:w, height:h), from:.zero, operation:.sourceOver, fraction:1)
}
func drawImageCover(_ image:NSImage, page:CGRect) {
    let imgSize = image.size
    let sc = max(page.width/imgSize.width, page.height/imgSize.height)
    let w = imgSize.width*sc, h = imgSize.height*sc
    image.draw(in: CGRect(x:page.midX-w/2, y:page.midY-h/2, width:w, height:h), from:.zero, operation:.sourceOver, fraction:1)
}
func drawImageFit(_ image:NSImage, rect:CGRect) { image.draw(in: rect, from:.zero, operation:.sourceOver, fraction:1) }

func makeContext(_ path: URL) -> CGContext { var media=CGRect(x:0,y:0,width:W,height:H); return CGContext(path as CFURL, mediaBox:&media, nil)! }
func beginPage(_ ctx:CGContext) { var media=CGRect(x:0,y:0,width:W,height:H); ctx.beginPDFPage([kCGPDFContextMediaBox as String: NSData(bytes:&media,length:MemoryLayout<CGRect>.size)] as CFDictionary); NSGraphicsContext.saveGraphicsState(); NSGraphicsContext.current = NSGraphicsContext(cgContext: ctx, flipped: false) }
func endPage(_ ctx:CGContext) { NSGraphicsContext.restoreGraphicsState(); ctx.endPDFPage() }

func drawFront(_ ctx:CGContext) {
    beginPage(ctx)
    let page=CGRect(x:0,y:0,width:W,height:H)
    fillRect(page, color(0x0b242a))
    if let img=NSImage(contentsOf:url("assets/user-new-lotus-preview/new-lotus-2-portrait.jpeg")) { drawImageCover(img, page:page) }
    // Keep the top clean; darken only the lower text area for readability.
    fillRect(page, color(0x061316,0.08))
    fillRect(CGRect(x:0, y:0, width:W, height:228), color(0x031013,0.58))
    drawText("STILL RHODES · MEDITATION", x:9*sx, yMM:10, size:9.2, fontName:"Avenir Next", color:.white.withAlphaComponent(0.88), tracking:3.1, width:340)
    drawText("a quiet moment for", x:0, yMM:145, size:31.8, fontName:"Georgia", color:.white, align:.center, width:W)
    drawText("your mind during", x:0, yMM:158, size:31.8, fontName:"Georgia", color:.white, align:.center, width:W)
    drawText("your stay", x:0, yMM:171, size:31.8, fontName:"Georgia", color:.white, align:.center, width:W)
    drawText("stillrhodes.com", x:9*sx, yMM:198, size:10, fontName:"Avenir Next", color:.white.withAlphaComponent(0.92), width:180)
    drawText("Rhodes · Faliraki · Old Town", x:W-230, yMM:198, size:10, fontName:"Avenir Next", color:.white.withAlphaComponent(0.92), align:.right, width:205)
    endPage(ctx)
}

func drawBack(_ ctx:CGContext) {
    beginPage(ctx)
    let page=CGRect(x:0,y:0,width:W,height:H)
    NSGradient(colors:[color(0xf1e4c9),color(0xfff9ed)])?.draw(in:page, angle:90)
    roundRect(mmRect(8,8,42,8),12,.white.withAlphaComponent(0.65))
    drawText("BOOK YOUR SESSION", x:12*sx, yMM:9.8, size:8, fontName:"Avenir Next", color:color(0x2e7276), weight:.bold, tracking:2, width:180)
    drawText("Meditation", x:8*sx, yMM:34, size:51, fontName:"Georgia", color:color(0x123840), width:390)
    drawText("in Rhodes", x:8*sx, yMM:50, size:51, fontName:"Georgia", color:color(0x123840), width:390)
    drawText("A quiet one-hour experience during your stay.", x:8*sx, yMM:67, size:13.6, fontName:"Avenir Next", color:color(0x385056), weight:.bold, width:370)
    strokeLine(mmPoint(8,82), mmPoint(118,82), color(0xc8a44d), 2)
    drawText("A simple guided technique to focus your attention,", x:8*sx, yMM:88, size:11.7, fontName:"Avenir Next", color:color(0x354a4f), width:370)
    drawText("calm your mind, and discover who you are.", x:8*sx, yMM:95, size:11.7, fontName:"Avenir Next", color:color(0x354a4f), width:370)
    roundRect(mmRect(8,106,62,25),11,color(0xfffdf7,0.86)); drawText("GROUP SESSION", x:12*sx, yMM:112, size:7.7, fontName:"Avenir Next", color:color(0x2e7276), weight:.bold, tracking:1.3, width:160); drawText("60 minutes", x:12*sx, yMM:119, size:11.6, fontName:"Avenir Next", color:color(0x142f35), width:160); drawText("€10 · Rhodes / Faliraki", x:12*sx, yMM:126, size:10.6, fontName:"Avenir Next", color:color(0x142f35), width:170)
    roundRect(mmRect(77,106,62,25),11,color(0xfffdf7,0.86)); drawText("PRIVATE SESSION", x:81*sx, yMM:112, size:7.7, fontName:"Avenir Next", color:color(0x2e7276), weight:.bold, tracking:1.3, width:170); drawText("Upon arrangement", x:81*sx, yMM:121, size:12, fontName:"Avenir Next", color:color(0x142f35), width:170)
    roundRect(mmRect(8,149,132,38),16,color(0x123840)); drawText("BOOK ON WHATSAPP", x:14*sx, yMM:156, size:9.1, fontName:"Avenir Next", color:color(0xe5bd5b), weight:.bold, tracking:1.7, width:210); drawText("Scan to message Giorgos and reserve", x:14*sx, yMM:166, size:12, fontName:"Avenir Next", color:.white, width:250); drawText("your meditation session.", x:14*sx, yMM:173, size:12, fontName:"Avenir Next", color:.white, width:250)
    roundRect(mmRect(107,154,28,28),8,.white); if let qr=NSImage(contentsOf:url("assets/whatsapp-qr.png")) { drawImageFit(qr, rect:mmRect(109,156,24,24)) }
    // footer shapes in bottom area
    let footerTop = mmPoint(0,184).y
    let p=NSBezierPath(); p.move(to:CGPoint(x:0,y:0)); p.line(to:CGPoint(x:W,y:0)); p.line(to:CGPoint(x:W,y:footerTop)); p.curve(to:CGPoint(x:0,y:mmPoint(0,186).y), controlPoint1:CGPoint(x:320,y:mmPoint(0,176).y), controlPoint2:CGPoint(x:160,y:mmPoint(0,195).y)); p.close(); color(0x123840).setFill(); p.fill()
    let p2=NSBezierPath(); p2.move(to:CGPoint(x:0,y:0)); p2.line(to:CGPoint(x:0,y:mmPoint(0,187).y)); p2.curve(to:CGPoint(x:106*sx,y:0), controlPoint1:CGPoint(x:50,y:mmPoint(0,178).y), controlPoint2:CGPoint(x:130,y:mmPoint(0,188).y)); p2.close(); color(0x2e7276,0.78).setFill(); p2.fill()
    drawText("stillrhodes.com", x:8*sx, yMM:200, size:9.1, fontName:"Avenir Next", color:.white, width:150)
    if let cert=NSImage(contentsOf:url("assets/yoga-alliance-international-certification.jpeg")) { drawImageFit(cert, rect:mmRect(42,195,8.5,8.5)) }
    drawText("Yoga Alliance", x:52*sx, yMM:196.5, size:6.2, fontName:"Avenir Next", color:.white, weight:.bold, width:100)
    drawText("International", x:52*sx, yMM:200, size:6.2, fontName:"Avenir Next", color:.white, weight:.bold, width:100)
    drawText("+30 694 613 8241", x:W-155, yMM:200, size:9.1, fontName:"Avenir Next", color:.white, align:.right, width:130)
    endPage(ctx)
}

func makePDF(_ path:URL, pages:[String]) { let ctx=makeContext(path); for p in pages { if p=="front" { drawFront(ctx) } else { drawBack(ctx) } }; ctx.closePDF() }
try? FileManager.default.createDirectory(at:out, withIntermediateDirectories:true)
makePDF(out.appendingPathComponent("stillrhodes-front-a5-print.pdf"), pages:["front"])
makePDF(out.appendingPathComponent("stillrhodes-back-a5-print.pdf"), pages:["back"])
makePDF(root.appendingPathComponent("stillrhodes-a5-front-back-print.pdf"), pages:["front","back"])
let rendered=root.appendingPathComponent("stillrhodes-a5-double-sided-rendered.pdf"); try? FileManager.default.removeItem(at:rendered); try? FileManager.default.copyItem(at:root.appendingPathComponent("stillrhodes-a5-front-back-print.pdf"), to:rendered)
print(root.appendingPathComponent("stillrhodes-a5-front-back-print.pdf").path)
