.class public final Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$12;
.super Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;
.source "TypeConverter.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/types/TypeConverterProviderImpl;->createCachedConverters(Z)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lexpo/modules/kotlin/types/DynamicAwareTypeConverters<",
        "[Z>;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TypeConverter.kt\nexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$2\n+ 2 TypeConverterProvider.kt\nexpo/modules/kotlin/types/TypeConverterProviderImpl\n*L\n1#1,87:1\n237#2,3:88\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00028\u00000\u0001J\u0015\u0010\u0002\u001a\u00028\u00002\u0006\u0010\u0003\u001a\u00020\u0004H\u0016\u00a2\u0006\u0002\u0010\u0005J\u0015\u0010\u0006\u001a\u00028\u00002\u0006\u0010\u0003\u001a\u00020\u0007H\u0016\u00a2\u0006\u0002\u0010\u0008J\u0008\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b\u00b8\u0006\u0000"
    }
    d2 = {
        "expo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$2",
        "Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;",
        "convertFromAny",
        "value",
        "",
        "(Ljava/lang/Object;)Ljava/lang/Object;",
        "convertFromDynamic",
        "Lcom/facebook/react/bridge/Dynamic;",
        "(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Object;",
        "getCppRequiredTypes",
        "Lexpo/modules/kotlin/jni/ExpectedType;",
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


# instance fields
.field final synthetic $cppRequireType:Lexpo/modules/kotlin/jni/ExpectedType;


# direct methods
.method public constructor <init>(ZLexpo/modules/kotlin/jni/ExpectedType;)V
    .locals 0

    iput-object p2, p0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$12;->$cppRequireType:Lexpo/modules/kotlin/jni/ExpectedType;

    .line 81
    invoke-direct {p0, p1}, Lexpo/modules/kotlin/types/DynamicAwareTypeConverters;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public convertFromAny(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")[Z"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    check-cast p1, [Z

    return-object p1
.end method

.method public convertFromDynamic(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/Dynamic;",
            ")[Z"
        }
    .end annotation

    const-string v0, "value"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    invoke-interface {p1}, Lcom/facebook/react/bridge/Dynamic;->asArray()Lcom/facebook/react/bridge/ReadableArray;

    move-result-object p1

    .line 89
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v0

    new-array v1, v0, [Z

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 90
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableArray;->getBoolean(I)Z

    move-result v3

    aput-boolean v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public getCppRequiredTypes()Lexpo/modules/kotlin/jni/ExpectedType;
    .locals 1

    iget-object v0, p0, Lexpo/modules/kotlin/types/TypeConverterProviderImpl$createCachedConverters$$inlined$createTrivialTypeConverter$12;->$cppRequireType:Lexpo/modules/kotlin/jni/ExpectedType;

    return-object v0
.end method
