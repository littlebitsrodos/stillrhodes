import AppKit

let root = URL(fileURLWithPath: "/Users/hermes/projects/stillrhodes-flyer")
let input = root.appendingPathComponent("print-assets/pdf-check/page-1.jpg")
let output = root.appendingPathComponent("print-assets/stillrhodes-front-bottom-overlay-phone-preview.jpg")
let canvas = CGSize(width: 1800, height: 1800)
let bg = NSColor(calibratedWhite: 0.92, alpha: 1)

guard let image = NSImage(contentsOf: input) else { fatalError("Missing input image") }
let targetH: CGFloat = 1680
let targetW = targetH * (image.size.width / image.size.height)
let rect = CGRect(x: (canvas.width - targetW) / 2, y: (canvas.height - targetH) / 2, width: targetW, height: targetH)

let out = NSImage(size: canvas)
out.lockFocus()
bg.setFill()
CGRect(origin: .zero, size: canvas).fill()
NSColor(calibratedWhite: 0, alpha: 0.18).setFill()
NSBezierPath(roundedRect: rect.insetBy(dx: -10, dy: -10), xRadius: 18, yRadius: 18).fill()
image.draw(in: rect, from: .zero, operation: .sourceOver, fraction: 1)
out.unlockFocus()

guard let tiff = out.tiffRepresentation,
      let rep = NSBitmapImageRep(data: tiff),
      let jpg = rep.representation(using: .jpeg, properties: [.compressionFactor: 0.92]) else { fatalError("Render failed") }
try jpg.write(to: output)
print(output.path)
