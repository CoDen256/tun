.class public final Lcom/revenuecat/purchases/react/RNPurchasesConverters;
.super Ljava/lang/Object;
.source "RNPurchasesConverters.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/revenuecat/purchases/react/RNPurchasesConverters$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRNPurchasesConverters.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RNPurchasesConverters.kt\ncom/revenuecat/purchases/react/RNPurchasesConverters\n+ 2 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n*L\n1#1,96:1\n37#2,2:97\n37#2,2:99\n*S KotlinDebug\n*F\n+ 1 RNPurchasesConverters.kt\ncom/revenuecat/purchases/react/RNPurchasesConverters\n*L\n70#1:97,2\n90#1:99,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u001d\u0010\u0003\u001a\u00020\u00042\u000e\u0010\u0005\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0006H\u0002\u00a2\u0006\u0002\u0010\u0007J\u001a\u0010\u0008\u001a\u00020\t2\u0010\u0010\n\u001a\u000c\u0012\u0004\u0012\u00020\u000c\u0012\u0002\u0008\u00030\u000bH\u0007J\u0010\u0010\r\u001a\u00020\u000e2\u0008\u0010\u000f\u001a\u0004\u0018\u00010\u0010J\u0012\u0010\u0011\u001a\u00020\u00122\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0007\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/revenuecat/purchases/react/RNPurchasesConverters;",
        "",
        "()V",
        "convertArrayToWritableArray",
        "Lcom/facebook/react/bridge/WritableArray;",
        "array",
        "",
        "([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;",
        "convertMapToWriteableMap",
        "Lcom/facebook/react/bridge/WritableMap;",
        "map",
        "",
        "",
        "convertReadableArrayToJson",
        "Lorg/json/JSONArray;",
        "readableArray",
        "Lcom/facebook/react/bridge/ReadableArray;",
        "convertReadableMapToJson",
        "Lorg/json/JSONObject;",
        "readableMap",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "react-native-purchases_release"
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
.field public static final INSTANCE:Lcom/revenuecat/purchases/react/RNPurchasesConverters;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/react/RNPurchasesConverters;

    invoke-direct {v0}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->INSTANCE:Lcom/revenuecat/purchases/react/RNPurchasesConverters;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final convertArrayToWritableArray([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;
    .locals 6

    .line 59
    new-instance v0, Lcom/facebook/react/bridge/WritableNativeArray;

    invoke-direct {v0}, Lcom/facebook/react/bridge/WritableNativeArray;-><init>()V

    check-cast v0, Lcom/facebook/react/bridge/WritableArray;

    .line 60
    array-length v1, p1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_9

    aget-object v4, p1, v3

    if-nez v4, :cond_0

    .line 62
    invoke-interface {v0}, Lcom/facebook/react/bridge/WritableArray;->pushNull()V

    goto/16 :goto_1

    .line 63
    :cond_0
    instance-of v5, v4, Ljava/lang/Boolean;

    if-eqz v5, :cond_1

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    goto/16 :goto_1

    .line 64
    :cond_1
    instance-of v5, v4, Ljava/lang/Integer;

    if-eqz v5, :cond_2

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->intValue()I

    move-result v4

    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    goto :goto_1

    .line 65
    :cond_2
    instance-of v5, v4, Ljava/lang/Long;

    if-eqz v5, :cond_3

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->longValue()J

    move-result-wide v4

    long-to-double v4, v4

    invoke-interface {v0, v4, v5}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    goto :goto_1

    .line 66
    :cond_3
    instance-of v5, v4, Ljava/lang/Double;

    if-eqz v5, :cond_4

    check-cast v4, Ljava/lang/Number;

    invoke-virtual {v4}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v4

    invoke-interface {v0, v4, v5}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    goto :goto_1

    .line 67
    :cond_4
    instance-of v5, v4, Ljava/lang/String;

    if-eqz v5, :cond_5

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    goto :goto_1

    .line 68
    :cond_5
    instance-of v5, v4, Ljava/util/Map;

    if-eqz v5, :cond_6

    const-string v5, "null cannot be cast to non-null type kotlin.collections.Map<kotlin.String, *>"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, Ljava/util/Map;

    invoke-static {v4}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v4

    check-cast v4, Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_1

    .line 69
    :cond_6
    instance-of v5, v4, [Ljava/lang/Object;

    if-eqz v5, :cond_7

    const-string v5, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, [Ljava/lang/Object;

    invoke-direct {p0, v4}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertArrayToWritableArray([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v4

    check-cast v4, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_1

    .line 70
    :cond_7
    instance-of v5, v4, Ljava/util/List;

    if-eqz v5, :cond_8

    check-cast v4, Ljava/util/Collection;

    new-array v5, v2, [Ljava/lang/Object;

    .line 98
    invoke-interface {v4, v5}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    .line 70
    invoke-direct {p0, v4}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertArrayToWritableArray([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v4

    check-cast v4, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v0, v4}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    :cond_8
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_9
    return-object v0
.end method

.method public static final convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Lcom/facebook/react/bridge/WritableMap;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "map"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    new-instance v0, Lcom/facebook/react/bridge/WritableNativeMap;

    invoke-direct {v0}, Lcom/facebook/react/bridge/WritableNativeMap;-><init>()V

    check-cast v0, Lcom/facebook/react/bridge/WritableMap;

    .line 80
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_1

    .line 82
    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableMap;->putNull(Ljava/lang/String;)V

    goto :goto_0

    .line 83
    :cond_1
    instance-of v3, v1, Ljava/lang/Boolean;

    if-eqz v3, :cond_2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 84
    :cond_2
    instance-of v3, v1, Ljava/lang/Integer;

    if-eqz v3, :cond_3

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    .line 85
    :cond_3
    instance-of v3, v1, Ljava/lang/Long;

    if-eqz v3, :cond_4

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    long-to-double v3, v3

    invoke-interface {v0, v2, v3, v4}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    .line 86
    :cond_4
    instance-of v3, v1, Ljava/lang/Double;

    if-eqz v3, :cond_5

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    .line 87
    :cond_5
    instance-of v3, v1, Ljava/lang/String;

    if-eqz v3, :cond_6

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 88
    :cond_6
    instance-of v3, v1, Ljava/util/Map;

    if-eqz v3, :cond_7

    const-string v3, "null cannot be cast to non-null type kotlin.collections.Map<kotlin.String, *>"

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/util/Map;

    invoke-static {v1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertMapToWriteableMap(Ljava/util/Map;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_0

    .line 89
    :cond_7
    instance-of v3, v1, [Ljava/lang/Object;

    if-eqz v3, :cond_8

    sget-object v3, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->INSTANCE:Lcom/revenuecat/purchases/react/RNPurchasesConverters;

    const-string v4, "null cannot be cast to non-null type kotlin.Array<kotlin.Any?>"

    invoke-static {v1, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, [Ljava/lang/Object;

    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertArrayToWritableArray([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto/16 :goto_0

    .line 90
    :cond_8
    instance-of v3, v1, Ljava/util/List;

    if-eqz v3, :cond_0

    sget-object v3, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->INSTANCE:Lcom/revenuecat/purchases/react/RNPurchasesConverters;

    check-cast v1, Ljava/util/Collection;

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    .line 100
    invoke-interface {v1, v4}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .line 90
    invoke-direct {v3, v1}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertArrayToWritableArray([Ljava/lang/Object;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto/16 :goto_0

    :cond_9
    return-object v0
.end method

.method public static final convertReadableMapToJson(Lcom/facebook/react/bridge/ReadableMap;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 18
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 19
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p0}, Lcom/facebook/react/bridge/ReadableMap;->keySetIterator()Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    move-result-object v1

    const-string v2, "keySetIterator(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    :goto_0
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->hasNextKey()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 21
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->nextKey()Ljava/lang/String;

    move-result-object v2

    .line 22
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getType(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableType;

    move-result-object v3

    sget-object v4, Lcom/revenuecat/purchases/react/RNPurchasesConverters$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/facebook/react/bridge/ReadableType;->ordinal()I

    move-result v3

    aget v3, v4, v3

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object v3, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->INSTANCE:Lcom/revenuecat/purchases/react/RNPurchasesConverters;

    .line 34
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getArray(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertReadableArrayToJson(Lcom/facebook/react/bridge/ReadableArray;)Lorg/json/JSONArray;

    move-result-object v3

    .line 32
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 29
    :pswitch_1
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    invoke-static {v3}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertReadableMapToJson(Lcom/facebook/react/bridge/ReadableMap;)Lorg/json/JSONObject;

    move-result-object v3

    .line 27
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 26
    :pswitch_2
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 25
    :pswitch_3
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getDouble(Ljava/lang/String;)D

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    goto :goto_0

    .line 24
    :pswitch_4
    invoke-interface {p0, v2}, Lcom/facebook/react/bridge/ReadableMap;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_0

    .line 23
    :pswitch_5
    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_0
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final convertReadableArrayToJson(Lcom/facebook/react/bridge/ReadableArray;)Lorg/json/JSONArray;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 43
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 44
    invoke-static {p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_5

    .line 45
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getType(I)Lcom/facebook/react/bridge/ReadableType;

    move-result-object v3

    sget-object v4, Lcom/revenuecat/purchases/react/RNPurchasesConverters$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v3}, Lcom/facebook/react/bridge/ReadableType;->ordinal()I

    move-result v3

    aget v3, v4, v3

    const/4 v4, 0x2

    if-eq v3, v4, :cond_4

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3

    const/4 v4, 0x4

    if-eq v3, v4, :cond_2

    const/4 v4, 0x5

    if-eq v3, v4, :cond_1

    const/4 v4, 0x6

    if-eq v3, v4, :cond_0

    goto :goto_1

    .line 51
    :cond_0
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getArray(I)Lcom/facebook/react/bridge/ReadableArray;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertReadableArrayToJson(Lcom/facebook/react/bridge/ReadableArray;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 50
    :cond_1
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    invoke-static {v3}, Lcom/revenuecat/purchases/react/RNPurchasesConverters;->convertReadableMapToJson(Lcom/facebook/react/bridge/ReadableMap;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 49
    :cond_2
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 48
    :cond_3
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getDouble(I)D

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONArray;->put(D)Lorg/json/JSONArray;

    goto :goto_1

    .line 47
    :cond_4
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getBoolean(I)Z

    move-result v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_5
    return-object v0
.end method
