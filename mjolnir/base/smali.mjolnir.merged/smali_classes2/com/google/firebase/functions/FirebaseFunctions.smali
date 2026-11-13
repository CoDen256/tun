.class public Lcom/google/firebase/functions/FirebaseFunctions;
.super Ljava/lang/Object;
.source "FirebaseFunctions.java"


# static fields
.field private static providerInstallStarted:Z

.field private static final providerInstalled:Lcom/google/android/gms/tasks/TaskCompletionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final app:Lcom/google/firebase/FirebaseApp;

.field private final client:Lokhttp3/OkHttpClient;

.field private final contextProvider:Lcom/google/firebase/functions/ContextProvider;

.field private final customDomain:Ljava/lang/String;

.field private emulatorSettings:Lcom/google/firebase/emulators/EmulatedServiceSettings;

.field private final projectId:Ljava/lang/String;

.field private final region:Ljava/lang/String;

.field private final serializer:Lcom/google/firebase/functions/Serializer;

.field private urlFormat:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    new-instance v0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    sput-object v0, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstalled:Lcom/google/android/gms/tasks/TaskCompletionSource;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstallStarted:Z

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/FirebaseApp;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/functions/ContextProvider;)V
    .locals 1

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "https://%1$s-%2$s.cloudfunctions.net/%3$s"

    iput-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions;->urlFormat:Ljava/lang/String;

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->app:Lcom/google/firebase/FirebaseApp;

    .line 94
    new-instance p1, Lokhttp3/OkHttpClient;

    invoke-direct {p1}, Lokhttp3/OkHttpClient;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->client:Lokhttp3/OkHttpClient;

    .line 95
    new-instance p1, Lcom/google/firebase/functions/Serializer;

    invoke-direct {p1}, Lcom/google/firebase/functions/Serializer;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->serializer:Lcom/google/firebase/functions/Serializer;

    .line 96
    invoke-static {p5}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/firebase/functions/ContextProvider;

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->contextProvider:Lcom/google/firebase/functions/ContextProvider;

    .line 97
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->projectId:Ljava/lang/String;

    .line 101
    :try_start_0
    new-instance p1, Ljava/net/URL;

    invoke-direct {p1, p4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    const-string p1, "us-central1"

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->region:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/firebase/functions/FirebaseFunctions;->customDomain:Ljava/lang/String;

    goto :goto_0

    :catch_0
    iput-object p4, p0, Lcom/google/firebase/functions/FirebaseFunctions;->region:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->customDomain:Ljava/lang/String;

    .line 115
    :goto_0
    invoke-static {p2}, Lcom/google/firebase/functions/FirebaseFunctions;->maybeInstallProviders(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/firebase/functions/FirebaseFunctions;)Lcom/google/firebase/functions/Serializer;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/google/firebase/functions/FirebaseFunctions;->serializer:Lcom/google/firebase/functions/Serializer;

    return-object p0
.end method

.method static synthetic access$100()Lcom/google/android/gms/tasks/TaskCompletionSource;
    .locals 1

    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstalled:Lcom/google/android/gms/tasks/TaskCompletionSource;

    return-object v0
.end method

.method private call(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallableContext;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Ljava/lang/Object;",
            "Lcom/google/firebase/functions/HttpsCallableContext;",
            "Lcom/google/firebase/functions/HttpsCallOptions;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/functions/HttpsCallableResult;",
            ">;"
        }
    .end annotation

    const-string v0, "url cannot be null"

    .line 318
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->serializer:Lcom/google/firebase/functions/Serializer;

    .line 322
    invoke-virtual {v1, p2}, Lcom/google/firebase/functions/Serializer;->encode(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    const-string v1, "data"

    .line 323
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    const-string v0, "application/json"

    .line 326
    invoke-static {v0}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v0

    .line 327
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object p2

    .line 329
    new-instance v0, Lokhttp3/Request$Builder;

    invoke-direct {v0}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lokhttp3/Request$Builder;->url(Ljava/net/URL;)Lokhttp3/Request$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 330
    invoke-virtual {p3}, Lcom/google/firebase/functions/HttpsCallableContext;->getAuthToken()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 331
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Bearer "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3}, Lcom/google/firebase/functions/HttpsCallableContext;->getAuthToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "Authorization"

    invoke-virtual {p1, v0, p2}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 333
    :cond_0
    invoke-virtual {p3}, Lcom/google/firebase/functions/HttpsCallableContext;->getInstanceIdToken()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    const-string p2, "Firebase-Instance-ID-Token"

    .line 334
    invoke-virtual {p3}, Lcom/google/firebase/functions/HttpsCallableContext;->getInstanceIdToken()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    .line 336
    :cond_1
    invoke-virtual {p3}, Lcom/google/firebase/functions/HttpsCallableContext;->getAppCheckToken()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_2

    const-string p2, "X-Firebase-AppCheck"

    .line 337
    invoke-virtual {p3}, Lcom/google/firebase/functions/HttpsCallableContext;->getAppCheckToken()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object p1

    :cond_2
    iget-object p2, p0, Lcom/google/firebase/functions/FirebaseFunctions;->client:Lokhttp3/OkHttpClient;

    .line 340
    invoke-virtual {p4, p2}, Lcom/google/firebase/functions/HttpsCallOptions;->apply(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;

    move-result-object p2

    .line 341
    invoke-virtual {p1}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object p1

    invoke-virtual {p2, p1}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object p1

    .line 343
    new-instance p2, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    .line 344
    new-instance p3, Lcom/google/firebase/functions/FirebaseFunctions$2;

    invoke-direct {p3, p0, p2}, Lcom/google/firebase/functions/FirebaseFunctions$2;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    invoke-interface {p1, p3}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V

    .line 400
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public static getInstance()Lcom/google/firebase/functions/FirebaseFunctions;
    .locals 2

    .line 198
    invoke-static {}, Lcom/google/firebase/FirebaseApp;->getInstance()Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    const-string v1, "us-central1"

    invoke-static {v0, v1}, Lcom/google/firebase/functions/FirebaseFunctions;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Lcom/google/firebase/FirebaseApp;)Lcom/google/firebase/functions/FirebaseFunctions;
    .locals 1

    const-string v0, "us-central1"

    .line 181
    invoke-static {p0, v0}, Lcom/google/firebase/functions/FirebaseFunctions;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;
    .locals 1

    const-string v0, "You must call FirebaseApp.initializeApp first."

    .line 165
    invoke-static {p0, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    const-class v0, Lcom/google/firebase/functions/FunctionsMultiResourceComponent;

    invoke-virtual {p0, v0}, Lcom/google/firebase/FirebaseApp;->get(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/functions/FunctionsMultiResourceComponent;

    const-string v0, "Functions component does not exist."

    .line 169
    invoke-static {p0, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    invoke-virtual {p0, p1}, Lcom/google/firebase/functions/FunctionsMultiResourceComponent;->get(Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance(Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;
    .locals 1

    .line 192
    invoke-static {}, Lcom/google/firebase/FirebaseApp;->getInstance()Lcom/google/firebase/FirebaseApp;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/google/firebase/functions/FirebaseFunctions;->getInstance(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;)Lcom/google/firebase/functions/FirebaseFunctions;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$maybeInstallProviders$0(Landroid/content/Context;)V
    .locals 1

    .line 136
    new-instance v0, Lcom/google/firebase/functions/FirebaseFunctions$1;

    invoke-direct {v0}, Lcom/google/firebase/functions/FirebaseFunctions$1;-><init>()V

    invoke-static {p0, v0}, Lcom/google/android/gms/security/ProviderInstaller;->installIfNeededAsync(Landroid/content/Context;Lcom/google/android/gms/security/ProviderInstaller$ProviderInstallListener;)V

    return-void
.end method

.method private static maybeInstallProviders(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstalled:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 125
    monitor-enter v0

    :try_start_0
    sget-boolean v1, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstallStarted:Z

    if-eqz v1, :cond_0

    .line 127
    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x1

    sput-boolean v1, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstallStarted:Z

    .line 130
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 134
    new-instance v0, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;)V

    .line 151
    new-instance v1, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object p0

    invoke-direct {v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 152
    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_0
    move-exception p0

    .line 130
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method


# virtual methods
.method call(Ljava/lang/String;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            "Lcom/google/firebase/functions/HttpsCallOptions;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/functions/HttpsCallableResult;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstalled:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 271
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda1;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;)V

    .line 272
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda2;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/lang/String;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)V

    .line 273
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method call(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Ljava/lang/Object;",
            "Lcom/google/firebase/functions/HttpsCallOptions;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/functions/HttpsCallableResult;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firebase/functions/FirebaseFunctions;->providerInstalled:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 293
    invoke-virtual {v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0}, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda3;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;)V

    .line 294
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/firebase/functions/FirebaseFunctions$$ExternalSyntheticLambda4;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;)V

    .line 295
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public getHttpsCallable(Ljava/lang/String;)Lcom/google/firebase/functions/HttpsCallableReference;
    .locals 1

    .line 204
    new-instance v0, Lcom/google/firebase/functions/HttpsCallableReference;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/functions/HttpsCallableReference;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/lang/String;)V

    return-object v0
.end method

.method public getHttpsCallableFromUrl(Ljava/net/URL;)Lcom/google/firebase/functions/HttpsCallableReference;
    .locals 1

    .line 210
    new-instance v0, Lcom/google/firebase/functions/HttpsCallableReference;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/functions/HttpsCallableReference;-><init>(Lcom/google/firebase/functions/FirebaseFunctions;Ljava/net/URL;)V

    return-object v0
.end method

.method getURL(Ljava/lang/String;)Ljava/net/URL;
    .locals 5

    iget-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions;->emulatorSettings:Lcom/google/firebase/emulators/EmulatedServiceSettings;

    if-eqz v0, :cond_0

    .line 223
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "http://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 225
    invoke-virtual {v0}, Lcom/google/firebase/emulators/EmulatedServiceSettings;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    invoke-virtual {v0}, Lcom/google/firebase/emulators/EmulatedServiceSettings;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "/%2$s/%1$s/%3$s"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->urlFormat:Ljava/lang/String;

    :cond_0
    iget-object v1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->urlFormat:Ljava/lang/String;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/google/firebase/functions/FirebaseFunctions;->region:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/google/firebase/functions/FirebaseFunctions;->projectId:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object p1, v2, v3

    .line 231
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/google/firebase/functions/FirebaseFunctions;->customDomain:Ljava/lang/String;

    if-eqz v2, :cond_1

    if-nez v0, :cond_1

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->customDomain:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 238
    :cond_1
    :try_start_0
    new-instance p1, Ljava/net/URL;

    invoke-direct {p1, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 240
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method synthetic lambda$call$1$com-google-firebase-functions-FirebaseFunctions(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 0
    iget-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->contextProvider:Lcom/google/firebase/functions/ContextProvider;

    .line 272
    invoke-interface {p1}, Lcom/google/firebase/functions/ContextProvider;->getContext()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$call$2$com-google-firebase-functions-FirebaseFunctions(Ljava/lang/String;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 275
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 276
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 278
    :cond_0
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/firebase/functions/HttpsCallableContext;

    .line 279
    invoke-virtual {p0, p1}, Lcom/google/firebase/functions/FirebaseFunctions;->getURL(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p1

    .line 280
    invoke-direct {p0, p1, p2, p4, p3}, Lcom/google/firebase/functions/FirebaseFunctions;->call(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallableContext;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$call$3$com-google-firebase-functions-FirebaseFunctions(Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 0
    iget-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->contextProvider:Lcom/google/firebase/functions/ContextProvider;

    .line 294
    invoke-interface {p1}, Lcom/google/firebase/functions/ContextProvider;->getContext()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method synthetic lambda$call$4$com-google-firebase-functions-FirebaseFunctions(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallOptions;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 297
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_0

    .line 298
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 300
    :cond_0
    invoke-virtual {p4}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/google/firebase/functions/HttpsCallableContext;

    .line 301
    invoke-direct {p0, p1, p2, p4, p3}, Lcom/google/firebase/functions/FirebaseFunctions;->call(Ljava/net/URL;Ljava/lang/Object;Lcom/google/firebase/functions/HttpsCallableContext;Lcom/google/firebase/functions/HttpsCallOptions;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public useEmulator(Ljava/lang/String;I)V
    .locals 1

    .line 259
    new-instance v0, Lcom/google/firebase/emulators/EmulatedServiceSettings;

    invoke-direct {v0, p1, p2}, Lcom/google/firebase/emulators/EmulatedServiceSettings;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/google/firebase/functions/FirebaseFunctions;->emulatorSettings:Lcom/google/firebase/emulators/EmulatedServiceSettings;

    return-void
.end method

.method public useFunctionsEmulator(Ljava/lang/String;)V
    .locals 1

    const-string v0, "origin cannot be null"

    .line 246
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 247
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "/%2$s/%1$s/%3$s"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/firebase/functions/FirebaseFunctions;->urlFormat:Ljava/lang/String;

    return-void
.end method
