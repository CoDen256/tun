.class public Lcom/facebook/react/views/text/ReactFontManager;
.super Ljava/lang/Object;
.source "ReactFontManager.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static sReactFontManagerInstance:Lcom/facebook/react/views/text/ReactFontManager;


# instance fields
.field private final mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;


# direct methods
.method private constructor <init>(Lcom/facebook/react/common/assets/ReactFontManager;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/views/text/ReactFontManager;->mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;

    return-void
.end method

.method public static getInstance()Lcom/facebook/react/views/text/ReactFontManager;
    .locals 2

    sget-object v0, Lcom/facebook/react/views/text/ReactFontManager;->sReactFontManagerInstance:Lcom/facebook/react/views/text/ReactFontManager;

    if-nez v0, :cond_0

    .line 35
    new-instance v0, Lcom/facebook/react/views/text/ReactFontManager;

    .line 36
    invoke-static {}, Lcom/facebook/react/common/assets/ReactFontManager;->getInstance()Lcom/facebook/react/common/assets/ReactFontManager;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/react/views/text/ReactFontManager;-><init>(Lcom/facebook/react/common/assets/ReactFontManager;)V

    sput-object v0, Lcom/facebook/react/views/text/ReactFontManager;->sReactFontManagerInstance:Lcom/facebook/react/views/text/ReactFontManager;

    :cond_0
    sget-object v0, Lcom/facebook/react/views/text/ReactFontManager;->sReactFontManagerInstance:Lcom/facebook/react/views/text/ReactFontManager;

    return-object v0
.end method


# virtual methods
.method public addCustomFont(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/ReactFontManager;->mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;

    .line 56
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/common/assets/ReactFontManager;->addCustomFont(Landroid/content/Context;Ljava/lang/String;I)V

    return-void
.end method

.method public addCustomFont(Ljava/lang/String;Landroid/graphics/Typeface;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/ReactFontManager;->mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;

    .line 60
    invoke-virtual {v0, p1, p2}, Lcom/facebook/react/common/assets/ReactFontManager;->addCustomFont(Ljava/lang/String;Landroid/graphics/Typeface;)V

    return-void
.end method

.method public getTypeface(Ljava/lang/String;IILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/ReactFontManager;->mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;

    .line 52
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/facebook/react/common/assets/ReactFontManager;->getTypeface(Ljava/lang/String;IILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public getTypeface(Ljava/lang/String;ILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/ReactFontManager;->mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;

    .line 42
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/common/assets/ReactFontManager;->getTypeface(Ljava/lang/String;ILandroid/content/res/AssetManager;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public getTypeface(Ljava/lang/String;IZLandroid/content/res/AssetManager;)Landroid/graphics/Typeface;
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/ReactFontManager;->mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;

    .line 47
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/facebook/react/common/assets/ReactFontManager;->getTypeface(Ljava/lang/String;IZLandroid/content/res/AssetManager;)Landroid/graphics/Typeface;

    move-result-object p1

    return-object p1
.end method

.method public setTypeface(Ljava/lang/String;ILandroid/graphics/Typeface;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/react/views/text/ReactFontManager;->mDelegate:Lcom/facebook/react/common/assets/ReactFontManager;

    .line 64
    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/react/common/assets/ReactFontManager;->setTypeface(Ljava/lang/String;ILandroid/graphics/Typeface;)V

    return-void
.end method
