# RCW Lawn Care & Pressure / Soft Washing
**Responsive Website + Hero Video**

A fun, fully responsive single-page marketing website built for RCW based exactly on the provided banner design, now featuring the photorealistic dogs Daisy (Schnauzer, pressure washing) and Groot (French Bulldog, zero-turn mowing) from the latest reference photo.

## Features
- **Hero Video**: Custom 12-second photorealistic funny video with dogs exactly matching the color and appearance from real-team.jpg. On-screen captions (no computer-generated TTS) automatically display the dogs' spoken parts when the page loads (auto-start, no play button needed): Daisy: "Hello, welcome to Ruff Cut and Wash. I'm Daisy, your pressure washer specialist. This is my partner." Groot: "Hi, I'm Groot, your lawn care specialist." Then both: "We're the Ruff Crew!" (Daisy then Groot). American English phrasing. High-energy, comedic. Live-action style. Video autoplays (muted for reliability).
- **Exact brand match**: Navy blue + emerald green color scheme, floating leaves, water splash motifs, big prominent phone number, RCW logo treatment.
- **Fully responsive**: Beautiful on phones, tablets, and desktop. Mobile hamburger menu.
- **Interactive**:
  - Working "Get Free Quote" modal with form (simulated submission + fun water/grass confetti)
  - Clickable phone numbers (tel: links)
  - Video pause/play control
  - Smooth scrolling + easter eggs (press P or M)
- **Sections**: Hero, Services, Meet the Mascots, Before/After Gallery, Why RCW + stats, Testimonials, Final CTA, Footer.
- Both dogs now perfectly consistent: real-frenchie.jpg (Daisy) and real-schnauzer.jpg (Groot) (used in "THE REAL BOSSES" / Meet the Team cards) and banner.jpg exactly match the dogs' colors, fur, and appearance in real-team.jpg (used in "The dream team in action" gallery section) via image_edit on the reference team photo. Video aligned. Graphic RCW logo kept. Zero-turn mower.

## Pricing (as of latest update)
- Lawn Care & Mowing: starting at $45.00 (most popular)
- Pressure Washing: starting at $125.00
- Soft Washing: starting at $220.00
- Fertilization & Weed Control: starting at $65.00 / visit

Mascot names: Daisy (pressure washing Schnauzer), Groot (lawn care French Bulldog). In the hero video, on-screen captions (no TTS) automatically show their spoken parts on page load: Daisy's lines + Groot's lines + both saying "We're the Ruff Crew!". American English. Video autoplays with captions. No play button.

## How to view
Just open `index.html` in any modern browser (Chrome, Edge, Firefox, Safari).

```bash
# From the project folder:
start index.html     # Windows
# or
open index.html      # Mac
```

## Project structure
```
rcw-lawn-care/
├── index.html
├── assets/
│   ├── images/
│   │   ├── logo.jpg
│   │   ├── real-schnauzer.jpg
│   │   ├── real-frenchie.jpg
│   │   ├── real-team.jpg
│   │   ├── banner.jpg       (hero fallback poster - photoreal)
│   │   ├── lawn-before-after.jpg
│   │   └── house-before-after.jpg
│   └── videos/
│       └── hero.mp4         (12s photoreal funny mascot video using the exact dogs from the latest detailed attached image + zero-turn mower)
└── README.md
```

## Phone number
**239-406-1334** (prominently featured everywhere)

**LLC #L126000168235**

Built with Tailwind CSS (CDN) + vanilla JS. No build step required.

The pups approve. 🐶🚜💦
## ElevenLabs TTS for Mascot Dialogue (Daisy & Groot)

The hero video now features high-quality ElevenLabs voices for the dogs' spoken parts (no browser TTS).

### Setup (required for audio voices)
1. Get an ElevenLabs API key (free tier available at elevenlabs.io).
2. Set the environment variable before running the server:
   - PowerShell: $env:ELEVENLABS_API_KEY = 'your-key-here'
   - Or permanently via System Environment Variables.
3. Run the backend (serves the site + secure TTS proxy):
   `
   node server.js
   `
4. Open http://localhost:3000 (not the raw index.html file, or the /api/tts route won't work).

The server proxies to ElevenLabs securely — your key never leaves the server.

### How it works
- Timeline in JS triggers at specific video times.
- Fetches audio from /api/tts (POST {text, voiceId}).
- Plays the audio element over the video.
- Video volume ducks to 20% while any dog is speaking, restores to 100% when done.
- Preloads all clips on page load for timing accuracy.
- American voices: Rachel (Daisy - female) and Adam (Groot - male).
- Captions still appear as visual backup.
- Auto-starts when page loads (video + voices). No play button.

If the key is missing, the server returns an error and audio fetch will fail gracefully (captions still work).

### Voice IDs used
- Daisy: 21m00Tcm4TlvDq8ikWAM (Rachel)
- Groot: pNInz6obpgDQGcFmaJgB (Adam)

You can change them in the JS timeline if you have preferred ElevenLabs voices.
