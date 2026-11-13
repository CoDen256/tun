.class public Lcom/facebook/react/runtime/JSCInstance;
.super Lcom/facebook/react/runtime/JSRuntimeFactory;
.source "JSCInstance.java"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "jscinstance"

    .line 18
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-static {}, Lcom/facebook/react/runtime/JSCInstance;->initHybrid()Lcom/facebook/jni/HybridData;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/react/runtime/JSRuntimeFactory;-><init>(Lcom/facebook/jni/HybridData;)V

    return-void
.end method

.method protected static native initHybrid()Lcom/facebook/jni/HybridData;
.end method
