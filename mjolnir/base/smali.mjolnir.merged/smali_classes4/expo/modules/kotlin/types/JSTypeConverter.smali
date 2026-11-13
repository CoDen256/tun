.class public final Lexpo/modules/kotlin/types/JSTypeConverter;
.super Ljava/lang/Object;
.source "JSTypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;,
        Lexpo/modules/kotlin/types/JSTypeConverter$DefaultContainerProvider;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0002\u0007\u0008B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u00012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u00012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u00a8\u0006\t"
    }
    d2 = {
        "Lexpo/modules/kotlin/types/JSTypeConverter;",
        "",
        "()V",
        "convertToJSValue",
        "value",
        "containerProvider",
        "Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;",
        "ContainerProvider",
        "DefaultContainerProvider",
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
.field public static final INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-direct {v0}, Lexpo/modules/kotlin/types/JSTypeConverter;-><init>()V

    sput-object v0, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic convertToJSValue$default(Lexpo/modules/kotlin/types/JSTypeConverter;Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;ILjava/lang/Object;)Ljava/lang/Object;
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 26
    sget-object p2, Lexpo/modules/kotlin/types/JSTypeConverter$DefaultContainerProvider;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter$DefaultContainerProvider;

    check-cast p2, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;

    :cond_0
    invoke-virtual {p0, p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;
    .locals 1

    const-string v0, "containerProvider"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p1, :cond_0

    goto :goto_0

    .line 28
    :cond_0
    instance-of v0, p1, Lkotlin/Unit;

    if-eqz v0, :cond_1

    :goto_0
    const/4 p1, 0x0

    goto/16 :goto_1

    .line 29
    :cond_1
    instance-of v0, p1, Landroid/os/Bundle;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/os/Bundle;

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Landroid/os/Bundle;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    goto/16 :goto_1

    .line 30
    :cond_2
    instance-of v0, p1, [Ljava/lang/Object;

    if-eqz v0, :cond_3

    check-cast p1, [Ljava/lang/Object;

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue([Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    goto/16 :goto_1

    .line 31
    :cond_3
    instance-of v0, p1, [I

    if-eqz v0, :cond_4

    check-cast p1, [I

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue([ILexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    goto/16 :goto_1

    .line 32
    :cond_4
    instance-of v0, p1, [F

    if-eqz v0, :cond_5

    check-cast p1, [F

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue([FLexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    goto/16 :goto_1

    .line 33
    :cond_5
    instance-of v0, p1, [D

    if-eqz v0, :cond_6

    check-cast p1, [D

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue([DLexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    goto/16 :goto_1

    .line 34
    :cond_6
    instance-of v0, p1, [Z

    if-eqz v0, :cond_7

    check-cast p1, [Z

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue([ZLexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    goto/16 :goto_1

    .line 35
    :cond_7
    instance-of v0, p1, [B

    if-eqz v0, :cond_8

    sget-object p2, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter;->Companion:Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;

    invoke-virtual {p2, p1}, Lexpo/modules/kotlin/types/folly/FollyDynamicExtensionConverter$Companion;->put(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_1

    .line 36
    :cond_8
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_9

    check-cast p1, Ljava/util/Map;

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Ljava/util/Map;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    goto/16 :goto_1

    .line 37
    :cond_9
    instance-of v0, p1, Ljava/lang/Enum;

    if-eqz v0, :cond_a

    check-cast p1, Ljava/lang/Enum;

    invoke-static {p1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Ljava/lang/Enum;)Ljava/lang/Object;

    move-result-object p1

    goto/16 :goto_1

    .line 38
    :cond_a
    instance-of v0, p1, Lexpo/modules/kotlin/records/Record;

    if-eqz v0, :cond_b

    check-cast p1, Lexpo/modules/kotlin/records/Record;

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Lexpo/modules/kotlin/records/Record;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    goto :goto_1

    .line 39
    :cond_b
    instance-of v0, p1, Ljava/net/URI;

    if-eqz v0, :cond_c

    check-cast p1, Ljava/net/URI;

    invoke-static {p1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Ljava/net/URI;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 40
    :cond_c
    instance-of v0, p1, Ljava/net/URL;

    if-eqz v0, :cond_d

    check-cast p1, Ljava/net/URL;

    invoke-static {p1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 41
    :cond_d
    instance-of v0, p1, Landroid/net/Uri;

    if-eqz v0, :cond_e

    check-cast p1, Landroid/net/Uri;

    invoke-static {p1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 42
    :cond_e
    instance-of v0, p1, Ljava/io/File;

    if-eqz v0, :cond_f

    check-cast p1, Ljava/io/File;

    invoke-static {p1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Ljava/io/File;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 43
    :cond_f
    instance-of v0, p1, Lkotlin/Pair;

    if-eqz v0, :cond_10

    check-cast p1, Lkotlin/Pair;

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Lkotlin/Pair;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    goto :goto_1

    .line 44
    :cond_10
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_11

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide p1

    long-to-double p1, p1

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    goto :goto_1

    .line 45
    :cond_11
    instance-of v0, p1, Lexpo/modules/kotlin/typedarray/RawTypedArrayHolder;

    if-eqz v0, :cond_12

    check-cast p1, Lexpo/modules/kotlin/typedarray/RawTypedArrayHolder;

    invoke-interface {p1}, Lexpo/modules/kotlin/typedarray/RawTypedArrayHolder;->getRawArray()Lexpo/modules/kotlin/jni/JavaScriptTypedArray;

    move-result-object p1

    goto :goto_1

    .line 46
    :cond_12
    instance-of v0, p1, Ljava/lang/Iterable;

    if-eqz v0, :cond_13

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, p2}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->toJSValue(Ljava/lang/Iterable;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    :cond_13
    :goto_1
    return-object p1
.end method
