.class Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$2;
.super Ljava/lang/Object;
.source "AppleAuthenticationAndroidModule.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->signIn(Lcom/facebook/react/bridge/Promise;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;

.field final synthetic val$service:Lcom/RNAppleAuthentication/SignInWithAppleService;


# direct methods
.method constructor <init>(Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;Lcom/RNAppleAuthentication/SignInWithAppleService;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$2;->this$0:Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;

    iput-object p2, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$2;->val$service:Lcom/RNAppleAuthentication/SignInWithAppleService;

    .line 236
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$2;->val$service:Lcom/RNAppleAuthentication/SignInWithAppleService;

    .line 239
    invoke-virtual {v0}, Lcom/RNAppleAuthentication/SignInWithAppleService;->show()V

    return-void
.end method
