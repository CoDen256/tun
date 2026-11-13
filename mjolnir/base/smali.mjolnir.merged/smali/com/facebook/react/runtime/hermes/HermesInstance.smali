.class public final Lcom/facebook/react/runtime/hermes/HermesInstance;
.super Lcom/facebook/react/runtime/JSRuntimeFactory;
.source "HermesInstance.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 \u00062\u00020\u0001:\u0001\u0006B\u0007\u0008\u0016\u00a2\u0006\u0002\u0010\u0002B\u000f\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0002\u0010\u0005\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/facebook/react/runtime/hermes/HermesInstance;",
        "Lcom/facebook/react/runtime/JSRuntimeFactory;",
        "()V",
        "reactNativeConfig",
        "Lcom/facebook/react/fabric/ReactNativeConfig;",
        "(Lcom/facebook/react/fabric/ReactNativeConfig;)V",
        "Companion",
        "ReactAndroid_release"
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
.field public static final Companion:Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/react/runtime/hermes/HermesInstance;->Companion:Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;

    const-string v0, "hermesinstancejni"

    .line 25
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 19
    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/hermes/HermesInstance;-><init>(Lcom/facebook/react/fabric/ReactNativeConfig;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/fabric/ReactNativeConfig;)V
    .locals 0

    .line 17
    check-cast p1, Ljava/lang/Object;

    invoke-static {p1}, Lcom/facebook/react/runtime/hermes/HermesInstance;->initHybrid(Ljava/lang/Object;)Lcom/facebook/jni/HybridData;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/react/runtime/JSRuntimeFactory;-><init>(Lcom/facebook/jni/HybridData;)V

    return-void
.end method

.method protected static final native initHybrid(Ljava/lang/Object;)Lcom/facebook/jni/HybridData;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation
.end method
