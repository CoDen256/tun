.class public final Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;
.super Ljava/lang/Object;
.source "CdpNetworkTypes.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/devtools/cdp/ResourceType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u000e\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;",
        "",
        "()V",
        "fromMimeType",
        "Lexpo/modules/kotlin/devtools/cdp/ResourceType;",
        "mimeType",
        "",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lexpo/modules/kotlin/devtools/cdp/ResourceType$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromMimeType(Ljava/lang/String;)Lexpo/modules/kotlin/devtools/cdp/ResourceType;
    .locals 4

    const-string v0, "mimeType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "image/"

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    .line 28
    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->IMAGE:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    goto :goto_1

    :cond_0
    const-string v0, "audio"

    .line 29
    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "video"

    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "font"

    .line 30
    invoke-static {p1, v0, v1, v2, v3}, Lkotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->FONT:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    goto :goto_1

    .line 31
    :cond_2
    sget-object p1, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->OTHER:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    goto :goto_1

    .line 29
    :cond_3
    :goto_0
    sget-object p1, Lexpo/modules/kotlin/devtools/cdp/ResourceType;->MEDIA:Lexpo/modules/kotlin/devtools/cdp/ResourceType;

    :goto_1
    return-object p1
.end method
