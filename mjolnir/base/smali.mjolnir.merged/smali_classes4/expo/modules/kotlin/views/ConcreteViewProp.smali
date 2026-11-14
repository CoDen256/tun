.class public final Lexpo/modules/kotlin/views/ConcreteViewProp;
.super Lexpo/modules/kotlin/views/AnyViewProp;
.source "ConcreteViewProp.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ViewType:",
        "Landroid/view/View;",
        "PropType:",
        "Ljava/lang/Object;",
        ">",
        "Lexpo/modules/kotlin/views/AnyViewProp;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nConcreteViewProp.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ConcreteViewProp.kt\nexpo/modules/kotlin/views/ConcreteViewProp\n+ 2 ExceptionDecorator.kt\nexpo/modules/kotlin/exception/ExceptionDecoratorKt\n+ 3 CodedException.kt\nexpo/modules/kotlin/exception/CodedExceptionKt\n*L\n1#1,27:1\n5#2,4:28\n11#3,5:32\n*S KotlinDebug\n*F\n+ 1 ConcreteViewProp.kt\nexpo/modules/kotlin/views/ConcreteViewProp\n*L\n18#1:28,4\n18#1:32,5\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u0002*\u0004\u0008\u0001\u0010\u00032\u00020\u0004BM\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00126\u0010\t\u001a2\u0012\u0013\u0012\u00118\u0000\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u000c\u0012\u0013\u0012\u00118\u0001\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\r\u0012\u0004\u0012\u00020\u000e0\n\u00a2\u0006\u0002\u0010\u000fJ\"\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00022\u0008\u0010\u0016\u001a\u0004\u0018\u00010\u0017H\u0016R\u0014\u0010\u0010\u001a\u00020\u0011X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0012R>\u0010\t\u001a2\u0012\u0013\u0012\u00118\u0000\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\u000c\u0012\u0013\u0012\u00118\u0001\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u0005\u0012\u0004\u0008\u0008(\r\u0012\u0004\u0012\u00020\u000e0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lexpo/modules/kotlin/views/ConcreteViewProp;",
        "ViewType",
        "Landroid/view/View;",
        "PropType",
        "Lexpo/modules/kotlin/views/AnyViewProp;",
        "name",
        "",
        "propType",
        "Lexpo/modules/kotlin/types/AnyType;",
        "setter",
        "Lkotlin/Function2;",
        "Lkotlin/ParameterName;",
        "view",
        "prop",
        "",
        "(Ljava/lang/String;Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V",
        "isNullable",
        "",
        "()Z",
        "set",
        "Lcom/facebook/react/bridge/Dynamic;",
        "onView",
        "appContext",
        "Lexpo/modules/kotlin/AppContext;",
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
.field private final isNullable:Z

.field private final setter:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "TViewType;TPropType;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lexpo/modules/kotlin/types/AnyType;Lkotlin/jvm/functions/Function2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lexpo/modules/kotlin/types/AnyType;",
            "Lkotlin/jvm/functions/Function2<",
            "-TViewType;-TPropType;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "propType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "setter"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-direct {p0, p1, p2}, Lexpo/modules/kotlin/views/AnyViewProp;-><init>(Ljava/lang/String;Lexpo/modules/kotlin/types/AnyType;)V

    iput-object p3, p0, Lexpo/modules/kotlin/views/ConcreteViewProp;->setter:Lkotlin/jvm/functions/Function2;

    .line 25
    invoke-virtual {p2}, Lexpo/modules/kotlin/types/AnyType;->getKType()Lkotlin/reflect/KType;

    move-result-object p1

    invoke-interface {p1}, Lkotlin/reflect/KType;->isMarkedNullable()Z

    move-result p1

    iput-boolean p1, p0, Lexpo/modules/kotlin/views/ConcreteViewProp;->isNullable:Z

    return-void
.end method


# virtual methods
.method public isNullable()Z
    .locals 1

    iget-boolean v0, p0, Lexpo/modules/kotlin/views/ConcreteViewProp;->isNullable:Z

    return v0
.end method

.method public set(Lcom/facebook/react/bridge/Dynamic;Landroid/view/View;Lexpo/modules/kotlin/AppContext;)V
    .locals 2

    const-string v0, "prop"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onView"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lexpo/modules/kotlin/views/ConcreteViewProp;->setter:Lkotlin/jvm/functions/Function2;

    .line 21
    invoke-virtual {p0}, Lexpo/modules/kotlin/views/ConcreteViewProp;->getType$expo_modules_core_release()Lexpo/modules/kotlin/types/AnyType;

    move-result-object v1

    invoke-virtual {v1, p1, p3}, Lexpo/modules/kotlin/types/AnyType;->convert(Ljava/lang/Object;Lexpo/modules/kotlin/AppContext;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 33
    instance-of p3, p1, Lexpo/modules/kotlin/exception/CodedException;

    if-nez p3, :cond_1

    .line 34
    instance-of p3, p1, Lexpo/modules/core/errors/CodedException;

    if-eqz p3, :cond_0

    new-instance p3, Lexpo/modules/kotlin/exception/CodedException;

    move-object v0, p1

    check-cast v0, Lexpo/modules/core/errors/CodedException;

    invoke-virtual {v0}, Lexpo/modules/core/errors/CodedException;->getCode()Ljava/lang/String;

    move-result-object v0

    const-string v1, "getCode(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-direct {p3, v0, v1, p1}, Lexpo/modules/kotlin/exception/CodedException;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 35
    :cond_0
    new-instance p3, Lexpo/modules/kotlin/exception/UnexpectedException;

    invoke-direct {p3, p1}, Lexpo/modules/kotlin/exception/UnexpectedException;-><init>(Ljava/lang/Throwable;)V

    check-cast p3, Lexpo/modules/kotlin/exception/CodedException;

    goto :goto_0

    .line 33
    :cond_1
    move-object p3, p1

    check-cast p3, Lexpo/modules/kotlin/exception/CodedException;

    .line 19
    :goto_0
    new-instance p1, Lexpo/modules/kotlin/exception/PropSetException;

    invoke-virtual {p0}, Lexpo/modules/kotlin/views/ConcreteViewProp;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-static {p2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object p2

    invoke-direct {p1, v0, p2, p3}, Lexpo/modules/kotlin/exception/PropSetException;-><init>(Ljava/lang/String;Lkotlin/reflect/KClass;Lexpo/modules/kotlin/exception/CodedException;)V

    check-cast p1, Ljava/lang/Throwable;

    .line 31
    throw p1
.end method
