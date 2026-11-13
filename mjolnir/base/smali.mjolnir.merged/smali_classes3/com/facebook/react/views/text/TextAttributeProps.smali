.class public Lcom/facebook/react/views/text/TextAttributeProps;
.super Ljava/lang/Object;
.source "TextAttributeProps.java"

# interfaces
.implements Lcom/facebook/react/views/text/EffectiveTextAttributeProvider;


# static fields
.field private static final DEFAULT_BREAK_STRATEGY:I = 0x1

.field private static final DEFAULT_HYPHENATION_FREQUENCY:I = 0x0

.field private static final DEFAULT_JUSTIFICATION_MODE:I

.field private static final DEFAULT_TEXT_SHADOW_COLOR:I = 0x55000000

.field private static final PROP_SHADOW_COLOR:Ljava/lang/String; = "textShadowColor"

.field private static final PROP_SHADOW_OFFSET:Ljava/lang/String; = "textShadowOffset"

.field private static final PROP_SHADOW_OFFSET_HEIGHT:Ljava/lang/String; = "height"

.field private static final PROP_SHADOW_OFFSET_WIDTH:Ljava/lang/String; = "width"

.field private static final PROP_SHADOW_RADIUS:Ljava/lang/String; = "textShadowRadius"

.field private static final PROP_TEXT_TRANSFORM:Ljava/lang/String; = "textTransform"

.field public static final TA_KEY_ACCESSIBILITY_ROLE:S = 0x18s

.field public static final TA_KEY_ALIGNMENT:S = 0xcs

.field public static final TA_KEY_ALLOW_FONT_SCALING:S = 0x9s

.field public static final TA_KEY_BACKGROUND_COLOR:S = 0x1s

.field public static final TA_KEY_BEST_WRITING_DIRECTION:S = 0xds

.field public static final TA_KEY_FONT_FAMILY:S = 0x3s

.field public static final TA_KEY_FONT_SIZE:S = 0x4s

.field public static final TA_KEY_FONT_SIZE_MULTIPLIER:S = 0x5s

.field public static final TA_KEY_FONT_STYLE:S = 0x7s

.field public static final TA_KEY_FONT_VARIANT:S = 0x8s

.field public static final TA_KEY_FONT_WEIGHT:S = 0x6s

.field public static final TA_KEY_FOREGROUND_COLOR:S = 0x0s

.field public static final TA_KEY_IS_HIGHLIGHTED:S = 0x16s

.field public static final TA_KEY_LAYOUT_DIRECTION:S = 0x17s

.field public static final TA_KEY_LETTER_SPACING:S = 0xas

.field public static final TA_KEY_LINE_BREAK_STRATEGY:S = 0x19s

.field public static final TA_KEY_LINE_HEIGHT:S = 0xbs

.field public static final TA_KEY_OPACITY:S = 0x2s

.field public static final TA_KEY_ROLE:S = 0x1as

.field public static final TA_KEY_TEXT_DECORATION_COLOR:S = 0xes

.field public static final TA_KEY_TEXT_DECORATION_LINE:S = 0xfs

.field public static final TA_KEY_TEXT_DECORATION_STYLE:S = 0x10s

.field public static final TA_KEY_TEXT_SHADOW_COLOR:S = 0x13s

.field public static final TA_KEY_TEXT_SHADOW_OFFSET_DX:S = 0x14s

.field public static final TA_KEY_TEXT_SHADOW_OFFSET_DY:S = 0x15s

.field public static final TA_KEY_TEXT_SHADOW_RADIUS:S = 0x12s

.field public static final TA_KEY_TEXT_TRANSFORM:S = 0x1bs

.field public static final UNSET:I = -0x1


# instance fields
.field protected mAccessibilityRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

.field protected mAllowFontScaling:Z

.field protected mBackgroundColor:I

.field protected mColor:I

.field protected mContainsImages:Z

.field protected mFontFamily:Ljava/lang/String;

.field protected mFontFeatureSettings:Ljava/lang/String;

.field protected mFontSize:I

.field protected mFontSizeInput:F

.field protected mFontStyle:I

.field protected mFontWeight:I

.field protected mHeightOfTallestInlineImage:F

.field protected mIncludeFontPadding:Z

.field protected mIsBackgroundColorSet:Z

.field protected mIsColorSet:Z

.field protected mIsLineThroughTextDecorationSet:Z

