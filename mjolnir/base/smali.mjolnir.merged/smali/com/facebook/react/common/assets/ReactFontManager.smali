.class public Lcom/facebook/react/common/assets/ReactFontManager;
.super Ljava/lang/Object;
.source "ReactFontManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;,
        Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;
    }
.end annotation


# static fields
.field private static final EXTENSIONS:[Ljava/lang/String;

.field private static final FILE_EXTENSIONS:[Ljava/lang/String;

.field private static final FONTS_ASSET_PATH:Ljava/lang/String; = "fonts/"

.field private static sReactFontManagerInstance:Lcom/facebook/react/common/assets/ReactFontManager;


# instance fields
.field private final mCustomTypefaceCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Typeface;",
            ">;"
        }
    .end annotation
.end field

.field private final mFontCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "_italic"

    const-string v1, "_bold_italic"

    const-string v2, ""

    const-string v3, "_bold"

    .line 41
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/common/assets/ReactFontManager;->EXTENSIONS:[Ljava/lang/String;

    const-string v0, ".ttf"

    const-string v1, ".otf"

    .line 42
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/react/common/assets/ReactFontManager;->FILE_EXTENSIONS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mFontCache:Ljava/util/Map;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mCustomTypefaceCache:Ljava/util/Map;

    return-void
.end method

.method private static createAssetTypeface(Ljava/lang/String;ILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 7

    sget-object v0, Lcom/facebook/react/common/assets/ReactFontManager;->EXTENSIONS:[Ljava/lang/String;

    .line 147
    aget-object v0, v0, p1

    sget-object v1, Lcom/facebook/react/common/assets/ReactFontManager;->FILE_EXTENSIONS:[Ljava/lang/String;

    .line 148
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 149
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "fonts/"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 157
    :try_start_0
    invoke-static {p2, v4}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 163
    :cond_0
    invoke-static {p0, p1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance()Lcom/facebook/react/common/assets/ReactFontManager;
    .locals 1

    sget-object v0, Lcom/facebook/react/common/assets/ReactFontManager;->sReactFontManagerInstance:Lcom/facebook/react/common/assets/ReactFontManager;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lcom/facebook/react/common/assets/ReactFontManager;

    invoke-direct {v0}, Lcom/facebook/react/common/assets/ReactFontManager;-><init>()V

    sput-object v0, Lcom/facebook/react/common/assets/ReactFontManager;->sReactFontManagerInstance:Lcom/facebook/react/common/assets/ReactFontManager;

    :cond_0
    sget-object v0, Lcom/facebook/react/common/assets/ReactFontManager;->sReactFontManagerInstance:Lcom/facebook/react/common/assets/ReactFontManager;

    return-object v0
.end method


# virtual methods
.method public addCustomFont(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    .line 109
    invoke-static {p1, p3}, Landroidx/core/content/res/ResourcesCompat;->getFont(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p3, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mCustomTypefaceCache:Ljava/util/Map;

    .line 111
    invoke-interface {p3, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public addCustomFont(Ljava/lang/String;Landroid/graphics/Typeface;)V
    .locals 1

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mCustomTypefaceCache:Ljava/util/Map;

    .line 121
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method public getTypeface(Ljava/lang/String;IILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 1

    .line 73
    new-instance v0, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;

    invoke-direct {v0, p2, p3}, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;-><init>(II)V

    invoke-virtual {p0, p1, v0, p4}, Lcom/facebook/react/common/assets/ReactFontManager;->getTypeface(Ljava/lang/String;Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;Landroid/content/res/AssetManager;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public getTypeface(Ljava/lang/String;ILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 1

    .line 63
    new-instance v0, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;

    invoke-direct {v0, p2}, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;-><init>(I)V

    invoke-virtual {p0, p1, v0, p3}, Lcom/facebook/react/common/assets/ReactFontManager;->getTypeface(Ljava/lang/String;Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;Landroid/content/res/AssetManager;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public getTypeface(Ljava/lang/String;IZLandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 1

    .line 68
    new-instance v0, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;

    invoke-direct {v0, p2, p3}, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;-><init>(IZ)V

    invoke-virtual {p0, p1, v0, p4}, Lcom/facebook/react/common/assets/ReactFontManager;->getTypeface(Ljava/lang/String;Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;Landroid/content/res/AssetManager;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public getTypeface(Ljava/lang/String;Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;Landroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 2

    iget-object v0, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mCustomTypefaceCache:Ljava/util/Map;

    .line 78
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p3, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mCustomTypefaceCache:Ljava/util/Map;

    .line 81
    invoke-interface {p3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Typeface;

    invoke-virtual {p2, p1}, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;->apply(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mFontCache:Ljava/util/Map;

    .line 84
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;

    if-nez v0, :cond_1

    .line 86
    new-instance v0, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;-><init>(Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily-IA;)V

    iget-object v1, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mFontCache:Ljava/util/Map;

    .line 87
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    :cond_1
    invoke-virtual {p2}, Lcom/facebook/react/common/assets/ReactFontManager$TypefaceStyle;->getNearestStyle()I

    move-result p2

    .line 92
    invoke-virtual {v0, p2}, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;->getTypefaceForStyle(I)Landroid/graphics/Typeface;

    move-result-object v1

    if-nez v1, :cond_2

    .line 94
    invoke-static {p1, p2, p3}, Lcom/facebook/react/common/assets/ReactFontManager;->createAssetTypeface(Ljava/lang/String;ILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;

    move-result-object v1

    .line 95
    invoke-virtual {v0, p2, v1}, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;->setTypefaceForStyle(ILandroid/graphics/Typeface;)V

    :cond_2
    return-object v1
.end method

.method public setTypeface(Ljava/lang/String;ILandroid/graphics/Typeface;)V
    .locals 2

    if-eqz p3, :cond_1

    iget-object v0, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mFontCache:Ljava/util/Map;

    .line 136
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;

    if-nez v0, :cond_0

    .line 138
    new-instance v0, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;-><init>(Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily-IA;)V

    iget-object v1, p0, Lcom/facebook/react/common/assets/ReactFontManager;->mFontCache:Ljava/util/Map;

    .line 139
    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    :cond_0
    invoke-virtual {v0, p2, p3}, Lcom/facebook/react/common/assets/ReactFontManager$AssetFontFamily;->setTypefaceForStyle(ILandroid/graphics/Typeface;)V

    :cond_1
    return-void
.end method
