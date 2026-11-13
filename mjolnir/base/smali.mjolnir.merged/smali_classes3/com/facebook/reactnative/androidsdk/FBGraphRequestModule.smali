.class public Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;
.super Lcom/facebook/react/bridge/ReactContextBaseJavaModule;
.source "FBGraphRequestModule.java"


# annotations
.annotation runtime Lcom/facebook/react/module/annotations/ReactModule;
    name = "FBGraphRequest"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;,
        Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestBatchCallback;
    }
.end annotation


# static fields
.field public static final NAME:Ljava/lang/String; = "FBGraphRequest"


# instance fields
.field private mResponses:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/facebook/react/bridge/WritableMap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static bridge synthetic -$$Nest$fgetmResponses(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;)Landroid/util/SparseArray;
    .locals 0

    iget-object p0, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->mResponses:Landroid/util/SparseArray;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mbuildFacebookRequestError(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;Lcom/facebook/FacebookRequestError;)Lcom/facebook/react/bridge/WritableMap;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->buildFacebookRequestError(Lcom/facebook/FacebookRequestError;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mbuildGraphResponse(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;Lcom/facebook/GraphResponse;)Lcom/facebook/react/bridge/WritableMap;
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->buildGraphResponse(Lcom/facebook/GraphResponse;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V
    .locals 0

    .line 100
    invoke-direct {p0, p1}, Lcom/facebook/react/bridge/ReactContextBaseJavaModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    .line 101
    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->mResponses:Landroid/util/SparseArray;

    return-void
.end method

.method private buildFacebookRequestError(Lcom/facebook/FacebookRequestError;)Lcom/facebook/react/bridge/WritableMap;
    .locals 3

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 192
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "requestStatusCode"

    .line 193
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getRequestStatusCode()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    const-string v1, "errorCode"

    .line 194
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorCode()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    const-string v1, "subErrorCode"

    .line 195
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getSubErrorCode()I

    move-result v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    .line 196
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v1, "errorType"

    .line 197
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    :cond_1
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v1, "errorMessage"

    .line 200
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    :cond_2
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorUserTitle()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    const-string v1, "errorUserTitle"

    .line 203
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorUserTitle()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    :cond_3
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorUserMessage()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    const-string v1, "errorUserMessage"

    .line 206
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getErrorUserMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    :cond_4
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getRequestResultBody()Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 209
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getRequestResultBody()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "requestResultBody"

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    :cond_5
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getRequestResult()Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 212
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getRequestResult()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "requestResult"

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    :cond_6
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getBatchRequestResult()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 215
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getBatchRequestResult()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "batchRequestResult"

    invoke-interface {v0, v2, v1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    :cond_7
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getException()Lcom/facebook/FacebookException;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 218
    invoke-virtual {p1}, Lcom/facebook/FacebookRequestError;->getException()Lcom/facebook/FacebookException;

    move-result-object p1

    invoke-virtual {p1}, Lcom/facebook/FacebookException;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "exception"

    invoke-interface {v0, v1, p1}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    return-object v0
.end method

.method private buildGraphResponse(Lcom/facebook/GraphResponse;)Lcom/facebook/react/bridge/WritableMap;
    .locals 1

    .line 224
    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 225
    invoke-virtual {p1}, Lcom/facebook/GraphResponse;->getJSONObject()Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->convertJSONObject(Lorg/json/JSONObject;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1

    .line 227
    :cond_0
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object p1

    return-object p1
.end method

.method private buildParameters(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;
    .locals 6

    .line 176
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 177
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableMap;->keySetIterator()Lcom/facebook/react/bridge/ReadableMapKeySetIterator;

    move-result-object v1

    .line 178
    :cond_0
    :goto_0
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->hasNextKey()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 179
    invoke-interface {v1}, Lcom/facebook/react/bridge/ReadableMapKeySetIterator;->nextKey()Ljava/lang/String;

    move-result-object v2

    .line 180
    invoke-interface {p1, v2}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    const-string v4, "string"

    .line 181
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 182
    invoke-interface {v3, v4}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private buildRequest(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/GraphRequest;
    .locals 2

    .line 138
    new-instance v0, Lcom/facebook/GraphRequest;

    invoke-direct {v0}, Lcom/facebook/GraphRequest;-><init>()V

    const-string v1, "graphPath"

    .line 139
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/GraphRequest;->setGraphPath(Ljava/lang/String;)V

    const-string v1, "config"

    .line 140
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->setConfig(Lcom/facebook/GraphRequest;Lcom/facebook/react/bridge/ReadableMap;)V

    return-object v0
.end method

.method private convertJSONArray(Lorg/json/JSONArray;)Lcom/facebook/react/bridge/WritableArray;
    .locals 4

    .line 231
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createArray()Lcom/facebook/react/bridge/WritableArray;

    move-result-object v0

    const/4 v1, 0x0

    .line 232
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_6

    .line 235
    :try_start_0
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 239
    instance-of v3, v2, Lorg/json/JSONObject;

    if-eqz v3, :cond_0

    .line 240
    check-cast v2, Lorg/json/JSONObject;

    invoke-direct {p0, v2}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->convertJSONObject(Lorg/json/JSONObject;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushMap(Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_1

    .line 241
    :cond_0
    instance-of v3, v2, Lorg/json/JSONArray;

    if-eqz v3, :cond_1

    .line 242
    check-cast v2, Lorg/json/JSONArray;

    invoke-direct {p0, v2}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->convertJSONArray(Lorg/json/JSONArray;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushArray(Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_1

    .line 243
    :cond_1
    instance-of v3, v2, Ljava/lang/String;

    if-eqz v3, :cond_2

    .line 244
    check-cast v2, Ljava/lang/String;

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushString(Ljava/lang/String;)V

    goto :goto_1

    .line 245
    :cond_2
    instance-of v3, v2, Ljava/lang/Integer;

    if-eqz v3, :cond_3

    .line 246
    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushInt(I)V

    goto :goto_1

    .line 247
    :cond_3
    instance-of v3, v2, Ljava/lang/Boolean;

    if-eqz v3, :cond_4

    .line 248
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-interface {v0, v2}, Lcom/facebook/react/bridge/WritableArray;->pushBoolean(Z)V

    goto :goto_1

    .line 249
    :cond_4
    instance-of v3, v2, Ljava/lang/Double;

    if-eqz v3, :cond_5

    .line 250
    check-cast v2, Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableArray;->pushDouble(D)V

    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    :cond_6
    return-object v0
.end method

.method private convertJSONObject(Lorg/json/JSONObject;)Lcom/facebook/react/bridge/WritableMap;
    .locals 5

    .line 257
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    .line 258
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 259
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 260
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 263
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    instance-of v4, v3, Lorg/json/JSONObject;

    if-eqz v4, :cond_1

    .line 268
    check-cast v3, Lorg/json/JSONObject;

    invoke-direct {p0, v3}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->convertJSONObject(Lorg/json/JSONObject;)Lcom/facebook/react/bridge/WritableMap;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    goto :goto_0

    .line 269
    :cond_1
    instance-of v4, v3, Lorg/json/JSONArray;

    if-eqz v4, :cond_2

    .line 270
    check-cast v3, Lorg/json/JSONArray;

    invoke-direct {p0, v3}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->convertJSONArray(Lorg/json/JSONArray;)Lcom/facebook/react/bridge/WritableArray;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putArray(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableArray;)V

    goto :goto_0

    .line 271
    :cond_2
    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_3

    .line 272
    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 273
    :cond_3
    instance-of v4, v3, Ljava/lang/Integer;

    if-eqz v4, :cond_4

    .line 274
    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    .line 275
    :cond_4
    instance-of v4, v3, Ljava/lang/Boolean;

    if-eqz v4, :cond_5

    .line 276
    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-interface {v0, v2, v3}, Lcom/facebook/react/bridge/WritableMap;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    .line 277
    :cond_5
    instance-of v4, v3, Ljava/lang/Double;

    if-eqz v4, :cond_0

    .line 278
    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Lcom/facebook/react/bridge/WritableMap;->putDouble(Ljava/lang/String;D)V

    goto :goto_0

    :catch_0
    :cond_6
    return-object v0
.end method

.method private setConfig(Lcom/facebook/GraphRequest;Lcom/facebook/react/bridge/ReadableMap;)V
    .locals 13

    if-nez p2, :cond_0

    .line 146
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/GraphRequest;->setAccessToken(Lcom/facebook/AccessToken;)V

    return-void

    :cond_0
    const-string v0, "parameters"

    .line 149
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getMap(Ljava/lang/String;)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->buildParameters(Lcom/facebook/react/bridge/ReadableMap;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/facebook/GraphRequest;->setParameters(Landroid/os/Bundle;)V

    :cond_1
    const-string v0, "httpMethod"

    .line 152
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 153
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/HttpMethod;->valueOf(Ljava/lang/String;)Lcom/facebook/HttpMethod;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/facebook/GraphRequest;->setHttpMethod(Lcom/facebook/HttpMethod;)V

    :cond_2
    const-string v0, "version"

    .line 155
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 156
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/facebook/GraphRequest;->setVersion(Ljava/lang/String;)V

    :cond_3
    const-string v0, "accessToken"

    .line 158
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->hasKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 159
    new-instance v1, Lcom/facebook/AccessToken;

    .line 160
    invoke-interface {p2, v0}, Lcom/facebook/react/bridge/ReadableMap;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 161
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object p2

    invoke-virtual {p2}, Lcom/facebook/AccessToken;->getApplicationId()Ljava/lang/String;

    move-result-object v4

    .line 162
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object p2

    invoke-virtual {p2}, Lcom/facebook/AccessToken;->getUserId()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v2, v1

    invoke-direct/range {v2 .. v12}, Lcom/facebook/AccessToken;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Collection;Ljava/util/Collection;Ljava/util/Collection;Lcom/facebook/AccessTokenSource;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;)V

    .line 159
    invoke-virtual {p1, v1}, Lcom/facebook/GraphRequest;->setAccessToken(Lcom/facebook/AccessToken;)V

    goto :goto_0

    .line 171
    :cond_4
    invoke-static {}, Lcom/facebook/AccessToken;->getCurrentAccessToken()Lcom/facebook/AccessToken;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/facebook/GraphRequest;->setAccessToken(Lcom/facebook/AccessToken;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "FBGraphRequest"

    return-object v0
.end method

.method public start(Lcom/facebook/react/bridge/ReadableArray;ILcom/facebook/react/bridge/Callback;)V
    .locals 5
    .annotation runtime Lcom/facebook/react/bridge/ReactMethod;
    .end annotation

    .line 117
    new-instance v0, Lcom/facebook/GraphRequestBatch;

    invoke-direct {v0}, Lcom/facebook/GraphRequestBatch;-><init>()V

    .line 120
    monitor-enter p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    add-int/lit8 v3, v2, 0x1

    :try_start_0
    iget-object v4, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->mResponses:Landroid/util/SparseArray;

    .line 123
    invoke-virtual {v4, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_1

    iget-object v3, p0, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->mResponses:Landroid/util/SparseArray;

    .line 124
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 125
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    :goto_1
    invoke-interface {p1}, Lcom/facebook/react/bridge/ReadableArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 127
    invoke-interface {p1, v1}, Lcom/facebook/react/bridge/ReadableArray;->getMap(I)Lcom/facebook/react/bridge/ReadableMap;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;->buildRequest(Lcom/facebook/react/bridge/ReadableMap;)Lcom/facebook/GraphRequest;

    move-result-object v3

    .line 128
    new-instance v4, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;

    invoke-direct {v4, p0, v1, v2}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestCallback;-><init>(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;II)V

    invoke-virtual {v3, v4}, Lcom/facebook/GraphRequest;->setCallback(Lcom/facebook/GraphRequest$Callback;)V

    .line 129
    invoke-virtual {v0, v3}, Lcom/facebook/GraphRequestBatch;->add(Lcom/facebook/GraphRequest;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 131
    :cond_0
    invoke-virtual {v0, p2}, Lcom/facebook/GraphRequestBatch;->setTimeout(I)V

    .line 132
    new-instance p1, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestBatchCallback;

    invoke-direct {p1, p0, v2, p3}, Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule$GraphRequestBatchCallback;-><init>(Lcom/facebook/reactnative/androidsdk/FBGraphRequestModule;ILcom/facebook/react/bridge/Callback;)V

    .line 133
    invoke-virtual {v0, p1}, Lcom/facebook/GraphRequestBatch;->addCallback(Lcom/facebook/GraphRequestBatch$Callback;)V

    .line 134
    invoke-virtual {v0}, Lcom/facebook/GraphRequestBatch;->executeAsync()Lcom/facebook/GraphRequestAsyncTask;

    return-void

    :cond_1
    move v2, v3

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 125
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
