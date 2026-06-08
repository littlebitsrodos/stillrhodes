from pathlib import Path
import struct, subprocess
root = Path(__file__).resolve().parent
outdir = root / 'print-assets'
outdir.mkdir(exist_ok=True)

front_svg = '''<svg xmlns="http://www.w3.org/2000/svg" width="148mm" height="210mm" viewBox="0 0 148 210">
  <defs>
    <linearGradient id="bottomShade" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#031013" stop-opacity="0"/><stop offset="0.20" stop-color="#031013" stop-opacity="0.18"/><stop offset="0.58" stop-color="#031013" stop-opacity="0.68"/><stop offset="1" stop-color="#031013" stop-opacity="0.92"/></linearGradient>
    <radialGradient id="soft" cx="50%" cy="35%" r="74%"><stop offset="0" stop-color="#d9f7ff" stop-opacity="0.05"/><stop offset="1" stop-color="#061316" stop-opacity="0.28"/></radialGradient>
  </defs>
  <rect width="148" height="210" fill="#0b242a"/>
  <image href="assets/user-new-lotus-preview/new-lotus-2-portrait.jpeg" x="0" y="0" width="148" height="210" preserveAspectRatio="xMidYMid slice"/>
  <rect width="148" height="210" fill="url(#soft)"/>
  <rect x="0" y="130" width="148" height="80" fill="url(#bottomShade)"/>
  <text x="9" y="13" font-family="Avenir Next, Helvetica, Arial" font-size="3.2" letter-spacing="1.1" fill="white" opacity="0.88">STILL RHODES · MEDITATION</text>
  <text x="74" y="149" text-anchor="middle" font-family="Georgia, Times, serif" font-size="11.2" fill="white">a quiet moment for</text>
  <text x="74" y="162" text-anchor="middle" font-family="Georgia, Times, serif" font-size="11.2" fill="white">your mind during</text>
  <text x="74" y="175" text-anchor="middle" font-family="Georgia, Times, serif" font-size="11.2" fill="white">your stay</text>
  <text x="9" y="201" font-family="Avenir Next, Helvetica, Arial" font-size="3.5" fill="white" opacity="0.92">stillrhodes.com</text>
  <text x="139" y="201" text-anchor="end" font-family="Avenir Next, Helvetica, Arial" font-size="3.5" fill="white" opacity="0.92">Rhodes · Faliraki · Old Town</text>
</svg>
'''

back_svg = '''<svg xmlns="http://www.w3.org/2000/svg" width="148mm" height="210mm" viewBox="0 0 148 210">
  <defs>
    <linearGradient id="paper" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#fff9ed"/><stop offset="1" stop-color="#f1e4c9"/></linearGradient>
    <radialGradient id="sun" cx="78%" cy="18%" r="45%"><stop offset="0" stop-color="#e5bd5b" stop-opacity="0.62"/><stop offset="0.55" stop-color="#e5bd5b" stop-opacity="0.18"/><stop offset="1" stop-color="#e5bd5b" stop-opacity="0"/></radialGradient>
  </defs>
  <rect width="148" height="210" fill="url(#paper)"/>
  <rect width="148" height="210" fill="url(#sun)"/>
  <ellipse cx="74" cy="217" rx="92" ry="55" fill="#123840"/>
  <ellipse cx="30" cy="216" rx="75" ry="42" fill="#2e7276" opacity="0.78"/>

  <g font-family="Avenir Next, Helvetica, Arial" fill="#142f35">
    <rect x="8" y="8" width="42" height="8" rx="4" fill="white" opacity="0.65"/>
    <text x="12" y="13.4" font-size="2.8" letter-spacing="0.8" font-weight="700" fill="#2e7276">BOOK YOUR SESSION</text>

    <text x="8" y="42" font-family="Georgia, Times, serif" font-size="18" fill="#123840">Meditation</text>
    <text x="8" y="58" font-family="Georgia, Times, serif" font-size="18" fill="#123840">in Rhodes</text>
    <text x="8" y="70" font-size="4.8" font-weight="700" fill="#385056">A quiet one-hour experience during your stay.</text>

    <line x1="8" y1="82" x2="118" y2="82" stroke="#c8a44d" stroke-width="0.7"/>
    <text x="8" y="91" font-size="4.1" fill="#354a4f">A simple guided technique to focus your attention,</text>
    <text x="8" y="97" font-size="4.1" fill="#354a4f">calm your mind, and discover who you are.</text>

    <g>
      <rect x="8" y="106" width="62" height="25" rx="4" fill="#fffdf7" opacity="0.86" stroke="white"/>
      <text x="12" y="115" font-size="2.7" letter-spacing="0.45" font-weight="700" fill="#2e7276">GROUP SESSION</text>
      <text x="12" y="123" font-size="4.1">60 minutes</text>
      <text x="12" y="128.5" font-size="3.75">€10 · Rhodes / Faliraki</text>
    </g>
    <g>
      <rect x="77" y="106" width="62" height="25" rx="4" fill="#fffdf7" opacity="0.86" stroke="white"/>
      <text x="81" y="115" font-size="2.7" letter-spacing="0.45" font-weight="700" fill="#2e7276">PRIVATE SESSION</text>
      <text x="81" y="125" font-size="4.2">Upon arrangement</text>
    </g>

    <g>
      <rect x="8" y="149" width="132" height="38" rx="7" fill="#123840"/>
      <text x="14" y="160" font-size="3.2" letter-spacing="0.65" font-weight="700" fill="#e5bd5b">BOOK ON WHATSAPP</text>
      <text x="14" y="170" font-size="4.25" fill="white">Scan to message Giorgos and reserve</text>
      <text x="14" y="176" font-size="4.25" fill="white">your meditation session.</text>
      <rect x="107" y="154" width="28" height="28" rx="3.5" fill="white"/>
      <image href="assets/whatsapp-qr.png" x="109" y="156" width="24" height="24" preserveAspectRatio="xMidYMid meet"/>
    </g>

    <text x="8" y="203" font-size="3.2" fill="white">stillrhodes.com</text>
    <image href="assets/yoga-alliance-international-certification.jpeg" x="42" y="195" width="8.5" height="8.5" preserveAspectRatio="xMidYMid slice"/>
    <text x="52" y="199" font-size="2.2" font-weight="700" fill="white">Yoga Alliance</text>
    <text x="52" y="202" font-size="2.2" font-weight="700" fill="white">International</text>
    <text x="140" y="203" text-anchor="end" font-size="3.2" fill="white">+30 694 613 8241</text>
  </g>
</svg>'''