.field protected mIsUnderlineTextDecorationSet:Z

.field protected mLayoutDirection:I

.field protected mLetterSpacingInput:F

.field protected mLineHeight:F

.field protected mLineHeightInput:F

.field protected mNumberOfLines:I

.field protected mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

.field protected mTextAlign:I

.field protected mTextShadowColor:I

.field protected mTextShadowOffsetDx:F

.field protected mTextShadowOffsetDy:F

.field protected mTextShadowRadius:F

.field protected mTextTransform:Lcom/facebook/react/views/text/TextTransform;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput v0, Lcom/facebook/react/views/text/TextAttributeProps;->DEFAULT_JUSTIFICATION_MODE:I

    return-void
.end method

.method private constructor <init>()V
    .locals 5

    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeight:F

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsColorSet:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAllowFontScaling:Z

    iput-boolean v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsBackgroundColorSet:Z

    const/4 v3, -0x1

    iput v3, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mNumberOfLines:I

    iput v3, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSize:I

    const/high16 v4, -0x40800000    # -1.0f

    iput v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSizeInput:F

    iput v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeightInput:F

    iput v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLetterSpacingInput:F

    iput v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextAlign:I

    iput v3, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLayoutDirection:I

    .line 98
    sget-object v4, Lcom/facebook/react/views/text/TextTransform;->NONE:Lcom/facebook/react/views/text/TextTransform;

    iput-object v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    const/4 v4, 0x0

    iput v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    iput v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    iput v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    const/high16 v4, 0x55000000

    iput v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    iput-boolean v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsUnderlineTextDecorationSet:Z

    iput-boolean v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsLineThroughTextDecorationSet:Z

    iput-boolean v2, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIncludeFontPadding:Z

    const/4 v2, 0x0

    iput-object v2, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAccessibilityRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    iput-object v2, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    iput v3, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontStyle:I

    iput v3, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontWeight:I

    iput-object v2, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFamily:Ljava/lang/String;

    iput-object v2, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFeatureSettings:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mContainsImages:Z

    iput v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mHeightOfTallestInlineImage:F

    return-void
.end method

