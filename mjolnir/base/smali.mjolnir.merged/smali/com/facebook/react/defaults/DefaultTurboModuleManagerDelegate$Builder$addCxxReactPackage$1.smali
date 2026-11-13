.class final Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder$addCxxReactPackage$1;
.super Lkotlin/jvm/internal/Lambda;
.source "DefaultTurboModuleManagerDelegate.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder;->addCxxReactPackage(Lkotlin/jvm/functions/Function0;)Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;",
        "<anonymous parameter 0>",
        "Lcom/facebook/react/bridge/ReactApplicationContext;",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $provider:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "+",
            "Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder$addCxxReactPackage$1;->$provider:Lkotlin/jvm/functions/Function0;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke(Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;
    .locals 1

    const-string v0, "<anonymous parameter 0>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder$addCxxReactPackage$1;->$provider:Lkotlin/jvm/functions/Function0;

    .line 44
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 44
    check-cast p1, Lcom/facebook/react/bridge/ReactApplicationContext;

    invoke-virtual {p0, p1}, Lcom/facebook/react/defaults/DefaultTurboModuleManagerDelegate$Builder$addCxxReactPackage$1;->invoke(Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/runtime/cxxreactpackage/CxxReactPackage;

    move-result-object p1

    return-object p1
.end method
