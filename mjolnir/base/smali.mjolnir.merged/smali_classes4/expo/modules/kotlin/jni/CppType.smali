.class public final enum Lexpo/modules/kotlin/jni/CppType;
.super Ljava/lang/Enum;
.source "CppType.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lexpo/modules/kotlin/jni/CppType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u001a\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u001d\u0008\u0002\u0012\n\u0010\u0002\u001a\u0006\u0012\u0002\u0008\u00030\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006R\u0015\u0010\u0002\u001a\u0006\u0012\u0002\u0008\u00030\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\rj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010j\u0002\u0008\u0011j\u0002\u0008\u0012j\u0002\u0008\u0013j\u0002\u0008\u0014j\u0002\u0008\u0015j\u0002\u0008\u0016j\u0002\u0008\u0017j\u0002\u0008\u0018j\u0002\u0008\u0019j\u0002\u0008\u001aj\u0002\u0008\u001bj\u0002\u0008\u001cj\u0002\u0008\u001dj\u0002\u0008\u001e\u00a8\u0006\u001f"
    }
    d2 = {
        "Lexpo/modules/kotlin/jni/CppType;",
        "",
        "clazz",
        "Lkotlin/reflect/KClass;",
        "value",
        "",
        "(Ljava/lang/String;ILkotlin/reflect/KClass;I)V",
        "getClazz",
        "()Lkotlin/reflect/KClass;",
        "getValue",
        "()I",
        "NONE",
        "DOUBLE",
        "INT",
        "LONG",
        "FLOAT",
        "BOOLEAN",
        "STRING",
        "JS_OBJECT",
        "JS_VALUE",
        "READABLE_ARRAY",
        "READABLE_MAP",
        "UINT8_TYPED_ARRAY",
        "TYPED_ARRAY",
        "PRIMITIVE_ARRAY",
        "LIST",
        "MAP",
        "VIEW_TAG",
        "SHARED_OBJECT_ID",
        "JS_FUNCTION",
        "ANY",
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

.field private static final synthetic $VALUES:[Lexpo/modules/kotlin/jni/CppType;

.field public static final enum ANY:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum BOOLEAN:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum DOUBLE:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum FLOAT:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum INT:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum JS_FUNCTION:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum JS_OBJECT:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum JS_VALUE:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum LIST:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum LONG:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum MAP:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum NONE:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum PRIMITIVE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum READABLE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum READABLE_MAP:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum SHARED_OBJECT_ID:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum STRING:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum TYPED_ARRAY:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum UINT8_TYPED_ARRAY:Lexpo/modules/kotlin/jni/CppType;

.field public static final enum VIEW_TAG:Lexpo/modules/kotlin/jni/CppType;


# instance fields
.field private final clazz:Lkotlin/reflect/KClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/reflect/KClass<",
            "*>;"
        }
    .end annotation
.end field

.field private final value:I


# direct methods
.method private static final synthetic $values()[Lexpo/modules/kotlin/jni/CppType;
    .locals 3

    const/16 v0, 0x14

    new-array v0, v0, [Lexpo/modules/kotlin/jni/CppType;

    const/4 v1, 0x0

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->NONE:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->DOUBLE:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->INT:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->LONG:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->FLOAT:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->BOOLEAN:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->STRING:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->JS_OBJECT:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->JS_VALUE:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->READABLE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->READABLE_MAP:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->UINT8_TYPED_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->TYPED_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->PRIMITIVE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->LIST:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->MAP:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->VIEW_TAG:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->SHARED_OBJECT_ID:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->JS_FUNCTION:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    const/16 v1, 0x13

    sget-object v2, Lexpo/modules/kotlin/jni/CppType;->ANY:Lexpo/modules/kotlin/jni/CppType;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 18

    .line 16
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-class v1, Ljava/lang/Void;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    const-string v2, "NONE"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1, v3}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;I)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->NONE:Lexpo/modules/kotlin/jni/CppType;

    .line 17
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v5, "DOUBLE"

    const/4 v6, 0x1

    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v7

    const/4 v8, 0x0

    const/4 v9, 0x2

    const/4 v10, 0x0

    move-object v4, v0

    invoke-direct/range {v4 .. v10}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->DOUBLE:Lexpo/modules/kotlin/jni/CppType;

    .line 18
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v12, "INT"

    const/4 v13, 0x2

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v14

    const/4 v15, 0x0

    const/16 v16, 0x2

    const/16 v17, 0x0

    move-object v11, v0

    invoke-direct/range {v11 .. v17}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->INT:Lexpo/modules/kotlin/jni/CppType;

    .line 19
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "LONG"

    const/4 v3, 0x3

    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->LONG:Lexpo/modules/kotlin/jni/CppType;

    .line 20
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "FLOAT"

    const/4 v10, 0x4

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v14, 0x0

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->FLOAT:Lexpo/modules/kotlin/jni/CppType;

    .line 21
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "BOOLEAN"

    const/4 v3, 0x5

    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->BOOLEAN:Lexpo/modules/kotlin/jni/CppType;

    .line 22
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "STRING"

    const/4 v10, 0x6

    const-class v1, Ljava/lang/String;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->STRING:Lexpo/modules/kotlin/jni/CppType;

    .line 23
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "JS_OBJECT"

    const/4 v3, 0x7

    const-class v1, Lexpo/modules/kotlin/jni/JavaScriptObject;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->JS_OBJECT:Lexpo/modules/kotlin/jni/CppType;

    .line 24
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "JS_VALUE"

    const/16 v10, 0x8

    const-class v1, Lexpo/modules/kotlin/jni/JavaScriptValue;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->JS_VALUE:Lexpo/modules/kotlin/jni/CppType;

    .line 25
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "READABLE_ARRAY"

    const/16 v3, 0x9

    const-class v1, Lcom/facebook/react/bridge/ReadableArray;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->READABLE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    .line 26
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "READABLE_MAP"

    const/16 v10, 0xa

    const-class v1, Lcom/facebook/react/bridge/ReadableMap;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->READABLE_MAP:Lexpo/modules/kotlin/jni/CppType;

    .line 27
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "UINT8_TYPED_ARRAY"

    const/16 v3, 0xb

    const-class v1, [B

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->UINT8_TYPED_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    .line 28
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "TYPED_ARRAY"

    const/16 v10, 0xc

    const-class v1, Lexpo/modules/kotlin/typedarray/TypedArray;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->TYPED_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    .line 29
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "PRIMITIVE_ARRAY"

    const/16 v3, 0xd

    const-class v1, [Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->PRIMITIVE_ARRAY:Lexpo/modules/kotlin/jni/CppType;

    .line 30
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "LIST"

    const/16 v10, 0xe

    const-class v1, Ljava/util/List;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->LIST:Lexpo/modules/kotlin/jni/CppType;

    .line 31
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "MAP"

    const/16 v3, 0xf

    const-class v1, Ljava/util/Map;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->MAP:Lexpo/modules/kotlin/jni/CppType;

    .line 32
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "VIEW_TAG"

    const/16 v10, 0x10

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->VIEW_TAG:Lexpo/modules/kotlin/jni/CppType;

    .line 33
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "SHARED_OBJECT_ID"

    const/16 v3, 0x11

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->SHARED_OBJECT_ID:Lexpo/modules/kotlin/jni/CppType;

    .line 34
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v9, "JS_FUNCTION"

    const/16 v10, 0x12

    const-class v1, Lexpo/modules/kotlin/jni/JavaScriptFunction;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v11

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->JS_FUNCTION:Lexpo/modules/kotlin/jni/CppType;

    .line 35
    new-instance v0, Lexpo/modules/kotlin/jni/CppType;

    const-string v2, "ANY"

    const/16 v3, 0x13

    const-class v1, Ljava/lang/Object;

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->ANY:Lexpo/modules/kotlin/jni/CppType;

    invoke-static {}, Lexpo/modules/kotlin/jni/CppType;->$values()[Lexpo/modules/kotlin/jni/CppType;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->$VALUES:[Lexpo/modules/kotlin/jni/CppType;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lexpo/modules/kotlin/jni/CppType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILkotlin/reflect/KClass;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/reflect/KClass<",
            "*>;I)V"
        }
    .end annotation

    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lexpo/modules/kotlin/jni/CppType;->clazz:Lkotlin/reflect/KClass;

    iput p4, p0, Lexpo/modules/kotlin/jni/CppType;->value:I

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILkotlin/reflect/KClass;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p5, p5, 0x2

    if-eqz p5, :cond_0

    .line 15
    invoke-static {}, Lexpo/modules/kotlin/jni/CppTypeKt;->access$nextValue()I

    move-result p4

    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Lexpo/modules/kotlin/jni/CppType;-><init>(Ljava/lang/String;ILkotlin/reflect/KClass;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lexpo/modules/kotlin/jni/CppType;",
            ">;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/kotlin/jni/CppType;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lexpo/modules/kotlin/jni/CppType;
    .locals 1

    const-class v0, Lexpo/modules/kotlin/jni/CppType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lexpo/modules/kotlin/jni/CppType;

    return-object p0
.end method

.method public static values()[Lexpo/modules/kotlin/jni/CppType;
    .locals 1

    sget-object v0, Lexpo/modules/kotlin/jni/CppType;->$VALUES:[Lexpo/modules/kotlin/jni/CppType;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lexpo/modules/kotlin/jni/CppType;

    return-object v0
.end method


# virtual methods
.method public final getClazz()Lkotlin/reflect/KClass;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/reflect/KClass<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lexpo/modules/kotlin/jni/CppType;->clazz:Lkotlin/reflect/KClass;

    return-object v0
.end method

.method public final getValue()I
    .locals 1

    iget v0, p0, Lexpo/modules/kotlin/jni/CppType;->value:I

    return v0
.end method
