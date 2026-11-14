.class public Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;
.super Ljava/lang/Object;
.source "NativeMethodCallInvokerHolderImpl.java"

# interfaces
.implements Lcom/facebook/react/turbomodule/core/interfaces/NativeMethodCallInvokerHolder;


# annotations
.annotation runtime Lcom/facebook/react/common/annotations/FrameworkAPI;
.end annotation


# instance fields
.field private final mHybridData:Lcom/facebook/jni/HybridData;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 30
    invoke-static {}, Lcom/facebook/react/internal/turbomodule/core/NativeModuleSoLoader;->maybeLoadSoLibrary()V

    return-void
.end method

.method private constructor <init>(Lcom/facebook/jni/HybridData;)V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/turbomodule/core/NativeMethodCallInvokerHolderImpl;->mHybridData:Lcom/facebook/jni/HybridData;

    return-void
.end method
