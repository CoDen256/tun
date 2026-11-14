.class public final enum Lexpo/modules/kotlin/jni/TypedArrayKind;
.super Ljava/lang/Enum;
.source "JavaScriptTypedArray.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/kotlin/jni/TypedArrayKind;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u000f\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/TypedArrayKind;",
        "",
        "value",
        "",
        "(Ljava/lang/String;II)V",
        "getValue",
        "()I",
        "Int8Array",
        "Int16Array",
        "Int32Array",
        "Uint8Array",
        "Uint8ClampedArray",
        "Uint16Array",
        "Uint32Array",
        "Float32Array",
        "Float64Array",
        "BigInt64Array",
        "BigUint64Array",
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


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum BigInt64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum BigUint64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Float32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Float64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Int16Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Int32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Int8Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Uint16Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Uint32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Uint8Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

.field public static final enum Uint8ClampedArray:Lexpo/modules/kotlin/jni/TypedArrayKind;


# instance fields
.field private final value:I


# direct methods
.method private static final synthetic $values()[Lexpo/modules/kotlin/jni/TypedArrayKind;
    .locals 3

    const/16 v0, 0xb

    new-array v0, v0, [Lexpo/modules/kotlin/jni/TypedArrayKind;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Int8Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Int16Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Int32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint8Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint8ClampedArray:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint16Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Float32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->Float64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->BigInt64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lexpo/modules/kotlin/jni/TypedArrayKind;->BigUint64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 13

    .line 13
    new-instance v6, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v1, "Int8Array"

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v6, Lexpo/modules/kotlin/jni/TypedArrayKind;->Int8Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 14
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v8, "Int16Array"

    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Int16Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 15
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v2, "Int32Array"

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Int32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 16
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v8, "Uint8Array"

    const/4 v9, 0x3

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint8Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 17
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v2, "Uint8ClampedArray"

    const/4 v3, 0x4

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint8ClampedArray:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 18
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v8, "Uint16Array"

    const/4 v9, 0x5

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint16Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 19
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v2, "Uint32Array"

    const/4 v3, 0x6

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Uint32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 20
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v8, "Float32Array"

    const/4 v9, 0x7

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Float32Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 21
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v2, "Float64Array"

    const/16 v3, 0x8

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->Float64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 22
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v8, "BigInt64Array"

    const/16 v9, 0x9

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->BigInt64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    .line 23
    new-instance v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    const-string v2, "BigUint64Array"

    const/16 v3, 0xa

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->BigUint64Array:Lexpo/modules/kotlin/jni/TypedArrayKind;

    invoke-static {}, Lexpo/modules/kotlin/jni/TypedArrayKind;->$values()[Lexpo/modules/kotlin/jni/TypedArrayKind;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->$VALUES:[Lexpo/modules/kotlin/jni/TypedArrayKind;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lexpo/modules/kotlin/jni/TypedArrayKind;->value:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IIILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p4, p4, 0x1

    if-eqz p4, :cond_0

    .line 12
    invoke-static {}, Lexpo/modules/kotlin/jni/JavaScriptTypedArrayKt;->access$nextValue()I

    move-result p3

    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lexpo/modules/kotlin/jni/TypedArrayKind;-><init>(Ljava/lang/String;II)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lexpo/modules/kotlin/jni/TypedArrayKind;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/kotlin/jni/TypedArrayKind;
    .locals 1

    const-class v0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/kotlin/jni/TypedArrayKind;

    return-object p0
.end method

.method public static values()[Lexpo/modules/kotlin/jni/TypedArrayKind;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/jni/TypedArrayKind;->$VALUES:[Lexpo/modules/kotlin/jni/TypedArrayKind;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/kotlin/jni/TypedArrayKind;

    return-object v0
.end method


# virtual methods
.method public final getValue()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/jni/TypedArrayKind;->value:I

    return v0
.end method
