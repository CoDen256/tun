.class public final Lexpo/modules/kotlin/jni/ExpectedType$Companion;
.super Ljava/lang/Object;
.source "ExpectedType.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/kotlin/jni/ExpectedType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0003\u001a\u00020\u0004J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0007J\u000e\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004J\u000e\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0007J\u000e\u0010\u0008\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0004J\u000e\u0010\n\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0007J\u000e\u0010\n\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004\u00a8\u0006\u000b"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/ExpectedType$Companion;",
        "",
        "()V",
        "forEnum",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
        "forList",
        "parameterType",
        "Lexpo/modules/kotlin/jni/CppType;",
        "forMap",
        "valueType",
        "forPrimitiveArray",
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

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lexpo/modules/kotlin/jni/ExpectedType$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final forEnum()Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 4

    .line 79
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x2

    new-array v1, v1, [Lexpo/modules/kotlin/jni/CppType;

    const/4 v2, 0x0

    .line 80
    sget-object v3, Lexpo/modules/kotlin/jni/CppType;->STRING:Lexpo/modules/kotlin/jni/CppType;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    .line 81
    sget-object v3, Lexpo/modules/kotlin/jni/CppType;->INT:Lexpo/modules/kotlin/jni/CppType;

    aput-object v3, v1, v2

    .line 79
    invoke-direct {v0, v1}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    return-object v0
.end method

.method public final forList(Lexpo/modules/kotlin/jni/CppType;)Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 8

    const-string v0, "parameterType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/jni/SingleType;

    .line 85
    new-instance v3, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v4, Lexpo/modules/kotlin/jni/CppType;->LIST:Lexpo/modules/kotlin/jni/CppType;

    new-array v5, v1, [Lexpo/modules/kotlin/jni/ExpectedType;

    new-instance v6, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v1, v1, [Lexpo/modules/kotlin/jni/CppType;

    const/4 v7, 0x0

    aput-object p1, v1, v7

    invoke-direct {v6, v1}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    aput-object v6, v5, v7

    invoke-direct {v3, v4, v5}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;)V

    aput-object v3, v2, v7

    .line 84
    invoke-direct {v0, v2}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/SingleType;)V

    return-object v0
.end method

.method public final forList(Lexpo/modules/kotlin/jni/ExpectedType;)Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 6

    const-string v0, "parameterType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/jni/SingleType;

    .line 89
    new-instance v3, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v4, Lexpo/modules/kotlin/jni/CppType;->LIST:Lexpo/modules/kotlin/jni/CppType;

    new-array v1, v1, [Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v5, 0x0

    aput-object p1, v1, v5

    invoke-direct {v3, v4, v1}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;)V

    aput-object v3, v2, v5

    .line 88
    invoke-direct {v0, v2}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/SingleType;)V

    return-object v0
.end method

.method public final forMap(Lexpo/modules/kotlin/jni/CppType;)Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 8

    const-string v0, "valueType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 92
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/jni/SingleType;

    .line 93
    new-instance v3, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v4, Lexpo/modules/kotlin/jni/CppType;->MAP:Lexpo/modules/kotlin/jni/CppType;

    new-array v5, v1, [Lexpo/modules/kotlin/jni/ExpectedType;

    new-instance v6, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v1, v1, [Lexpo/modules/kotlin/jni/CppType;

    const/4 v7, 0x0

    aput-object p1, v1, v7

    invoke-direct {v6, v1}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    aput-object v6, v5, v7

    invoke-direct {v3, v4, v5}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;)V

    aput-object v3, v2, v7

    .line 92
    invoke-direct {v0, v2}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/SingleType;)V

    return-object v0
.end method

.method public final forMap(Lexpo/modules/kotlin/jni/ExpectedType;)Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 6

    const-string v0, "valueType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/jni/SingleType;

    .line 97
    new-instance v3, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v4, Lexpo/modules/kotlin/jni/CppType;->MAP:Lexpo/modules/kotlin/jni/CppType;

    new-array v1, v1, [Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v5, 0x0

    aput-object p1, v1, v5

    invoke-direct {v3, v4, v1}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;)V

    aput-object v3, v2, v5

    .line 96
    invoke-direct {v0, v2}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/SingleType;)V

    return-object v0
.end method

.method public final forPrimitiveArray(Lexpo/modules/kotlin/jni/CppType;)Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 8

    const-string v0, "parameterType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/jni/SingleType;

    .line 72
    new-instance v3, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v4, Lexpo/modules/kotlin/jni/CppType;->PRIMITIVE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    new-array v5, v1, [Lexpo/modules/kotlin/jni/ExpectedType;

    new-instance v6, Lexpo/modules/kotlin/jni/ExpectedType;

    new-array v1, v1, [Lexpo/modules/kotlin/jni/CppType;

    const/4 v7, 0x0

    aput-object p1, v1, v7

    invoke-direct {v6, v1}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/CppType;)V

    aput-object v6, v5, v7

    invoke-direct {v3, v4, v5}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;)V

    aput-object v3, v2, v7

    .line 71
    invoke-direct {v0, v2}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/SingleType;)V

    return-object v0
.end method

.method public final forPrimitiveArray(Lexpo/modules/kotlin/jni/ExpectedType;)Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 6

    const-string v0, "parameterType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    new-instance v0, Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v1, 0x1

    new-array v2, v1, [Lexpo/modules/kotlin/jni/SingleType;

    .line 76
    new-instance v3, Lexpo/modules/kotlin/jni/SingleType;

    sget-object v4, Lexpo/modules/kotlin/jni/CppType;->PRIMITIVE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    new-array v1, v1, [Lexpo/modules/kotlin/jni/ExpectedType;

    const/4 v5, 0x0

    aput-object p1, v1, v5

    invoke-direct {v3, v4, v1}, Lexpo/modules/kotlin/jni/SingleType;-><init>(Lexpo/modules/kotlin/jni/CppType;[Lexpo/modules/kotlin/jni/ExpectedType;)V

    aput-object v3, v2, v5

    .line 75
    invoke-direct {v0, v2}, Lexpo/modules/kotlin/jni/ExpectedType;-><init>([Lexpo/modules/kotlin/jni/SingleType;)V

    return-object v0
.end method
