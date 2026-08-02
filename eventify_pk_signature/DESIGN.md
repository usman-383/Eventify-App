---
name: Eventify PK Signature
colors:
  surface: '#0b1326'
  surface-dim: '#0b1326'
  surface-bright: '#31394d'
  surface-container-lowest: '#060e20'
  surface-container-low: '#131b2e'
  surface-container: '#171f33'
  surface-container-high: '#222a3d'
  surface-container-highest: '#2d3449'
  on-surface: '#dae2fd'
  on-surface-variant: '#c7c4d7'
  inverse-surface: '#dae2fd'
  inverse-on-surface: '#283044'
  outline: '#908fa0'
  outline-variant: '#464554'
  surface-tint: '#c0c1ff'
  primary: '#c0c1ff'
  on-primary: '#1000a9'
  primary-container: '#8083ff'
  on-primary-container: '#0d0096'
  inverse-primary: '#494bd6'
  secondary: '#ddb7ff'
  on-secondary: '#490080'
  secondary-container: '#6f00be'
  on-secondary-container: '#d6a9ff'
  tertiary: '#c4c7c9'
  on-tertiary: '#2d3133'
  tertiary-container: '#8e9193'
  on-tertiary-container: '#272a2c'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#e1e0ff'
  primary-fixed-dim: '#c0c1ff'
  on-primary-fixed: '#07006c'
  on-primary-fixed-variant: '#2f2ebe'
  secondary-fixed: '#f0dbff'
  secondary-fixed-dim: '#ddb7ff'
  on-secondary-fixed: '#2c0051'
  on-secondary-fixed-variant: '#6900b3'
  tertiary-fixed: '#e0e3e5'
  tertiary-fixed-dim: '#c4c7c9'
  on-tertiary-fixed: '#191c1e'
  on-tertiary-fixed-variant: '#444749'
  background: '#0b1326'
  on-background: '#dae2fd'
  surface-variant: '#2d3449'
  electric-indigo: '#6366F1'
  vibrant-purple: '#A855F7'
  surface-dark: '#0F172A'
  glass-stroke: rgba(255, 255, 255, 0.12)
  glass-fill: rgba(15, 23, 42, 0.7)
typography:
  display-xl:
    fontFamily: Plus Jakarta Sans
    fontSize: 48px
    fontWeight: '800'
    lineHeight: 56px
    letterSpacing: -0.02em
  display-xl-mobile:
    fontFamily: Plus Jakarta Sans
    fontSize: 36px
    fontWeight: '800'
    lineHeight: 44px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Plus Jakarta Sans
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
  headline-md:
    fontFamily: Plus Jakarta Sans
    fontSize: 24px
    fontWeight: '700'
    lineHeight: 32px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-bold:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.05em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  container-max: 1280px
  gutter: 24px
  margin-mobile: 20px
  margin-desktop: 64px
  stack-sm: 8px
  stack-md: 16px
  stack-lg: 32px
---

## Brand & Style

The design system is crafted for a high-end, event-centric experience tailored to Pakistan's trend-conscious Gen Z. It occupies the intersection of **Immersive Entertainment** (Spotify-inspired) and **Luxury Hospitality** (Airbnb-inspired). The aesthetic is "Cinematic Minimalism"—utilizing vast white space or deep dark voids to make high-resolution event photography the focal point.

The visual narrative is driven by **Glassmorphism** and **Vibrant Gradients**, creating a sense of depth and digital premiumness. Interfaces should feel like a polished glass lens over a world of vibrant experiences. The tone is energetic, exclusive, and technologically forward, positioning the platform as the definitive portal for high-end local events.

## Colors

The palette is anchored by a high-energy gradient of **Electric Indigo** and **Vibrant Purple**. This duo provides a youthful, digital-first "glow" against the deep **Surface Dark** background. 

- **Primary & Secondary:** Used for high-action items, active states, and as a brand gradient (Linear: 135deg).
- **Backgrounds:** Primarily uses `#0F172A` (from the reference) to maintain a premium dark mode that mimics a theater or concert hall environment.
- **Glass Elements:** Defined by semi-transparent fills and subtle light-reflecting strokes to simulate depth without clutter.

## Typography

This design system uses a dual-font strategy to balance character with utility. 

- **Plus Jakarta Sans** is the display face. Its wide apertures and modern geometric shapes provide a welcoming yet sophisticated "startup" feel. Use it for all headlines and oversized display text to create a cinematic impact.
- **Inter** is the functional workhorse. Chosen for its exceptional legibility at small sizes, it handles all body copy, metadata, and form labels.

Hierarchy is enforced through tight letter spacing in headlines and generous line heights in body copy to ensure readability against dark, high-contrast backgrounds.

## Layout & Spacing

The layout follows a **Fluid Grid** model with significantly wider margins than standard applications to emulate the airy feel of Airbnb. 

- **Desktop:** A 12-column grid with 64px outside margins to frame content like a gallery piece.
- **Mobile:** A 4-column grid with 20px margins, prioritizing full-bleed imagery for event cards.
- **Rhythm:** An 8px linear scale is used for all internal component spacing (padding, gaps).
- **Whitespace:** Emphasize "Vertical Breathing Room"—use `stack-lg` (32px) or larger between distinct content sections to maintain a premium, uncrowded aesthetic.

## Elevation & Depth

Depth in this design system is achieved through **optical transparency** rather than traditional heavy shadows.

- **Surface Layers:** The base layer is the solid neutral-dark. Elevated surfaces (cards, modals) use a slightly lighter tint or a glassmorphic blur.
- **Glassmorphism:** Use `backdrop-filter: blur(20px)` combined with a 10% white fill for navigation bars and overlays. This allows the vibrant event photography to peek through while maintaining text legibility.
- **Shadows:** Use "Ambient Glows" instead of black shadows. For primary buttons and active cards, use a soft, diffused shadow tinted with the primary purple (`#A855F7`) at 20% opacity.

## Shapes

The shape language is defined by "Luxurious Roundness." All primary containers, including event cards and modals, utilize a `16px` to `24px` corner radius (`rounded-lg` and `rounded-xl` respectively).

- **Standard Buttons:** Fully pill-shaped (32px+) to contrast against the semi-square cards.
- **Interactive Cards:** Use `24px` radius to feel soft and approachable.
- **Input Fields:** Use `12px` radius for a modern, refined look.

## Components

### Glassmorphic Bottom Navigation
The signature navigation element for mobile. It should be a floating "pill" or a full-width bar with a deep blur (`20px+`) and a subtle `1px` top border in `glass-stroke`. Icons should use a dual-tone style, glowing with the primary gradient when active.

### Event Cards
Cinematic focus. The image should cover the entire card background with a subtle dark-to-transparent gradient overlay at the bottom to ensure white typography remains readable. Use `rounded-xl` (24px) for the card container.

### Premium Buttons
- **Primary:** Linear gradient (`#6366F1` to `#A855F7`) with white text. High-gloss finish.
- **Secondary/Glass:** `glass-fill` with a `glass-stroke` border. Highly effective for "Save" or "Share" actions over imagery.

### Chips & Tags
Small, semi-transparent labels (e.g., "Music", "Tech", "Lahore") with a low-opacity background of the primary color and `label-bold` typography.

### Input Fields
Dark backgrounds with a subtle border that glows with the primary indigo color when focused. Use Inter for input text for maximum clarity.