.class public final Lexpo/modules/kotlin/jni/CppTypeKt;
.super Ljava/lang/Object;
.source "CppType.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nCppType.kt\nKotlin\n*S Kotlin\n*F\n+ 1 CppType.kt\nexpo/modules/kotlin/jni/CppTypeKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,37:1\n1#2:38\n*E\n"
.end annotation

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
.field private static nextValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static final synthetic access$nextValue()I
    .locals 1

    .line 1
    invoke-static {}, Lexpo/modules/kotlin/jni/CppTypeKt;->nextValue()I

    move-result v0

    return v0
.end method

.method private static final nextValue()I
    .locals 3

    sget v0, Lexpo/modules/kotlin/jni/CppTypeKt;->nextValue:I

    const/4 v1, 0x1

    shl-int v2, v1, v0

    add-int/2addr v0, v1

    sput v0, Lexpo/modules/kotlin/jni/CppTypeKt;->nextValue:I

    return v2
.end method
