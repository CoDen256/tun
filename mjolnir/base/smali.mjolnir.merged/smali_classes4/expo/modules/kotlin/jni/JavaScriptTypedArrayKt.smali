.class public final Lexpo/modules/kotlin/jni/JavaScriptTypedArrayKt;
.super Ljava/lang/Object;
.source "JavaScriptTypedArray.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0008\n\u0000\u001a\u0008\u0010\u0000\u001a\u00020\u0001H\u0002\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0002"
    }
    d2 = {
        "nextValue",
        "",
        "expo-modules-core_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static nextValue:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static final synthetic access$nextValue()I
    .locals 1

    .line 1
    invoke-static {}, Lexpo/modules/kotlin/jni/JavaScriptTypedArrayKt;->nextValue()I

    move-result v0

    return v0
.end method

.method private static final nextValue()I
    .locals 2

    sget v0, Lexpo/modules/kotlin/jni/JavaScriptTypedArrayKt;->nextValue:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lexpo/modules/kotlin/jni/JavaScriptTypedArrayKt;->nextValue:I

    return v0
.end method
