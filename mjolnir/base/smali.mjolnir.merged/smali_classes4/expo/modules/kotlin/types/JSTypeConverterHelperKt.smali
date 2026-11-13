.class public final Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;
.super Ljava/lang/Object;
.source "JSTypeConverterHelper.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJSTypeConverterHelper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JSTypeConverterHelper.kt\nexpo/modules/kotlin/types/JSTypeConverterHelperKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 KAnnotatedElements.kt\nkotlin/reflect/full/KAnnotatedElements\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,187:1\n1549#2:188\n1620#2,2:189\n288#2,2:192\n1622#2:195\n20#3:191\n1#4:194\n*S KotlinDebug\n*F\n+ 1 JSTypeConverterHelper.kt\nexpo/modules/kotlin/types/JSTypeConverterHelperKt\n*L\n26#1:188\n26#1:189,2\n27#1:192,2\n26#1:195\n27#1:191\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000h\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u0018\n\u0002\u0010\u0013\n\u0002\u0010\u0010\n\u0002\u0010\u0014\n\u0002\u0010\u0015\n\u0002\u0018\u0002\n\u0002\u0010\u001c\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0000\u001a\u0016\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004H\u0000\u001a\u001e\u0010\u0000\u001a\u00020\u0001*\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004H\u0000\u001a\n\u0010\u0008\u001a\u00020\u0007*\u00020\t\u001a\u0012\u0010\u0008\u001a\u00020\u0005*\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c\u001a\u0012\u0010\u0008\u001a\u00020\u0005*\u00020\r2\u0006\u0010\u000b\u001a\u00020\u000c\u001a\n\u0010\u0008\u001a\u00020\u0007*\u00020\u000e\u001a\n\u0010\u0008\u001a\u00020\u0007*\u00020\u000f\u001a\n\u0010\u0008\u001a\u00020\u0007*\u00020\u0010\u001a#\u0010\u0008\u001a\u00020\u0002\"\u0004\u0008\u0000\u0010\u0011*\u0008\u0012\u0004\u0012\u0002H\u00110\u00122\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0002\u0010\u0013\u001a\u0012\u0010\u0008\u001a\u00020\u0002*\u00020\u00142\u0006\u0010\u000b\u001a\u00020\u000c\u001a\u0012\u0010\u0008\u001a\u00020\u0002*\u00020\u00152\u0006\u0010\u000b\u001a\u00020\u000c\u001a\u0010\u0010\u0008\u001a\u0004\u0018\u00010\u0004*\u0006\u0012\u0002\u0008\u00030\u0016\u001a\u0012\u0010\u0008\u001a\u00020\u0002*\u00020\u00172\u0006\u0010\u000b\u001a\u00020\u000c\u001a\u0012\u0010\u0008\u001a\u00020\u0002*\u00020\u00182\u0006\u0010\u000b\u001a\u00020\u000c\u001a\u001a\u0010\u0008\u001a\u00020\u0002*\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u00192\u0006\u0010\u000b\u001a\u00020\u000c\u001a\u001e\u0010\u0008\u001a\u00020\u0002\"\u0004\u0008\u0000\u0010\u0011*\u0008\u0012\u0004\u0012\u0002H\u00110\u001a2\u0006\u0010\u000b\u001a\u00020\u000c\u001a*\u0010\u0008\u001a\u00020\u0005\"\u0004\u0008\u0000\u0010\u001b\"\u0004\u0008\u0001\u0010\u001c*\u000e\u0012\u0004\u0012\u0002H\u001b\u0012\u0004\u0012\u0002H\u001c0\u001d2\u0006\u0010\u000b\u001a\u00020\u000c\u00a8\u0006\u001e"
    }
    d2 = {
        "putGeneric",
        "",
        "Lcom/facebook/react/bridge/WritableArray;",
        "value",
        "",
        "Lcom/facebook/react/bridge/WritableMap;",
        "key",
        "",
        "toJSValue",
        "Landroid/net/Uri;",
        "Landroid/os/Bundle;",
        "containerProvider",
        "Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;",
        "Lexpo/modules/kotlin/records/Record;",
        "Ljava/io/File;",
        "Ljava/net/URI;",
        "Ljava/net/URL;",
        "T",
        "",
        "([Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;",
        "",
        "",
        "",
        "",
        "",
        "Lkotlin/Pair;",
        "",
        "K",
        "V",
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


# direct methods
.method public static final putGeneric(Lcom/facebook/react/bridge/WritableArray;Ljava/lang/Object;)V
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p1, :cond_0

    goto :goto_0

    .line 177
    :cond_0
    instance-of v0, p1, Lkotlin/Unit;

    if-eqz v0, :cond_1

    :goto_0
    invoke-interface {p0}, Lcom/facebook/react/bridge/WritableArray;->pushNull()V

    goto :goto_1

    .line 178
    :cond_1
    instance-of v0, p1, Lcom/facebook/react/bridge/ReadableArray;

    if-eqz v0, :cond_2

    check-cast p1, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_1

    .line 179
    :cond_2
    instance-of v0, p1, Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v0, :cond_3

    check-cast p1, Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_1

    .line 180
    :cond_3
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_4

    check-cast p1, Ljava/lang/String;

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    goto :goto_1

    .line 181
    :cond_4
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_5

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    goto :goto_1

    .line 182
    :cond_5
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_6

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-interface {p0, v0, v1}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    goto :goto_1

    .line 183
    :cond_6
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_7

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    :goto_1
    return-void

    .line 184
    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Could not put \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\' to WritableArray"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final putGeneric(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "key"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-nez p2, :cond_0

    goto :goto_0

    .line 164
    :cond_0
    instance-of v0, p2, Lkotlin/Unit;

    if-eqz v0, :cond_1

    :goto_0
    invoke-interface {p0, p1}, Lcom/facebook/react/bridge/WritableMap;->putNull(Ljava/lang/String;)V

    goto :goto_1

    .line 165
    :cond_1
    instance-of v0, p2, Lcom/facebook/react/bridge/ReadableArray;

    if-eqz v0, :cond_2

    check-cast p2, Lcom/facebook/react/bridge/ReadableArray;

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_1

    .line 166
    :cond_2
    instance-of v0, p2, Lcom/facebook/react/bridge/ReadableMap;

    if-eqz v0, :cond_3

    check-cast p2, Lcom/facebook/react/bridge/ReadableMap;

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_1

    .line 167
    :cond_3
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_4

    check-cast p2, Ljava/lang/String;

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 168
    :cond_4
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_5

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    move-result p2

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    goto :goto_1

    .line 169
    :cond_5
    instance-of v0, p2, Ljava/lang/Number;

    if-eqz v0, :cond_6

    check-cast p2, Ljava/lang/Number;

    invoke-virtual {p2}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    invoke-interface {p0, p1, v0, v1}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    goto :goto_1

    .line 170
    :cond_6
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_7

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-interface {p0, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    :goto_1
    return-void

    .line 171
    :cond_7
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Could not put \'"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\' to WritableMap"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final toJSValue(Ljava/lang/Iterable;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TT;>;",
            "Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;",
            ")",
            "Lcom/facebook/react/bridge/WritableArray;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    .line 66
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 67
    sget-object v2, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-virtual {v2, v1, p1}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object v1

    .line 68
    invoke-static {v0, v1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableArray;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static final toJSValue(Lkotlin/Pair;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/Pair<",
            "**>;",
            "Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;",
            ")",
            "Lcom/facebook/react/bridge/WritableArray;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 154
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    .line 155
    sget-object v1, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-virtual {p0}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object v1

    .line 156
    sget-object v2, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-virtual {p0}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v2, p0, p1}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object p0

    .line 157
    invoke-static {v0, v1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableArray;Ljava/lang/Object;)V

    .line 158
    invoke-static {v0, p0}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableArray;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static final toJSValue([DLexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;
    .locals 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 102
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    .line 103
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-wide v2, p0, v1

    .line 104
    invoke-interface {p1, v2, v3}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public static final toJSValue([FLexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;
    .locals 4

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    .line 95
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    float-to-double v2, v2

    .line 96
    invoke-interface {p1, v2, v3}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public static final toJSValue([ILexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    .line 87
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget v2, p0, v1

    .line 88
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public static final toJSValue([Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;",
            "Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;",
            ")",
            "Lcom/facebook/react/bridge/WritableArray;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 75
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    .line 77
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    .line 78
    sget-object v4, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-virtual {v4, v3, p1}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object v3

    .line 79
    invoke-static {v0, v3}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableArray;Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static final toJSValue([ZLexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableArray;
    .locals 3

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 110
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object p1

    .line 111
    array-length v0, p0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-boolean v2, p0, v1

    .line 112
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public static final toJSValue(Landroid/os/Bundle;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableMap;
    .locals 5

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 43
    invoke-virtual {p0}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 44
    invoke-virtual {p0, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 45
    sget-object v4, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-virtual {v4, v3, p1}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object v3

    .line 46
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {v0, v2, v3}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static final toJSValue(Lexpo/modules/kotlin/records/Record;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableMap;
    .locals 8

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 22
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 25
    invoke-static {v1}, Lkotlin/jvm/JvmClassMappingKt;->getKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    .line 26
    invoke-static {v1}, Lkotlin/reflect/full/KClasses;->getMemberProperties(Lkotlin/reflect/KClass;)Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 188
    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v1, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v2, Ljava/util/Collection;

    .line 189
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 190
    check-cast v3, Lkotlin/reflect/KProperty1;

    .line 27
    move-object v4, v3

    check-cast v4, Lkotlin/reflect/KAnnotatedElement;

    .line 191
    invoke-interface {v4}, Lkotlin/reflect/KAnnotatedElement;->getAnnotations()Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    .line 192
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Ljava/lang/annotation/Annotation;

    .line 191
    instance-of v7, v7, Lexpo/modules/kotlin/records/Field;

    if-eqz v7, :cond_0

    goto :goto_1

    :cond_1
    move-object v5, v6

    .line 193
    :goto_1
    check-cast v5, Lexpo/modules/kotlin/records/Field;

    check-cast v5, Ljava/lang/annotation/Annotation;

    .line 27
    check-cast v5, Lexpo/modules/kotlin/records/Field;

    if-nez v5, :cond_2

    goto :goto_2

    .line 28
    :cond_2
    invoke-interface {v5}, Lexpo/modules/kotlin/records/Field;->key()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    move-object v6, v4

    :cond_3
    if-nez v6, :cond_4

    invoke-interface {v3}, Lkotlin/reflect/KProperty1;->getName()Ljava/lang/String;

    move-result-object v6

    .line 30
    :cond_4
    move-object v4, v3

    check-cast v4, Lkotlin/reflect/KCallable;

    const/4 v5, 0x1

    invoke-static {v4, v5}, Lkotlin/reflect/jvm/KCallablesJvm;->setAccessible(Lkotlin/reflect/KCallable;Z)V

    .line 32
    invoke-interface {v3, p0}, Lkotlin/reflect/KProperty1;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 33
    sget-object v4, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-virtual {v4, v3, p1}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object v3

    .line 34
    invoke-static {v0, v6, v3}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    :goto_2
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 190
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 195
    :cond_5
    check-cast v2, Ljava/util/List;

    return-object v0
.end method

.method public static final toJSValue(Ljava/util/Map;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Lcom/facebook/react/bridge/WritableMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TK;+TV;>;",
            "Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;",
            ")",
            "Lcom/facebook/react/bridge/WritableMap;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "containerProvider"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    invoke-interface {p1}, Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 55
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    .line 56
    sget-object v3, Lexpo/modules/kotlin/types/JSTypeConverter;->INSTANCE:Lexpo/modules/kotlin/types/JSTypeConverter;

    invoke-virtual {v3, v1, p1}, Lexpo/modules/kotlin/types/JSTypeConverter;->convertToJSValue(Ljava/lang/Object;Lexpo/modules/kotlin/types/JSTypeConverter$ContainerProvider;)Ljava/lang/Object;

    move-result-object v1

    .line 57
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Lexpo/modules/kotlin/types/JSTypeConverterHelperKt;->putGeneric(Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static final toJSValue(Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-static {v0}, Lkotlin/reflect/full/KClasses;->getPrimaryConstructor(Lkotlin/reflect/KClass;)Lkotlin/reflect/KFunction;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 122
    invoke-interface {v0}, Lkotlin/reflect/KFunction;->getParameters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 123
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 124
    :cond_0
    invoke-interface {v0}, Lkotlin/reflect/KFunction;->getParameters()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_3

    .line 125
    invoke-interface {v0}, Lkotlin/reflect/KFunction;->getParameters()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/reflect/KParameter;

    invoke-interface {v0}, Lkotlin/reflect/KParameter;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 128
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    invoke-static {v1}, Lkotlin/reflect/full/KClasses;->getDeclaredMemberProperties(Lkotlin/reflect/KClass;)Ljava/util/Collection;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    .line 129
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lkotlin/reflect/KProperty1;

    invoke-interface {v3}, Lkotlin/reflect/KProperty1;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_0
    const-string v0, "null cannot be cast to non-null type kotlin.reflect.KProperty1<kotlin.Enum<*>, *>"

    .line 128
    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lkotlin/reflect/KProperty1;

    .line 131
    invoke-interface {v2, p0}, Lkotlin/reflect/KProperty1;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 134
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Enum \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, "\' cannot be used as return type (incompatible with JS)"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 118
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot convert enum without the primary constructor to js value"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final toJSValue(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "toString(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final toJSValue(Ljava/io/File;)Ljava/lang/String;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 150
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "getAbsolutePath(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final toJSValue(Ljava/net/URI;)Ljava/lang/String;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 146
    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "toString(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static final toJSValue(Ljava/net/URL;)Ljava/lang/String;
    .locals 1

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 138
    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "toString(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method
