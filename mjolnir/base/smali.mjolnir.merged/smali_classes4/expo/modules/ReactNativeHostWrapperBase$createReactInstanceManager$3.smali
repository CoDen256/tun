.class public final Lexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3;
.super Ljava/lang/Object;
.source "ReactNativeHostWrapperBase.kt"

# interfaces
.implements Lcom/facebook/react/ReactInstanceEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lexpo/modules/ReactNativeHostWrapperBase;->createReactInstanceManager()Lcom/facebook/react/ReactInstanceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nReactNativeHostWrapperBase.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ReactNativeHostWrapperBase.kt\nexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,107:1\n1855#2,2:108\n*S KotlinDebug\n*F\n+ 1 ReactNativeHostWrapperBase.kt\nexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3\n*L\n37#1:108,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "expo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3",
        "Lcom/facebook/react/ReactInstanceEventListener;",
        "onReactContextInitialized",
        "",
        "context",
        "Lcom/facebook/react/bridge/ReactContext;",
        "expo_release"
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
.field final synthetic $developerSupport:Z

.field final synthetic this$0:Lexpo/modules/ReactNativeHostWrapperBase;


# direct methods
.method constructor <init>(Lexpo/modules/ReactNativeHostWrapperBase;Z)V
    .locals 0

    iput-object p1, p0, Lexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3;->this$0:Lexpo/modules/ReactNativeHostWrapperBase;

    iput-boolean p2, p0, Lexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3;->$developerSupport:Z

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onReactContextInitialized(Lcom/facebook/react/bridge/ReactContext;)V
    .locals 3

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3;->this$0:Lexpo/modules/ReactNativeHostWrapperBase;

    .line 37
    invoke-virtual {v0}, Lexpo/modules/ReactNativeHostWrapperBase;->getReactNativeHostHandlers$expo_release()Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    iget-boolean v1, p0, Lexpo/modules/ReactNativeHostWrapperBase$createReactInstanceManager$3;->$developerSupport:Z

    .line 108
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lexpo/modules/core/interfaces/ReactNativeHostHandler;

    .line 38
    invoke-interface {v2, v1, p1}, Lexpo/modules/core/interfaces/ReactNativeHostHandler;->onDidCreateReactInstance(ZLcom/facebook/react/bridge/ReactContext;)V

    goto :goto_0

    :cond_0
    return-void
.end method
