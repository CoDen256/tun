.class Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;
.super Ljava/lang/Object;
.source "AppleAuthenticationAndroidModule.java"

# interfaces
.implements Lcom/RNAppleAuthentication/SignInWithAppleCallback;


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

.field final synthetic val$promise:Lcom/facebook/react/bridge/Promise;


# direct methods
.method constructor <init>(Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;Lcom/facebook/react/bridge/Promise;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    iput-object p1, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;->this$0:Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;

    iput-object p2, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSignInWithAppleCancel()V
    .locals 2

    iget-object v0, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    const-string v1, "E_SIGNIN_CANCELLED_ERROR"

    .line 220
    invoke-interface {v0, v1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;)V

    return-void
.end method

.method public onSignInWithAppleFailure(Ljava/lang/Throwable;)V
    .locals 2

    iget-object v0, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    const-string v1, "E_SIGNIN_FAILED_ERROR"

    .line 215
    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/Promise;->reject(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public onSignInWithAppleSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const-string v0, "lastName"

    const-string v1, "firstName"

    const-string v2, "email"

    const-string v3, "name"

    .line 176
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v4

    const-string v5, "code"

    .line 177
    invoke-interface {v4, v5, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "id_token"

    .line 178
    invoke-interface {v4, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "state"

    .line 179
    invoke-interface {v4, p1, p3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;->this$0:Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;

    .line 181
    invoke-static {p1}, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;->-$$Nest$fgetconfiguration(Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule;)Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Lcom/RNAppleAuthentication/SignInWithAppleConfiguration;->getRawNonce()Ljava/lang/String;

    move-result-object p1

    .line 182
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "nonce"

    .line 183
    invoke-interface {v4, p2, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    :cond_0
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 188
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p2

    .line 189
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 190
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    .line 191
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p4

    .line 192
    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 193
    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {p4, v1, v5}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    :cond_1
    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 196
    invoke-virtual {p3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p4, v0, p3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    :cond_2
    invoke-interface {p4, v1}, Lcom/facebook/react/bridge/WritableMap;->hasKey(Ljava/lang/String;)Z

    move-result p3

    if-nez p3, :cond_3

    invoke-interface {p4, v0}, Lcom/facebook/react/bridge/WritableMap;->hasKey(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 199
    :cond_3
    invoke-interface {p2, v3, p4}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    .line 202
    :cond_4
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_5

    .line 203
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, v2, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    :cond_5
    invoke-interface {p2, v3}, Lcom/facebook/react/bridge/WritableMap;->hasKey(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_6

    invoke-interface {p2, v2}, Lcom/facebook/react/bridge/WritableMap;->hasKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_7

    :cond_6
    const-string/jumbo p1, "user"

    .line 206
    invoke-interface {v4, p1, p2}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_7
    iget-object p1, p0, Lcom/RNAppleAuthentication/AppleAuthenticationAndroidModule$1;->val$promise:Lcom/facebook/react/bridge/Promise;

    .line 210
    invoke-interface {p1, v4}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method
