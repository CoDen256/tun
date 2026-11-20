# Acceptance criteria — projector-examples-column

- **C01** — Unit: a word note with examples `["Vi må komme i vei.","Endelig kom det i vei."]` projects X exactly `<div class="left">Vi må komme i vei.<br>Endelig kom det i vei.</div>`.
- **C02** — Unit: an expression note with `examples: []` projects X `""`. A payload with `context_text: "x"` and no `examples` also projects `""`.
- **C03** — Unit: for `context_text "A.\nB."`, the previous projector's X equals the new projector's X for `examples ["A.","B."]` (byte-equal).
- **C04** — `grep -rn context_text mjolnir/builder` prints nothing, and the builder test suite passes.
- **C05** — Dev compose, stabbur migrated: a forecast or publish followed by opening the card in the console's card preview shows the note's two examples on X as two lines. A note without examples shows an empty X. No other face of any card differs from the pre-change forecast.
