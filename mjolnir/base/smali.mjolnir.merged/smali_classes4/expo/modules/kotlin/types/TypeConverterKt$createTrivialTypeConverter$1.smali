.class public final Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;
.super Lkotlin/jvm/internal/Lambda;
.source "TypeConverter.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/kotlin/types/TypeConverterKt;->createTrivialTypeConverter$default(ZLexpo/modules/kotlin/jni/ExpectedType;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Lexpo/modules/kotlin/types/TypeConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTypeConverter.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TypeConverter.kt\nexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1\n*L\n1#1,87:1\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010\u0001\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001\"\n\u0008\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\n\u00a2\u0006\u0002\u0008\u0006"
    }
    d2 = {
        "<anonymous>",
        "",
        "T",
        "",
        "it",
        "Lcom/facebook/react/bridge/Dynamic;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0xb0
.end annotation


# static fields
.field public static final INSTANCE:Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;

    invoke-direct {v0}, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;-><init>()V

    sput-object v0, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;->INSTANCE:Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 79
    check-cast p1, Lcom/facebook/react/bridge/Dynamic;

    invoke-virtual {p0, p1}, Lexpo/modules/kotlin/types/TypeConverterKt$createTrivialTypeConverter$1;->invoke(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public final invoke(Lcom/facebook/react/bridge/Dynamic;)Ljava/lang/Void;
    .locals 2

    const-string v0, "it"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 79
    new-instance p1, Lexpo/modules/kotlin/exception/UnsupportedClass;

    const/4 v0, 0x4

    const-string v1, "T"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v0, Ljava/lang/Object;

    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v0

    invoke-direct {p1, v0}, Lexpo/modules/kotlin/exception/UnsupportedClass;-><init>(Lkotlin/reflect/KClass;)V

    throw p1
.end method
