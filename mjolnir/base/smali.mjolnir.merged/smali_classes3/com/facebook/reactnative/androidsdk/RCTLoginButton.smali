.class public Lcom/facebook/reactnative/androidsdk/RCTLoginButton;
.super Lcom/facebook/login/widget/LoginButton;
.source "RCTLoginButton.java"


# instance fields
.field private final mCallbackManager:Lcom/facebook/CallbackManager;


# direct methods
.method static bridge synthetic -$$Nest$msetToStringArray(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;Ljava/util/Set;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->setToStringArray(Ljava/util/Set;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/uimanager/ThemedReactContext;Lcom/facebook/CallbackManager;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/facebook/login/widget/LoginButton;-><init>(Landroid/content/Context;)V

    .line 48
    sget-object p1, Lcom/facebook/login/widget/LoginButton$ToolTipMode;->NEVER_DISPLAY:Lcom/facebook/login/widget/LoginButton$ToolTipMode;

    invoke-virtual {p0, p1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->setToolTipMode(Lcom/facebook/login/widget/LoginButton$ToolTipMode;)V

    iput-object p2, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->mCallbackManager:Lcom/facebook/CallbackManager;

    .line 50
    invoke-virtual {p0}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->init()V

    return-void
.end method

.method private setToStringArray(Ljava/util/Set;)[Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 127
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 129
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    add-int/lit8 v3, v1, 0x1

    .line 130
    aput-object v2, v0, v1

    move v1, v3

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public init()V
    .locals 2

    .line 54
    new-instance v0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$1;

    invoke-direct {v0, p0}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$1;-><init>(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;)V

    iget-object v0, p0, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->mCallbackManager:Lcom/facebook/CallbackManager;

    .line 70
    new-instance v1, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;

    invoke-direct {v1, p0}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton$2;-><init>(Lcom/facebook/reactnative/androidsdk/RCTLoginButton;)V

    invoke-virtual {p0, v0, v1}, Lcom/facebook/reactnative/androidsdk/RCTLoginButton;->registerCallback(Lcom/facebook/CallbackManager;Lcom/facebook/FacebookCallback;)V

    return-void
.end method
