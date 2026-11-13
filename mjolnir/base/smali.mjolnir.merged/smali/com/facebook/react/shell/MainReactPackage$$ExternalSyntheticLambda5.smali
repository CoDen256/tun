.class public final synthetic Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljavax/inject/Provider;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .locals 1

    new-instance v0, Lcom/facebook/react/views/image/ReactImageManager;

    invoke-direct {v0}, Lcom/facebook/react/views/image/ReactImageManager;-><init>()V

    check-cast v0, Lcom/facebook/react/bridge/NativeModule;

    return-object v0
.end method