.method public static fromMapBuffer(Lcom/facebook/react/common/mapbuffer/MapBuffer;)Lcom/facebook/react/views/text/TextAttributeProps;
    .locals 3

    .line 147
    new-instance v0, Lcom/facebook/react/views/text/TextAttributeProps;

    invoke-direct {v0}, Lcom/facebook/react/views/text/TextAttributeProps;-><init>()V

    .line 150
    invoke-interface {p0}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 151
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 152
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;

    .line 153
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getKey()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 223
    :pswitch_1
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextTransform(Ljava/lang/String;)V

    goto :goto_0

    .line 220
    :pswitch_2
    invoke-static {}, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;->values()[Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    move-result-object v2

    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getIntValue()I

    move-result v1

    aget-object v1, v2, v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setRole(Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;)V

    goto :goto_0

    .line 217
    :pswitch_3
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setAccessibilityRole(Ljava/lang/String;)V

    goto :goto_0

    .line 214
    :pswitch_4
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLayoutDirection(Ljava/lang/String;)V

    goto :goto_0

    .line 209
    :pswitch_5
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getDoubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextShadowOffsetDy(F)V

    goto :goto_0

    .line 206
    :pswitch_6
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getDoubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextShadowOffsetDx(F)V

    goto :goto_0

    .line 203
    :pswitch_7
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getIntValue()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextShadowColor(I)V

    goto :goto_0

    .line 200
    :pswitch_8
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getDoubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextShadowRadius(F)V

    goto :goto_0

    .line 195
    :pswitch_9
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextDecorationLine(Ljava/lang/String;)V

    goto :goto_0

    .line 186
    :pswitch_a
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getDoubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLineHeight(F)V

    goto :goto_0

    .line 183
    :pswitch_b
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getDoubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLetterSpacing(F)V

    goto :goto_0

    .line 180
    :pswitch_c
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getBooleanValue()Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setAllowFontScaling(Z)V

    goto :goto_0

    .line 177
    :pswitch_d
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getMapBufferValue()Lcom/facebook/react/common/mapbuffer/MapBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontVariant(Lcom/facebook/react/common/mapbuffer/MapBuffer;)V

    goto/16 :goto_0

    .line 174
    :pswitch_e
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontStyle(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 171
    :pswitch_f
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontWeight(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 166
    :pswitch_10
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getDoubleValue()D

    move-result-wide v1

    double-to-float v1, v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontSize(F)V

    goto/16 :goto_0

    .line 163
    :pswitch_11
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontFamily(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 158
    :pswitch_12
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getIntValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setBackgroundColor(Ljava/lang/Integer;)V

    goto/16 :goto_0

    .line 155
    :pswitch_13
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getIntValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setColor(Ljava/lang/Integer;)V

    goto/16 :goto_0

    :cond_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_13
        :pswitch_12
        :pswitch_0
        :pswitch_11
        :pswitch_10
        :pswitch_0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_9
        :pswitch_0
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static fromReadableMap(Lcom/facebook/react/uimanager/ReactStylesDiffMap;)Lcom/facebook/react/views/text/TextAttributeProps;
    .locals 6

    .line 236
    new-instance v0, Lcom/facebook/react/views/text/TextAttributeProps;

    invoke-direct {v0}, Lcom/facebook/react/views/text/TextAttributeProps;-><init>()V

    const-string v1, "numberOfLines"

    const/4 v2, -0x1

    .line 237
    invoke-static {p0, v1, v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getIntProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;I)I

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setNumberOfLines(I)V

    const-string v1, "lineHeight"

    const/high16 v2, -0x40800000    # -1.0f

    .line 238
    invoke-static {p0, v1, v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getFloatProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;F)F

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLineHeight(F)V

    const-string v1, "letterSpacing"

    const/high16 v3, 0x7fc00000    # Float.NaN

    .line 239
    invoke-static {p0, v1, v3}, Lcom/facebook/react/views/text/TextAttributeProps;->getFloatProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;F)F

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLetterSpacing(F)V

    const-string v1, "allowFontScaling"

    const/4 v3, 0x1

    .line 240
    invoke-static {p0, v1, v3}, Lcom/facebook/react/views/text/TextAttributeProps;->getBooleanProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;Z)Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setAllowFontScaling(Z)V

    const-string v1, "fontSize"

    .line 241
    invoke-static {p0, v1, v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getFloatProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;F)F

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontSize(F)V

    const-string v1, "color"

    .line 242
    invoke-virtual {p0, v1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {p0, v1, v4}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v5

    :goto_0
    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setColor(Ljava/lang/Integer;)V

    const-string v1, "foregroundColor"

    .line 244
    invoke-virtual {p0, v1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 245
    invoke-virtual {p0, v1, v4}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_1

    :cond_1
    move-object v1, v5

    .line 243
    :goto_1
    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setColor(Ljava/lang/Integer;)V

    const-string v1, "backgroundColor"

    .line 248
    invoke-virtual {p0, v1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 249
    invoke-virtual {p0, v1, v4}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_2

    :cond_2
    move-object v1, v5

    .line 247
    :goto_2
    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setBackgroundColor(Ljava/lang/Integer;)V

    const-string v1, "fontFamily"

    .line 251
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontFamily(Ljava/lang/String;)V

    const-string v1, "fontWeight"

    .line 252
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontWeight(Ljava/lang/String;)V

    const-string v1, "fontStyle"

    .line 253
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontStyle(Ljava/lang/String;)V

    const-string v1, "fontVariant"

    .line 254
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getArrayProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontVariant(Lcom/facebook/react/bridge/ReadableArray;)V

    const-string v1, "includeFontPadding"

    .line 255
    invoke-static {p0, v1, v3}, Lcom/facebook/react/views/text/TextAttributeProps;->getBooleanProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;Z)Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setIncludeFontPadding(Z)V

    const-string v1, "textDecorationLine"

    .line 256
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextDecorationLine(Ljava/lang/String;)V

    const-string v1, "textShadowOffset"

    .line 258
    invoke-virtual {p0, v1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p0, v1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v5

    .line 257
    :cond_3
    invoke-direct {v0, v5}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextShadowOffset(Lcom/facebook/react/bridge/ReadableMap;)V

    const-string v1, "textShadowRadius"

    const/high16 v2, 0x3f800000    # 1.0f

    .line 259
    invoke-static {p0, v1, v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getFloatProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;F)F

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextShadowRadius(F)V

    const-string v1, "textShadowColor"

    const/high16 v2, 0x55000000

    .line 260
    invoke-static {p0, v1, v2}, Lcom/facebook/react/views/text/TextAttributeProps;->getIntProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;I)I

    move-result v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextShadowColor(I)V

    const-string v1, "textTransform"

    .line 261
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setTextTransform(Ljava/lang/String;)V

    const-string v1, "layoutDirection"

    .line 262
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLayoutDirection(Ljava/lang/String;)V

    const-string v1, "accessibilityRole"

    .line 263
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->setAccessibilityRole(Ljava/lang/String;)V

    const-string v1, "role"

    .line 264
    invoke-static {p0, v1}, Lcom/facebook/react/views/text/TextAttributeProps;->getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/facebook/react/views/text/TextAttributeProps;->setRole(Ljava/lang/String;)V

    return-object v0
.end method

.method private static getArrayProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;
    .locals 1

    .line 338
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 339
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getBooleanProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;Z)Z
    .locals 1

    .line 306
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 307
    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_0
    return p2
.end method

.method private static getFloatProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;F)F
    .locals 1

    .line 330
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 331
    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getFloat(Ljava/lang/String;F)F

    move-result p0

    return p0

    :cond_0
    return p2
.end method

.method public static getHyphenationFrequency(Ljava/lang/String;)I
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 767
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const-string v1, "normal"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "none"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :cond_1
    :goto_0
    return v0
.end method

.method private static getIntProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;I)I
    .locals 1

    .line 322
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 323
    invoke-virtual {p0, p1, p2}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getInt(Ljava/lang/String;I)I

    move-result p0

    return p0

    :cond_0
    return p2
.end method

.method public static getJustificationMode(Lcom/facebook/react/uimanager/ReactStylesDiffMap;I)I
    .locals 2

    const-string v0, "textAlign"

    .line 293
    invoke-virtual {p0, v0}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    return p1

    .line 297
    :cond_0
    invoke-virtual {p0, v0}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "justify"

    .line 298
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p1, 0x1a

    if-lt p0, p1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    sget p0, Lcom/facebook/react/views/text/TextAttributeProps;->DEFAULT_JUSTIFICATION_MODE:I

    return p0
.end method

.method public static getLayoutDirection(Ljava/lang/String;)I
    .locals 3

    const/4 v0, -0x1

    if-eqz p0, :cond_3

    const-string v1, "undefined"

    .line 661
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const-string v1, "rtl"

    .line 663
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const-string v1, "ltr"

    .line 665
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x0

    goto :goto_0

    .line 668
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid layoutDirection: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "ReactNative"

    invoke-static {v1, p0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return v0
.end method

.method private static getStringProp(Lcom/facebook/react/uimanager/ReactStylesDiffMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 314
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    invoke-virtual {p0, p1}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getTextAlignment(Lcom/facebook/react/uimanager/ReactStylesDiffMap;ZI)I
    .locals 3

    const-string v0, "textAlign"

    .line 269
    invoke-virtual {p0, v0}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    return p2

    .line 273
    :cond_0
    invoke-virtual {p0, v0}, Lcom/facebook/react/uimanager/ReactStylesDiffMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "justify"

    .line 274
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x3

    if-eqz p2, :cond_1

    return v0

    :cond_1
    const/4 p2, 0x0

    if-eqz p0, :cond_8

    const-string v1, "auto"

    .line 277
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    :cond_2
    const-string v1, "left"

    .line 279
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x5

    if-eqz v1, :cond_4

    if-eqz p1, :cond_3

    move v0, v2

    :cond_3
    return v0

    :cond_4
    const-string v1, "right"

    .line 281
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    move v0, v2

    :goto_0
    return v0

    :cond_6
    const-string p1, "center"

    .line 283
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    const/4 p0, 0x1

    return p0

    .line 286
    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Invalid textAlign: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "ReactNative"

    invoke-static {p1, p0}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    :goto_1
    return p2
.end method

.method public static getTextBreakStrategy(Ljava/lang/String;)I
    .locals 2

    const/4 v0, 0x1

    if-eqz p0, :cond_2

    .line 749
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    const-string v1, "balanced"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "simple"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    :cond_2
    :goto_0
    return v0
.end method

.method private setAccessibilityRole(Ljava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAccessibilityRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    goto :goto_0

    .line 724
    :cond_0
    invoke-static {p1}, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;->fromValue(Ljava/lang/String;)Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAccessibilityRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    :goto_0
    return-void
.end method

.method private setAllowFontScaling(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAllowFontScaling:Z

    if-eq p1, v0, :cond_0

    iput-boolean p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAllowFontScaling:Z

    iget p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSizeInput:F

    .line 410
    invoke-direct {p0, p1}, Lcom/facebook/react/views/text/TextAttributeProps;->setFontSize(F)V

    iget p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeightInput:F

    .line 411
    invoke-direct {p0, p1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLineHeight(F)V

    iget p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLetterSpacingInput:F

    .line 412
    invoke-direct {p0, p1}, Lcom/facebook/react/views/text/TextAttributeProps;->setLetterSpacing(F)V

    :cond_0
    return-void
.end method

.method private setBackgroundColor(Ljava/lang/Integer;)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsBackgroundColorSet:Z

    if-eqz v0, :cond_1

    .line 455
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mBackgroundColor:I

    :cond_1
    return-void
.end method

.method private setColor(Ljava/lang/Integer;)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsColorSet:Z

    if-eqz v0, :cond_1

    .line 435
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mColor:I

    :cond_1
    return-void
.end method

.method private setFontFamily(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFamily:Ljava/lang/String;

    return-void
.end method

.method private setFontSize(F)V
    .locals 2

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSizeInput:F

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAllowFontScaling:Z

    if-eqz v0, :cond_0

    .line 421
    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromSP(F)F

    move-result p1

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    goto :goto_0

    .line 422
    :cond_0
    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p1

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    :goto_0
    double-to-float p1, v0

    :cond_1
    float-to-int p1, p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSize:I

    return-void
.end method

.method private setFontStyle(Ljava/lang/String;)V
    .locals 0

    .line 592
    invoke-static {p1}, Lcom/facebook/react/views/text/ReactTypefaceUtils;->parseFontStyle(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontStyle:I

    return-void
.end method

.method private setFontVariant(Lcom/facebook/react/bridge/ReadableArray;)V
    .locals 0

    .line 480
    invoke-static {p1}, Lcom/facebook/react/views/text/ReactTypefaceUtils;->parseFontVariant(Lcom/facebook/react/bridge/ReadableArray;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFeatureSettings:Ljava/lang/String;

    return-void
.end method

.method private setFontVariant(Lcom/facebook/react/common/mapbuffer/MapBuffer;)V
    .locals 4

    if-eqz p1, :cond_1c

    .line 484
    invoke-interface {p1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 489
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 490
    invoke-interface {p1}, Lcom/facebook/react/common/mapbuffer/MapBuffer;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 491
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 492
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;

    .line 493
    invoke-interface {v1}, Lcom/facebook/react/common/mapbuffer/MapBuffer$Entry;->getStringValue()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 495
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, -0x1

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_1

    :sswitch_0
    const-string v2, "stylistic-seventeen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    goto/16 :goto_1

    :cond_2
    const/16 v3, 0x18

    goto/16 :goto_1

    :sswitch_1
    const-string v2, "stylistic-fourteen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    goto/16 :goto_1

    :cond_3
    const/16 v3, 0x17

    goto/16 :goto_1

    :sswitch_2
    const-string v2, "stylistic-nineteen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    goto/16 :goto_1

    :cond_4
    const/16 v3, 0x16

    goto/16 :goto_1

    :sswitch_3
    const-string v2, "small-caps"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    goto/16 :goto_1

    :cond_5
    const/16 v3, 0x15

    goto/16 :goto_1

    :sswitch_4
    const-string v2, "stylistic-twenty"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    goto/16 :goto_1

    :cond_6
    const/16 v3, 0x14

    goto/16 :goto_1

    :sswitch_5
    const-string v2, "stylistic-twelve"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    goto/16 :goto_1

    :cond_7
    const/16 v3, 0x13

    goto/16 :goto_1

    :sswitch_6
    const-string v2, "stylistic-sixteen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    goto/16 :goto_1

    :cond_8
    const/16 v3, 0x12

    goto/16 :goto_1

    :sswitch_7
    const-string v2, "stylistic-two"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    goto/16 :goto_1

    :cond_9
    const/16 v3, 0x11

    goto/16 :goto_1

    :sswitch_8
    const-string v2, "stylistic-ten"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    goto/16 :goto_1

    :cond_a
    const/16 v3, 0x10

    goto/16 :goto_1

    :sswitch_9
    const-string v2, "stylistic-six"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b

    goto/16 :goto_1

    :cond_b
    const/16 v3, 0xf

    goto/16 :goto_1

    :sswitch_a
    const-string v2, "stylistic-one"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c

    goto/16 :goto_1

    :cond_c
    const/16 v3, 0xe

    goto/16 :goto_1

    :sswitch_b
    const-string v2, "stylistic-nine"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    goto/16 :goto_1

    :cond_d
    const/16 v3, 0xd

    goto/16 :goto_1

    :sswitch_c
    const-string v2, "stylistic-four"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    goto/16 :goto_1

    :cond_e
    const/16 v3, 0xc

    goto/16 :goto_1

    :sswitch_d
    const-string v2, "stylistic-five"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_f

    goto/16 :goto_1

    :cond_f
    const/16 v3, 0xb

    goto/16 :goto_1

    :sswitch_e
    const-string v2, "stylistic-eleven"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_10

    goto/16 :goto_1

    :cond_10
    const/16 v3, 0xa

    goto/16 :goto_1

    :sswitch_f
    const-string v2, "stylistic-three"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_11

    goto/16 :goto_1

    :cond_11
    const/16 v3, 0x9

    goto/16 :goto_1

    :sswitch_10
    const-string v2, "stylistic-seven"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    goto/16 :goto_1

    :cond_12
    const/16 v3, 0x8

    goto/16 :goto_1

    :sswitch_11
    const-string v2, "stylistic-eight"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    goto :goto_1

    :cond_13
    const/4 v3, 0x7

    goto :goto_1

    :sswitch_12
    const-string v2, "oldstyle-nums"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    goto :goto_1

    :cond_14
    const/4 v3, 0x6

    goto :goto_1

    :sswitch_13
    const-string v2, "tabular-nums"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    goto :goto_1

    :cond_15
    const/4 v3, 0x5

    goto :goto_1

    :sswitch_14
    const-string v2, "lining-nums"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_16

    goto :goto_1

    :cond_16
    const/4 v3, 0x4

    goto :goto_1

    :sswitch_15
    const-string v2, "proportional-nums"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    goto :goto_1

    :cond_17
    const/4 v3, 0x3

    goto :goto_1

    :sswitch_16
    const-string v2, "stylistic-eighteen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    goto :goto_1

    :cond_18
    const/4 v3, 0x2

    goto :goto_1

    :sswitch_17
    const-string v2, "stylistic-fifteen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    goto :goto_1

    :cond_19
    const/4 v3, 0x1

    goto :goto_1

    :sswitch_18
    const-string v2, "stylistic-thirteen"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1a

    goto :goto_1

    :cond_1a
    const/4 v3, 0x0

    :goto_1
    packed-switch v3, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    const-string v1, "\'ss17\'"

    .line 560
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_1
    const-string v1, "\'ss14\'"

    .line 551
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_2
    const-string v1, "\'ss19\'"

    .line 566
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_3
    const-string v1, "\'smcp\'"

    .line 497
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_4
    const-string v1, "\'ss20\'"

    .line 569
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_5
    const-string v1, "\'ss12\'"

    .line 545
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_6
    const-string v1, "\'ss16\'"

    .line 557
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_7
    const-string v1, "\'ss02\'"

    .line 515
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_8
    const-string v1, "\'ss10\'"

    .line 539
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_9
    const-string v1, "\'ss06\'"

    .line 527
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_a
    const-string v1, "\'ss01\'"

    .line 512
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_b
    const-string v1, "\'ss09\'"

    .line 536
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_c
    const-string v1, "\'ss04\'"

    .line 521
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_d
    const-string v1, "\'ss05\'"

    .line 524
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_e
    const-string v1, "\'ss11\'"

    .line 542
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_f
    const-string v1, "\'ss03\'"

    .line 518
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_10
    const-string v1, "\'ss07\'"

    .line 530
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_11
    const-string v1, "\'ss08\'"

    .line 533
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_12
    const-string v1, "\'onum\'"

    .line 500
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_13
    const-string v1, "\'tnum\'"

    .line 506
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_14
    const-string v1, "\'lnum\'"

    .line 503
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_15
    const-string v1, "\'pnum\'"

    .line 509
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_16
    const-string v1, "\'ss18\'"

    .line 563
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_17
    const-string v1, "\'ss15\'"

    .line 554
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :pswitch_18
    const-string v1, "\'ss13\'"

    .line 548
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_1b
    const-string p1, ", "

    .line 574
    invoke-static {p1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFeatureSettings:Ljava/lang/String;

    return-void

    :cond_1c
    :goto_2
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFeatureSettings:Ljava/lang/String;

    return-void

    :sswitch_data_0
    .sparse-switch
        -0x7634064c -> :sswitch_18
        -0x733f3500 -> :sswitch_17
        -0x5b760864 -> :sswitch_16
        -0x473fc7cb -> :sswitch_15
        -0x3f4391b7 -> :sswitch_14
        -0x2e038ca3 -> :sswitch_13
        -0x2751e650 -> :sswitch_12
        0x11ac52f2 -> :sswitch_11
        0x12700270 -> :sswitch_10
        0x127f6801 -> :sswitch_f
        0x24079c3e -> :sswitch_e
        0x3a60dbef -> :sswitch_d
        0x3a60f263 -> :sswitch_c
        0x3a647def -> :sswitch_b
        0x3bb0ad89 -> :sswitch_a
        0x3bb0bc05 -> :sswitch_9
        0x3bb0bf40 -> :sswitch_8
        0x3bb0c16f -> :sswitch_7
        0x3d6f745f -> :sswitch_6
        0x3e3b2c96 -> :sswitch_5
        0x3e3b33ee -> :sswitch_4
        0x468813e7 -> :sswitch_3
        0x573c3149 -> :sswitch_2
        0x62414bbd -> :sswitch_1
        0x7cff8d4a -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private setFontWeight(Ljava/lang/String;)V
    .locals 0

    .line 588
    invoke-static {p1}, Lcom/facebook/react/views/text/ReactTypefaceUtils;->parseFontWeight(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontWeight:I

    return-void
.end method

.method private setIncludeFontPadding(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIncludeFontPadding:Z

    return-void
.end method

.method private setLayoutDirection(Ljava/lang/String;)V
    .locals 0

    .line 675
    invoke-static {p1}, Lcom/facebook/react/views/text/TextAttributeProps;->getLayoutDirection(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLayoutDirection:I

    return-void
.end method

.method private setLetterSpacing(F)V
    .locals 0

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLetterSpacingInput:F

    return-void
.end method

.method private setLineHeight(F)V
    .locals 1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeightInput:F

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    const/high16 p1, 0x7fc00000    # Float.NaN

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeight:F

    goto :goto_1

    :cond_0
    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAllowFontScaling:Z

    if-eqz v0, :cond_1

    .line 367
    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromSP(F)F

    move-result p1

    goto :goto_0

    .line 368
    :cond_1
    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p1

    :goto_0
    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeight:F

    :goto_1
    return-void
.end method

.method private setNumberOfLines(I)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, -0x1

    :cond_0
    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mNumberOfLines:I

    return-void
.end method

.method private setRole(Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;)V
    .locals 0

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    return-void
.end method

.method private setRole(Ljava/lang/String;)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    goto :goto_0

    .line 738
    :cond_0
    invoke-static {p1}, Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;->fromValue(Ljava/lang/String;)Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    :goto_0
    return-void
.end method

.method private setTextDecorationLine(Ljava/lang/String;)V
    .locals 5

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsUnderlineTextDecorationSet:Z

    iput-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsLineThroughTextDecorationSet:Z

    if-eqz p1, :cond_2

    const-string v1, "-"

    .line 603
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_2

    aget-object v2, p1, v0

    const-string v3, "underline"

    .line 604
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_0

    iput-boolean v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsUnderlineTextDecorationSet:Z

    goto :goto_1

    :cond_0
    const-string v3, "strikethrough"

    .line 606
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iput-boolean v4, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsLineThroughTextDecorationSet:Z

    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private setTextShadowColor(I)V
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    if-eq p1, v0, :cond_0

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    :cond_0
    return-void
.end method

.method private setTextShadowOffset(Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    iput v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    if-eqz p1, :cond_1

    const-string/jumbo v0, "width"

    .line 628
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 629
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 631
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result v0

    iput v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    :cond_0
    const-string v0, "height"

    .line 633
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 634
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 636
    invoke-interface {p1, v0}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(D)F

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    :cond_1
    return-void
.end method

.method private setTextShadowOffsetDx(F)V
    .locals 0

    .line 647
    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    return-void
.end method

.method private setTextShadowOffsetDy(F)V
    .locals 0

    .line 656
    invoke-static {p1}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result p1

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    return-void
.end method

.method private setTextShadowRadius(F)V
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    iput p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    :cond_0
    return-void
.end method

.method private setTextTransform(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_4

    const-string v0, "none"

    .line 701
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string/jumbo v0, "uppercase"

    .line 703
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 704
    sget-object p1, Lcom/facebook/react/views/text/TextTransform;->UPPERCASE:Lcom/facebook/react/views/text/TextTransform;

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    goto :goto_1

    :cond_1
    const-string v0, "lowercase"

    .line 705
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 706
    sget-object p1, Lcom/facebook/react/views/text/TextTransform;->LOWERCASE:Lcom/facebook/react/views/text/TextTransform;

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    goto :goto_1

    :cond_2
    const-string v0, "capitalize"

    .line 707
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 708
    sget-object p1, Lcom/facebook/react/views/text/TextTransform;->CAPITALIZE:Lcom/facebook/react/views/text/TextTransform;

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    goto :goto_1

    .line 710
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Invalid textTransform: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "ReactNative"

    invoke-static {v0, p1}, Lcom/facebook/common/logging/FLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    sget-object p1, Lcom/facebook/react/views/text/TextTransform;->NONE:Lcom/facebook/react/views/text/TextTransform;

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    goto :goto_1

    .line 702
    :cond_4
    :goto_0
    sget-object p1, Lcom/facebook/react/views/text/TextTransform;->NONE:Lcom/facebook/react/views/text/TextTransform;

    iput-object p1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    :goto_1
    return-void
.end method


# virtual methods
.method public getAccessibilityRole()Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAccessibilityRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$AccessibilityRole;

    return-object v0
.end method

.method public getBackgroundColor()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mBackgroundColor:I

    return v0
.end method

.method public getColor()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mColor:I

    return v0
.end method

.method public getEffectiveFontSize()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSize:I

    return v0
.end method

.method public getEffectiveLetterSpacing()F
    .locals 1

    .line 399
    invoke-virtual {p0}, Lcom/facebook/react/views/text/TextAttributeProps;->getLetterSpacing()F

    move-result v0

    return v0
.end method

.method public getEffectiveLineHeight()F
    .locals 2

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeight:F

    .line 350
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mHeightOfTallestInlineImage:F

    .line 351
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mHeightOfTallestInlineImage:F

    iget v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeight:F

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLineHeight:F

    :goto_0
    return v0
.end method

.method public getFontFamily()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFamily:Ljava/lang/String;

    return-object v0
.end method

.method public getFontFeatureSettings()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontFeatureSettings:Ljava/lang/String;

    return-object v0
.end method

.method public getFontStyle()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontStyle:I

    return v0
.end method

.method public getFontWeight()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontWeight:I

    return v0
.end method

.method public getLetterSpacing()F
    .locals 3

    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mAllowFontScaling:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLetterSpacingInput:F

    .line 385
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromSP(F)F

    move-result v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mLetterSpacingInput:F

    .line 386
    invoke-static {v0}, Lcom/facebook/react/uimanager/PixelUtil;->toPixelFromDIP(F)F

    move-result v0

    :goto_0
    iget v1, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSize:I

    if-lez v1, :cond_1

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0

    .line 389
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "FontSize should be a positive value. Current value: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mFontSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRole()Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mRole:Lcom/facebook/react/uimanager/ReactAccessibilityDelegate$Role;

    return-object v0
.end method

.method public getTextShadowColor()I
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowColor:I

    return v0
.end method

.method public getTextShadowOffsetDx()F
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDx:F

    return v0
.end method

.method public getTextShadowOffsetDy()F
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowOffsetDy:F

    return v0
.end method

.method public getTextShadowRadius()F
    .locals 1

    iget v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextShadowRadius:F

    return v0
.end method

.method public getTextTransform()Lcom/facebook/react/views/text/TextTransform;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mTextTransform:Lcom/facebook/react/views/text/TextTransform;

    return-object v0
.end method

.method public isBackgroundColorSet()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsBackgroundColorSet:Z

    return v0
.end method

.method public isColorSet()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsColorSet:Z

    return v0
.end method

.method public isLineThroughTextDecorationSet()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsLineThroughTextDecorationSet:Z

    return v0
.end method

.method public isUnderlineTextDecorationSet()Z
    .locals 1

    iget-boolean v0, p0, Lcom/facebook/react/views/text/TextAttributeProps;->mIsUnderlineTextDecorationSet:Z

    return v0
.end method
