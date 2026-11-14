.class public final Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;
.super Ljava/lang/Object;
.source "HermesInstance.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/react/runtime/hermes/HermesInstance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0013\u0010\u0003\u001a\u00020\u00042\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0001H\u0085 \u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;",
        "",
        "()V",
        "initHybrid",
        "Lcom/facebook/jni/HybridData;",
        "reactNativeConfig",
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


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Lcom/facebook/react/runtime/hermes/HermesInstance$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method protected final initHybrid(Ljava/lang/Object;)Lcom/facebook/jni/HybridData;
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    invoke-static {p1}, Lcom/facebook/react/runtime/hermes/HermesInstance;->initHybrid(Ljava/lang/Object;)Lcom/facebook/jni/HybridData;

    move-result-object p1

    return-object p1
.end method
