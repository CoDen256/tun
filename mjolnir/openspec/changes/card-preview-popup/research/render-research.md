# How a study card face is rendered on the phone (read from the stock bundle)

Source: `mjolnir/base/smali.mjolnir.merged/assets/index.android.bundle` (6,003,611 bytes).
Offsets are byte offsets into that file. Module ids are Metro `__d(...,ID,[deps])` ids.
`patches/js/` patches NONE of the modules below (1441, 1406, 1252, 1243, 1244, 2131, 2124, 2008),
so the stock config is what the patched APK renders too.
**[R]** = read verbatim from the bundle. **[I]** = inferred (RN/Android/Yoga behaviour, not in the bundle).

---------------------------------------------------------------------------------------------------
## 0. TL;DR — what the old preview got wrong

| old preview (hub/src/cardPreview.js) | truth on device |
|---|---|
| `.center { font-weight:600 }` | `.center` asks for `fontFamily:'Poppins-SemiBold'`, but RNRH **throws that away**: `Poppins-SemiBold` is not in `systemFonts`. Result: `.center` = `textAlign:center` only. [R] |
| face-body `text-align:center` by default | default is **left/auto**. Centering comes only from `class="center"` (and `supWrap`'s justifyContent). [R] |
| `b { font-weight:700 }` + `font-family:Poppins` | `b` = `fontFamily:'Poppins-Bold'` (a separate TTF), **no fontWeight**, color headingAccent. The RNRH `b` element model has no UA bold. In a browser emulate with an `@font-face` for Poppins-Bold.ttf **and `font-weight:normal`**, or the browser fakes extra bold. [R] |
| card background `cardBackground` #FAFAFA | the study card View has **no backgroundColor**; you see the screen background (#fff light / #1B1D21 dark). [R] |
| `.sup` keeps the arial font | `div.sup` gets the `div` tagsStyle again → **Poppins-Regular**, then class → size normalize(11). Only the outer `supWrap` text is arial. [R] |
| browser line-height normal (1.5 for Poppins) | Android ≈ 1.4 em per line for Poppins (hhea 1050/-350, lineGap 100 ignored) plus includeFontPadding. [I] |
| trailing `<br>` is ignored (browser) | every `<br>` renders `"\n"` — a trailing one adds an empty line (enableExperimentalBRCollapsing is off). [R] |

---------------------------------------------------------------------------------------------------
## 1. Renderer and its props

**Library: react-native-render-html v6** (+ @native-html/transient-render-engine + @native-html/css-processor).
Evidence: module 1442 (@3465141) re-exports `RenderHTML, TRenderEngineProvider, defaultSystemFonts, useIMGElementStateWithCache, …`; prop-types at 3478662 list `systemFonts`, `fallbackFonts`, `dangerouslyDisableWhitespaceCollapsing`. The `useIMGElementStateWithCache` export puts it at ≥ 6.3 [I]; no version string is in the bundle.

**The card-face wrapper is module 1441** (starts @3462257). Verbatim (@3464301 onward):

```js
_e.default=function(e){var t=e.fontSize,s=e.content,F=e.overrideLinkColor,y=e.showLinkUnderline,
 h=(0,n.useWindowDimensions)().width,
 z=(0,o.useMemo)(function(){return{
   div:{color:r.default.getTheme().cardText,fontSize:(0,f.normalize)(t||16),fontFamily:l.Fonts.poppinsRegular},
   b:Object.assign({},n.Platform.select({ios:{fontFamily:l.Fonts.poppinsBold,fontWeight:'800',color:r.default.getTheme().headingAccent},
                                         android:{fontFamily:l.Fonts.poppinsBold,color:r.default.getTheme().headingAccent}})),
   i:{fontFamily:l.Fonts.poppinsRegular,fontStyle:'italic',textDecorationLine:'underline'},
   p:{marginTop:0,marginBottom:(0,f.normalize)(6)},
   a:{color:F||r.default.getTheme().headingAccent,textDecorationColor:F||…,textDecorationLine:y?'stroke':void 0}}},[t,F,y]);
 return(0,c.jsx)(i.default,{contentWidth:h,source:{html:s},enableExperimentalMarginCollapsing:!0,
   tagsStyles:z,defaultTextProps:{allowFontScaling:!1},classesStyles:u,systemFonts:p})}
```
Props passed: `contentWidth` = window width, `source.html`, `enableExperimentalMarginCollapsing: true`, `tagsStyles`, `classesStyles`, `defaultTextProps: {allowFontScaling:false}`, `systemFonts`.
NOT passed (library defaults apply): `baseStyle` → `{fontSize:14}`; `ignoredDomTags` → `[]`; `renderers`/`renderersProps` → none; `enableUserAgentStyles: true`; `enableCSSInlineProcessing: true`; `fallbackFonts` → `{sans-serif:'sans-serif', monospace:'monospace', serif:'serif'}` (@3479435); `enableExperimentalBRCollapsing` → false; `dangerouslyDisableWhitespaceCollapsing` → false.

**Where N/E/X go (study screen = module 2131, @5470590; mounted by the session screen 2124 @5446716 and 2139 @5508693).**
@5481214: `Nt=function(e){return(0,k.jsx)(y.default,{fontSize:V,content:e})}` (y = d[16] = 1441). Then:
`var e=Nt(w.N),t=Nt(w.E),n=Nt(w.X),r=w.A, … bt({first:e,second:t,third:n,cardLang:r,…})`.
Top face shows `first` (N) when the card's direction `language` is 'N' or 'A', else `second` (E); the middle face the other one; the bottom face is always X.
`fontSize` V = a session-local `useRef(15)` in 2124 (@5451332), adjustable ±1 within 10…22 (@5453808 `'inc'===e&&xe<22 … 'dec'===e&&xe>10`). Not persisted → **default 15**.

---------------------------------------------------------------------------------------------------
## 2. tagsStyles / classesStyles — resolved

### normalize() (module 1243 @3093706)
```js
f = min(window.width, window.height)          // short side, dp
e.normalize=function(t){var s=f/375,l=A?.7:1;return n.PixelRatio.roundToNearestPixel(t*s*l)}   // A = isTablet
```
normalize(x) = round(x · shortSide/375 · (tablet?0.7:1) · density) / density.
Phone examples (×factor): 360dp → ×0.960, 393dp → ×1.048, 411dp → ×1.096, 412dp → ×1.099.
Tablet = (density<2 and px side ≥1000) or (density==2 and px side ≥1824) (module 1244).

### Font names (module 1406 @3406974)
`Poppins-Regular, Poppins-Bold, Poppins-BoldItalic, Poppins-ExtraBold, Poppins-Black, Poppins-Medium, Poppins-SemiBold, Poppins-SemiBoldItalic, Poppins-Italic, arial`.

### systemFonts (1441 @3462939)
`[...defaultSystemFonts, 'Poppins-Regular','Poppins-Bold','Poppins-BoldItalic','Poppins-Italic','arial']`;
android defaultSystemFonts (module 1578 @3767517) = `['Roboto','notoserif','sans-serif-light','sans-serif-thin','sans-serif-medium']`.
**Poppins-SemiBold is NOT in the list.**

### Unsupported fontFamily is dropped [R]
`isFontSupported: function(s){return F[s]?F[s]:E[s]||!1}` (@3481629, F=fallbackFonts, E=set of systemFonts).
LongFontFamilyPropertyValidator (module 1485 @~3546182): `normalizeRawInlineCSSValue(t){… if(l)return …;} return null}` and `normalizeNativeValue(t){return this.normalizeInlineCSSValue(t)}` — used for tagsStyles/classesStyles too (`fillProp` @3533342 → `withProperty` @3530287 does `if(null!==o){…}` i.e. a null value is simply not set).
⇒ `.center{fontFamily:Poppins-SemiBold}` and `.tipOfTheDay{fontFamily:Poppins-SemiBold}` lose their fontFamily.

### Cascade order [R] (TStyles.buildStyles @3753671)
`merge(UA mixedUAStyles, UA dynamic styles, tagsStyles[tag], ...classesStyles[c] in class-attribute order, idsStyles[id], inline style)`.
Inheritable ("flow") text props (model `z={inheritable:!0,…display:'text'}` @3545253): color, fontFamily, fontSize, fontStyle, lineHeight, **textAlign** (@3539211), letterSpacing…; textDecorationLine is model T (not inheritable in TRE; RN nested Text still draws it for descendants of the same Text).
Consequence: every `<div>` re-applies its own tagsStyle (Poppins-Regular, cardText, normalize(fs)) and so **resets** any family/size/color inherited from an ancestor div's class. Spans/b inherit from their div.

### tagsStyles (Android), fs = 15 default
| tag | resolved |
|---|---|
| div | color cardText (light **#16215B**, dark **#FFFFFF**); fontSize normalize(15); fontFamily Poppins-Regular |
| b | fontFamily **Poppins-Bold** (file); **no fontWeight**; color headingAccent (light **#246BFD**, dark **#3F8CFF**) |
| i | Poppins-Regular + fontStyle italic (Android synthesises oblique [I]) + underline. (No `<i>` in stock cards.) |
| p | marginTop 0, marginBottom normalize(6) (overrides UA 1em/1em) |
| a | color/decorationColor headingAccent |
| span, br | no tagsStyle, no UA style |
UA styles in this RNRH build (module @3755234): `b` has **no** UA style (`b:…fromNativeModel({tagName:'b',category:'textual'})` @3765755); `div` none; `span` none; `p` margin 1em (overridden); `sup` tag textAlignVertical top + smaller (unused — cards use `div.sup`).

### classesStyles (verbatim @3463103–3464190, values resolved)
```
lg              fontSize normalize(28)
arialFont       fontFamily 'arial' (assets/fonts/arial.ttf), fontSize normalize(28)
arialFontNormal fontFamily 'arial', fontSize normalize(18)
italic          fontFamily Poppins-Italic (true italic file, weight 400)
boldItalic      fontFamily Poppins-BoldItalic
underline       textDecorationLine underline
green           theme.green          #5DD8D0 (both themes)
blue            theme.headingAccent  #246BFD / #3F8CFF   (frozen at module load, see note)
darkBlue        theme.headingGray    #16215B / #7C8296   (frozen at module load)
red             'red' = #FF0000
teal            #00A4BF
dodgerBlue      #0080ff
royalRed        #cc0066
blueViolet      #8030cf
burntOrange     #ff7733
flex            flexDirection row, alignItems center
width           width normalize(100)
center          textAlign center   [fontFamily Poppins-SemiBold DROPPED]
left            textAlign left
supWrap         flexDirection row, alignItems flex-start, justifyContent center, marginHorizontal normalize(4)
sup             fontSize normalize(11)
tipOfTheDay     color #fff, fontSize normalize(20)   [fontFamily Poppins-SemiBold DROPPED]
```
`bold` (used 1459× in stock cards) is **not defined** → no effect; `<b class="bold">` is styled purely by the `b` tag.
Note: `u` (classesStyles) is a module-level constant, so `blue`/`darkBlue` take the theme active when 1441 was first required; `tagsStyles` are re-computed per component (useMemo). Theme default is `Appearance.getColorScheme()||'dark'`, then `setType(settings.theme)` (1252 @3141033 tail). Neither `blue` nor `darkBlue` is used in stock cards.

Class usage in the 2790 stock cards (module 2113 @4405217): center 7542, italic 2303, left 1945, bold 1459, lg 186, arialFontNormal 104, arialFont 103, royalRed 95, dodgerBlue 94, boldItalic 54, green 41, sup 32, supWrap 28, red 24, blueViolet 22, teal 20, burntOrange 10, flex 3. Tags: div, br, span, p, b only (+1 typo `<di `). No inline `style=`. Some class attrs are unquoted (`class=royalRed`). 828 X faces are empty strings.

### Concrete answers
- Plain `<div>` text: **Poppins-Regular (400), normalize(15), cardText**, left-aligned.
- `<div class="center">text</div>`: same font — **regular, not semibold** — centered.
- `<b>`: Poppins-Bold glyphs (700 design weight), blue headingAccent; `<b class="bold green">` → green wins (class > tag).
- `<div class="arialFont supWrap">k<div class="sup">j</div>(:)</div>`: "k" and "(:)" are arial normalize(28); "j" is **Poppins-Regular** normalize(11) (div tagsStyle resets family; `.sup` only sets size), top-aligned.

---------------------------------------------------------------------------------------------------
## 3. Fonts

Files in `assets/fonts/`: Poppins-{Black,Bold,BoldItalic,ExtraBold,Italic,Light,Medium,Regular,SemiBold,SemiBoldItalic}.ttf, arial.ttf.
(SemiBold.ttf exists on disk but RNRH never passes it through for card HTML.)
Metrics (read from the TTFs): Poppins all weights: UPM 1000, hhea asc 1050 / desc −350 / lineGap 100, usWinAscent 1135 / usWinDescent 627; Regular bbox yMin −573 yMax 1065. arial: UPM 2048, hhea 1854/−434/67.
On Android RN, `fontFamily:'Poppins-Bold'` loads `assets/fonts/Poppins-Bold.ttf` directly; with no fontWeight there is no synthetic emboldening [I, RN ReactFontManager behaviour]. iOS adds fontWeight '800' — irrelevant here.
Why a browser looked bolder: (a) `.center` given 600 (device drops it); (b) `b{font-weight:700}` on a `Poppins`/system stack → browser may pick a real 700 face *or* faux-bold a regular one; on device it's the Bold file at normal weight; (c) if the browser lacks Poppins and falls back to system-ui, 600/700 render heavier. Recommendation: `@font-face{font-family:'Poppins-Regular';src:url(Poppins-Regular.ttf)}`, same for `Poppins-Bold`, `Poppins-Italic`, `Poppins-BoldItalic`, `arial`, each declared `font-weight:normal; font-style:normal`, and use those family names with `font-weight:normal; font-style:normal` everywhere (synthesis off: `font-synthesis:none`).

---------------------------------------------------------------------------------------------------
## 4. Layout semantics (RNRH v6 / TRE)

- Block vs inline: `div`, `p` are category `grouping` → block → rendered as RN `View` (column, alignItems stretch, so a block fills the face width). `span`, `b`, `i`, `br` are `textual` → nested RN `<Text>` inside one paragraph Text. [R models @3755234; rendering I]
- Mixed content in a block (`<p>..</p>text<br>text`): TRE hoists inline runs into anonymous paragraph blocks stacked vertically after the `p`. [I, library design]
- Whitespace: CSS-like collapsing, `whiteSpace:'normal'` default (module 1572 `baseStyle:{fontSize:14,whiteSpace:'normal'}`); collapser module 1538 (@~3578575): `[ \t]+`→' ', segment breaks→' ', trims collapsible spaces at block edges (`isCollapsibleLeft/Right`, @3577977). Whitespace-only text between blocks disappears. Stock cards contain no `\n`.
- `<br>` (renderer module 1631 @3799530) [R]:
  ```js
  w=x.enableExperimentalBRCollapsing&&(h?b&&!u:b);return p&&w?v(c):n.default.createElement(l.Text,s,w?'':'\n')
  ```
  BR collapsing is off ⇒ **every `<br>` → "\n"**, including a trailing one (extra blank line; a browser would not show it). No stock card ends a block with `<br>`, but user-authored ones may.
- Wrapping: text wraps at the face content width (Text inside a stretched View). `contentWidth` (window width) only matters for images.
- text-align: none by default (RN 'auto' = left for LTR). `class="center"` → center; inherited by spans and by nested **non-div** content; nested `div.left` resets to left.
- Margins: only `p` has one (bottom normalize(6)); div 0. `enableExperimentalMarginCollapsing` collapses adjacent sibling vertical margins [I: docs semantics]. The last `p`'s bottom margin remains.
- `supWrap` (flex row, alignItems flex-start, justify center, mx normalize(4)): children "k" (anonymous text), `div.sup`, "(:)" laid out side by side, each its own height, tops aligned → the small "j" sits at top-right of "k" like a superscript; the row is horizontally centered.
- `.flex` (row, alignItems center) on `div.center.flex` containing a long `div.left` (3 cards, e.g. B01047 X): RN row children default flexShrink 0, so long text can measure at max-content width and overflow/clip instead of wrapping [I — verify on device; it's a Yoga quirk].
- Vertical line metrics: no lineHeight is set anywhere → Android natural ≈ 1.4 em per Poppins line (asc+desc, lineGap ignored), arial ≈ 1.12 em; `includeFontPadding` (default true) adds ≈0.015 em on top of the first line and ≈0.22 em below the last line (bbox yMax/yMin) [I]. Browser emulation: `line-height:1.4` for Poppins blocks (≈1.12 for arial).

---------------------------------------------------------------------------------------------------
## 5. Card geometry (module 2131 styles, `A(mode,t)` @~5471900; render @5488651)

```
card:        width normalize(342), height t(=Xe), borderRadius normalize(20), alignItems center,
             borderWidth normalize(1), borderColor theme.borderColor, alignSelf center, overflow hidden.
             NO backgroundColor.
topicName:   headerText (Poppins-Regular, center) + color studyCardHeading, fontSize normalize(10.5),
             lineHeight normalize(16), textTransform uppercase   → shows card.D, e.g. "INTERMEDIATE PRONUNCIATION"
textWrap:    height .33*t (overridden per face), width 100%, justifyContent center, zIndex 9
textContent: justifyContent center, paddingHorizontal normalize(16), paddingBottom normalize(10)
```
Face stack (top→bottom), all children of the card:
1. topicName text.
2. **Top face**: TouchableOpacity `[textWrap, textContent, {height:.29*Xe, paddingVertical:normalize(8)}]` → top pad 8, bottom pad 10 (edge beats vertical in Yoga [I]); **not scrollable**, vertically centered.
3. divider: `textDivider{width:'60%',height:normalize(1),backgroundColor:borderColor}` (1406 @3409311; centered by card alignItems; color frozen at module load [I]).
4. **Middle face**: View `[textWrap,{height:.29*Xe,paddingVertical:normalize(8)}]` → ScrollView(flex 1, contentContainer justify center) → TouchableOpacity `[textContent,{minHeight:.29*Xe-normalize(16)}]`. Scrolls when long; centered when short.
5. divider.
6. **X face**: ScrollView `{height:.4*Xe, paddingVertical:normalize(8), width:'100%', marginVertical:normalize(8)}`, contentContainer `{flexGrow:1, justifyContent:'center'}` → TouchableOpacity textContent. Scrolls; centered when short.
The parts sum to .98·Xe + ≈normalize(50) > Xe, so the bottom of the X face is clipped by overflow:hidden by roughly normalize(50)−.02·Xe [I, arithmetic].

Content width of every face = normalize(342) − 2·normalize(1) − 2·normalize(16) ≈ normalize(308) (≈337.5dp on a 411dp phone; 295.7dp on 360dp).

Card height Xe (@5477969):
```
Be = max(normalize(260), windowH − insets.top − insets.bottom − normalize(185))   // before layout
Xe = He ? max(normalize(260), He − We) : Be     // He = measured screen-body height
We = Re + normalize(12) + max(insets.bottom, normalize(12))   // Re = button row height, initial normalize(92)
```

Audio icon (module 2008 @3982997): 36×36 box (normalize), `position:absolute; right:normalize(16); top:normalize(16)` for N, `+.29*Xe` for E, `+.58*Xe` for X — on the face that carries audio; icon = theme `volume` SVG 24×24.

Veil (covers unanswered faces): `vailBackground` (#fff / #363A47), borderRadius normalize(20), shadow, height .7·Xe−7 (two faces hidden) or .4·Xe−7, with `veilArrow` SVG.

Screen chrome:
- Screen 2124: SafeAreaView bg theme.background (#fff / #1B1D21). Header row = `header{width:100%,padding:normalize(16),row,center}` + justifyContent space-between: menu button left; three counters each = 16×16 icon (light-bulb "new", clock "learning", calendar "review") above a number in headerText (normalize 16/24, Poppins-Regular) color studyCardHeading.
- Below card (2131): `bottomContent{flex:1, justifyContent:flex-end, paddingHorizontal:normalize(18), paddingTop:normalize(12), paddingBottom:max(insetBottom,normalize(12))}` → row space-between of buttons **Wrong / Hard / Normal / Easy** (Wrong hidden when not applicable), each width 24%, maxWidth normalize(96), height normalize(76); inner box bg vailBackground, border normalize(1) borderColorSecondary (#DADFF2 / #363A47), radius normalize(18); title (smallText 12/16) + 32×32 icon + interval text (e.g. "10 mins", "1 day"), color headingLighter (#16215B / #F0F3F6). Buttons are opacity 0 until revealed.

### Theme tokens used (1252, light @3142325, dark @3146879)
| token | light | dark |
|---|---|---|
| background (screen) | #fff | #1B1D21 |
| cardText | #16215B | #fff |
| headingAccent (b, a, blue) | #246BFD | #3F8CFF |
| headingGray (darkBlue) | #16215B | #7C8296 |
| green | #5DD8D0 | #5DD8D0 |
| borderColor (card border, dividers) | #DADFF2 | #7C8296 |
| borderColorSecondary (buttons) | #DADFF2 | #363A47 |
| studyCardHeading (deck name, counters) | #ACB1C0 | #737B95 |
| vailBackground (veil, buttons) | #fff | #363A47 |
| headingLighter (button text) | #16215B | #F0F3F6 |
| cardBackground | #FAFAFA | (absent) — unused by the study card |

---------------------------------------------------------------------------------------------------
## 6. Other text props
`defaultTextProps:{allowFontScaling:false}` → the system font-size setting is ignored. No `selectable`, no `lineHeight`, no `letterSpacing`, no `includeFontPadding` override anywhere in tagsStyles/classesStyles.

---------------------------------------------------------------------------------------------------
## 7. Sample stock cards (module 2113; offset = start of the card object)

B01028 @4639511 — D "INTERMEDIATE PRONUNCIATION", A=E  (center, lg, b.bold, arialFont+supWrap+sup, left, arialFontNormal)
```html
N: <div class="center">Read out, focusing on the bold part(s):<br><span class="lg">s<b class="bold">k</b>rive, i<b class="bold">kk</b>e, fi<b class="bold">kk</b></span></div>
E: <div class="center"><div class="arialFont supWrap">k<div class="sup">j</div>(:)</div></div>
X: <div class="center"><div class="left">This is the soft [<span class="arialFontNormal"> k </span>], pronounced in the front part of the mouth, hence the superscript [<span class="arialFontNormal"> j </span>].<br>Short and long sound.</div></div>
```
Z01001 @4405256 — D "BASIC PRONUNCIATION", A=X  (green, italic, p, br)
```html
N: <div class="center">Does Norwegian have<br><b class="bold">long</b> and <b class="bold green">short</b> vowels?</div>
E: <div class="center"><div class="left">Yes. <b class="bold">Long</b> stressed vowels are <span class="italic">mostly</span> followed by <b class="bold">one consonant</b> or <b class="bold">no other letter</b>.<br><b class="bold green">Short</b> stressed vowels are <span class="italic">mostly</span> followed by <b class="bold green">two consonants</b>.</div></div>
X: <div class="center"><div class="left"><p>Listen to the examples below:</p> <p>l<b class="bold">e</b>ge / l<b class="bold green">e</b>gge<br>s<b class="bold">a</b>me / s<b class="bold green">a</b>mme<br>f<b class="bold">i</b>ne / f<b class="bold green">i</b>nne</p>The first word has the <b class="bold">long vowel</b>, whilst the second has the <b class="bold green">short vowel</b>.<br>Finally, unstressed vowels (e.g. the last vowels in the example words) are short.</div></div>
```
B12007 @5142542 — D "WORD ORDER & SYNTAX", A=E  (red, teal, blueViolet unquoted, p inside center)
```html
N: <div class="center"><p>Compare the Norwegian equivalent of:</p>It doesn't rain a lot in Bergen<br>In Bergen, it doesn't rain a lot</div>
E: <div class="center"><p><span class="red">Det</span> <span class="teal">regner</span> <span class=blueViolet>ikke</span> mye i Bergen</p>I Bergen <span class="teal">regner</span> <span class="red">det</span> <span class=blueViolet>ikke</span> mye</div>
X: <div class="center"><div class="left"><p>In Norwegian, when an adverb or prepositional expression is put first in a <b class="bold">negative</b> sentence, subject and verb get swapped and <span class="italic">ikke</span> goes after the subject.</p>See how <span class="italic">det regner ikke mye</span> becomes <span class="italic">regner det ikke mye</span> in the second sentence. </div></div>
```
B12006 @5141824 — A=E  (royalRed, burntOrange)
```html
N: <div class="center"><p>Compare the Norwegian equivalent of:</p>Bodil gave him that<br>Bodil gave that to Ove</div>
E: <div class="center"><p>Bodil ga <span class=royalRed>ham</span> <span class=burntOrange>den</span></p>Bodil ga <span class=burntOrange>den</span> <span class=royalRed>til Ove</span></div>
X: <div class="center"><div class="left"><p>Like in English, if the indirect object of the sentence (i.e. the answer to the "to what?/to whom?" question) is a pronoun, it tends to go first.</p>If a preposition such as <span class="italic">til</span> is used for the indirect object, then it will go after the direct object.</div></div>
```
C01004 @5235230 — D "ADVANCED PRONUNCIATION", A=X  (dodgerBlue/royalRed, longest X → scrolls)
```html
N: <div class="center">How can I learn when to produce <span class=dodgerBlue>tone 1</span> <br>and when to produce <span class=royalRed>tone 2</span>?</div>
E: <div class="center"><div class="left"><p>There is a helpful basic rule for <span class=royalRed>tone 2</span>.</p> Most words that have two syllables and end with -E (in writing) require <span class=royalRed>tone 2</span>. <p>See the examples below.</p></div></div>
X: <div class="center"><div class="left"><p>Verbs (except prepositional verbs):<br>(å) <span class=royalRed>²kas</span>te, <span class=royalRed>²del</span>te, <span class=royalRed>²byg</span>de, <span class=royalRed>²trod</span>de</p> <p>Nouns of all genders:<br>(en) <span class=royalRed>²ti</span>me, (ei) <span class=royalRed>²jen</span>te, (et) <span class=royalRed>²bil</span>de</p> <p>Adjectives in the definite/plural form:<br><span class=royalRed>²fi</span>ne, <span class=royalRed>²fri</span>e, <span class=royalRed>²la</span>ve, <span class=royalRed>²rø</span>de</p> <p>Other 2-syllable words:<br><span class=royalRed>²de</span>re, <span class=royalRed>²ba</span>re</p> We will mostly focus on the rules for <span class=royalRed>tone 2</span>, which means that, by subtraction, any other situation will require <span class=dodgerBlue>tone 1</span>.</div></div>
```
A03001 @4480716 — D "TOP 50 NOUNS", A=E  (boldItalic, boldItalic green)
```html
N: <div class="center">What are the two Norwegian <b class="bold">genders</b>?</div>
E: <div class="center"><div class="left"><p>There are two main genders (<span class="italic">kjønn</span>):</p><p><span class="italic">hankjønn:</span> <b class="boldItalic">en mann</b> (a man)</p><span class="italic">intetkjønn:</span> <b class="boldItalic green">et barn</b> (a child)</div></div>
X: <div class="center"><div class="left"><p><span class="italic">Hankjønn</span> (literally: "he-gender") nouns are masculine and they require the indefinite article <b class="boldItalic">en</b>.</p><span class="italic">Intetkjønn</span> (literally: "no-gender") nouns are neuter and they require the indefinite article <b class="boldItalic green">et</b>.</div></div>
```
B01047 @4650197 — A=E  (`center flex` row container)
```html
N: <div class="center">Read out, focusing on the bold part(s):<br><span class="lg">ful<b class="bold">g</b>te, sol<b class="bold">g</b>te</span></div>
E: <div class="center"><div class="arialFont supWrap">k<div class="sup">j</div>(:)</div></div>
X: <div class="center flex"><div class="left">The G in the GTE ending of certain <span class="italic">preteritum</span> forms is effectively pronounced as the soft K (i.e. K with superscript J).</div></div>
```
A01001 @4451205 — D "EVERYDAY LIFE", A=N (simplest shape)
```html
N: <div class="center">God morgen</div>
E: <div class="center">Good morning</div>
X: <div class="center"><div class="left"><p>Approximate pronunciation:</p><p>GOO MON</p>The word <span class="italic">morgen</span> can be pronounced like "MORGEN" or in a contracted way, as "MON".</div></div>
```
(Strings above are JS-unescaped; in the bundle quotes are `\"` and non-ASCII may be `\xe6`/`&#230;` entities — entities are decoded by the parser, `decodeEntities:true`.)

Scripts used (scratchpad): `mod.py` (dump module by id), `deps.py` (reverse deps), `cards.py` → `cards.json` (all 2790 stock cards parsed).
