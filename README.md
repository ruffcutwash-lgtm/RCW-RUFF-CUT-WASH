# RCW Lawn Care & Pressure / Soft Washing
**Responsive Website + Hero Video**

A fun, fully responsive single-page marketing website built for RCW based exactly on the provided banner design, now featuring the photorealistic dogs Daisy (Schnauzer, pressure washing) and Groot (French Bulldog, zero-turn mowing) from the latest reference photo.

## Features
- **Hero Video**: Custom photorealistic video with dogs (action style matching the original company banner scheme). Video autoplays muted in a loop with no voices or on-screen captions (voices and Test Voice button removed). Styled to match the light blue / water / large floating leaves aesthetic of the original banner designs provided.
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
│   │   ├── logo.jpg                            (legacy)
│   │   ├── logo.png                            (official RCW logo - from the latest user-provided image [this message], resized for web use, used in navbar/hero/footer)
│   │   ├── rcw-logo-new.png                    (high-res source of the current official logo)
│   │   ├── real-schnauzer.jpg
│   │   ├── real-frenchie.jpg
│   │   ├── real-team.jpg
│   │   ├── banner.jpg       (hero fallback poster - photoreal)
│   │   ├── lawn-before-after.jpg
│   │   ├── house-before-after.jpg
│   │   ├── house-front-cinematic-ref.png       (exact house used as setting for the new 3-part cinematic video)
│   │   ├── real-dogs-action-ref.jpg            (action reference with tools)
│   │   ├── real-dogs-better-portrait-ref.png   (primary reference - better real-life photo of Daisy & Groot for accurate faces, fur, expressions)
│   │   └── rcw-logo-clean.png                  (previous version)
│   └── videos/
│       ├── hero.mp4                  (12s photoreal funny mascot video using the exact dogs + zero-turn mower)
│       ├── cinematic-pt1-intro.mp4   (15s: Scenes 1-2 - Wide tracking Daisy walking the brick driveway with pressure washer + smooth pan to Groot on red mower)
│       ├── cinematic-pt2-handoff.mp4 (15s: Scenes 3-4 - Daisy's medium close-up hand-off + Groot's sunglasses nudge close-up with Google Earth line)
│       └── cinematic-pt3-finale.mp4  (15s: Scenes 5-6 - Side-by-side tracking, lower-third CTA text, elegant logo + phone reveal, synchronized paw-up, warm sign-off + fade to black)
│           (Uses exact user-provided logo image in finale; dogs from better real portrait photo; house from reference photo)
└── README.md
```

## Phone number
**239-406-1334** (prominently featured everywhere)

**LLC #L126000168235**

Built with Tailwind CSS (CDN) + vanilla JS. No build step required.

The pups approve. 🐶🚜💦
## Voices / TTS removed
Animated dog voices, ElevenLabs integration, on-screen speech captions, and the "🔊 Test Voice (ElevenLabs)" button have been fully removed from the live page (per request). The hero video now autoplays silently (muted loop). Backend TTS routes in server.js are still present but no longer called by the frontend.

## How to Run the Project (Important!)

This is a static website + optional Node backend (server.js at project root handles static serving; TTS routes exist but are no longer used by the frontend after voice removal).

**You can view the site by simply opening index.html** (static mode works fully for the new voice-free experience).

For the full local dev experience (if you want to re-enable voices later):
1. Make sure Node.js is installed.
2. (Optional) Put ELEVENLABS_API_KEY in .env
3. Run: node server.js (or double-click run.ps1 / run.bat)
4. Visit http://localhost:3000

The API routes (/api/tts etc.) are implemented inside server.js.

The API routes are implemented inside server.js (the entry point for the backend in this custom setup - not a subfolder like in Next.js or similar frameworks).

## New Cinematic "Ruff Cut & Wash" Video (2026)

A premium 3-part photorealistic cinematic video series (~45 seconds total when played sequentially) produced to the exact scene-by-scene script and visual references provided:

**Visual Style (applied to all parts):**
- Photorealistic, high-budget live-action movie look
- 35mm anamorphic lens, natural bright daylight, shallow DOF
- Exact suburban house from the provided house reference photo (light grey stucco, brown garage door, brick paver driveway, palm trees, landscaping)
- Real lifelike Daisy (Miniature Schnauzer, upright on hind legs with black/red pressure washer wand spraying water) and Groot (French Bulldog in black aviator sunglasses, upright on miniature red riding mower)
- Natural mouth movements for dialogue, fluid realistic animal animation

**Parts & Script Mapping:**
- **cinematic-pt1-intro.mp4** — Scene 1 (Daisy introduction on driveway, "Hi Mr. Parsons...") + Scene 2 (camera pan to Groot, "...and that’s my partner Groot...")
- **cinematic-pt2-handoff.mp4** — Scene 3 (Daisy points wand + "fixed price... keen eye on your lawn") + Scene 4 (Groot close-up, nudges sunglasses, "David, I think my quote will be pretty close just by looking at Google Earth...")
- **cinematic-pt3-finale.mp4** — Scene 5 (both side-by-side + lower third "Text below to schedule your visit.") + Scene 6 (logo + "239-406-1334" reveal, paw-up gesture, layered sign-off "Thank you for considering RCW, where we are Ruff on weeds and dirt, clean on your property!", slow fade to black)

**Intended Use:**
- Email/video quote follow-ups (references "attached quote", "Mr. Parsons"/"David")
- YouTube / social ads / landing page hero alternative
- High-end direct mail or personalized video prospecting

**How to use the clips:**
1. Play the three parts back-to-back in order (pt1 → pt2 → pt3) for the complete narrative.
2. Add voiceover audio (using ElevenLabs or any studio VO) to match the dogs' mouth movements in the clips.
3. For seamless single-file delivery, import the three clips into CapCut, DaVinci Resolve, Premiere, or iMovie and export as one 45s video. Add subtle cross-dissolves or hard cuts between parts to match the "clean cuts" direction.
4. The logo in pt3 matches the official RCW branding.

The videos were regenerated with the following fixes based on your feedback:
- PT1 INTRO: Schnauzer (Daisy) now has exactly four legs (two hind legs for upright walking, two front paws holding the wand). Strict anatomy fix, no extra limbs.
- PT2 HANDOFF: Schnauzer (Daisy) uses clear female voice and female lip sync/mouth movements for her lines (no boy's voice).
- PT3 FINALE: Uses the exact current official RCW logo (from the latest user-provided logo image in this message) for the reveal – centered, clean transparent background, no checkers. Number 239-406-1334 below it. The baked logo matches the site's logo.png.

Dogs' real appearance (fur, faces, ears, expressions) from real-dogs-better-portrait-ref.png. House and setting from house-front-cinematic-ref.png. Logo from the user-provided image (now the official logo.png).

Built with Tailwind CSS (CDN) + vanilla JS. No build step required.

The pups approve. 🐶🚜💦
