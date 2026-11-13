.class public abstract Lcom/facebook/react/runtime/JSRuntimeFactory;
.super Ljava/lang/Object;
.source "JSRuntimeFactory.java"


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "rninstance"

    .line 18
    invoke-static {v0}, Lcom/facebook/soloader/SoLoader;->loadLibrary(Ljava/lang/String;)Z

    return-void
.end method

.method protected constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/runtime/JSRuntimeFactory;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method