(root/'print-front.svg').write_text(front_svg)
(root/'print-back.svg').write_text(back_svg)

# Render SVGs to PNG previews with macOS QuickLook, then convert to JPEG.
for name in ['print-front.svg', 'print-back.svg']:
    subprocess.run(['qlmanage','-t','-s','2480','-o',str(outdir),str(root/name)], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    png = outdir / f'{name}.png'
    jpg = outdir / f'{name}.jpg'
    subprocess.run(['sips','-s','format','jpeg',str(png),'--out',str(jpg)], check=True, stdout=subprocess.DEVNULL)

def jpg_size(path):
    data = Path(path).read_bytes(); i = 2
    while i < len(data)-9:
        if data[i] != 0xFF: i += 1; continue
        marker = data[i+1]; i += 2
        if marker in (0xD8,0xD9): continue
        L = struct.unpack('>H', data[i:i+2])[0]
        if 0xC0 <= marker <= 0xCF and marker not in (0xC4,0xC8,0xCC):
            h,w = struct.unpack('>HH', data[i+3:i+7]); return w,h,data
        i += L
    raise RuntimeError(path)

objs=[]
def add(b):
    if isinstance(b,str): b=b.encode('latin1')
    objs.append(b); return len(objs)
def stream(d,s): return add(f'<< {d} /Length {len(s)} >>\nstream\n'.encode('latin1') + s + b'\nendstream')
W,H = 419.53,595.28
contents=[]
img_ids=[]
for base in ['print-front.svg.jpg','print-back.svg.jpg']:
    p = outdir/base
    iw,ih,data = jpg_size(p)
    img_id = stream(f'/Type /XObject /Subtype /Image /Width {iw} /Height {ih} /ColorSpace /DeviceRGB /BitsPerComponent 8 /Filter /DCTDecode', data)
    img_ids.append(img_id)
    contents.append(stream('', f'q {W:.2f} 0 0 {H:.2f} 0 0 cm /Im Do Q'.encode('latin1')))
pages=[]
for img_id,cont_id in zip(img_ids,contents):
    res = f'<< /XObject << /Im {img_id} 0 R >> >>'
    pages.append(add(f'<< /Type /Page /Parent 0 0 R /MediaBox [0 0 {W:.2f} {H:.2f}] /Resources {res} /Contents {cont_id} 0 R >>'))
pages_id=add(f'<< /Type /Pages /Kids [{pages[0]} 0 R {pages[1]} 0 R] /Count 2 >>')
for p in pages:
    objs[p-1] = objs[p-1].replace(b'/Parent 0 0 R', f'/Parent {pages_id} 0 R'.encode())
cat=add(f'<< /Type /Catalog /Pages {pages_id} 0 R >>')
pdf=bytearray(b'%PDF-1.4\n%\xe2\xe3\xcf\xd3\n'); offsets=[0]
for i,o in enumerate(objs,1):
    offsets.append(len(pdf)); pdf += f'{i} 0 obj\n'.encode() + o + b'\nendobj\n'
xref=len(pdf); pdf += f'xref\n0 {len(objs)+1}\n0000000000 65535 f \n'.encode()
for off in offsets[1:]: pdf += f'{off:010d} 00000 n \n'.encode()
pdf += f'trailer << /Size {len(objs)+1} /Root {cat} 0 R >>\nstartxref\n{xref}\n%%EOF\n'.encode()
(root/'stillrhodes-a5-double-sided-rendered.pdf').write_bytes(pdf)
print(root/'stillrhodes-a5-double-sided-rendered.pdf')
