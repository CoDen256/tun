.class final Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;
.super Lio/grpc/CallCredentials;
.source "FirestoreCallCredentials.java"


# static fields
.field private static final AUTHORIZATION_HEADER:Lio/grpc/Metadata$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/Metadata$Key<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOG_TAG:Ljava/lang/String; = "FirestoreCallCredentials"

.field private static final X_FIREBASE_APPCHECK:Lio/grpc/Metadata$Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/grpc/Metadata$Key<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final appCheckProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final authProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Lcom/google/firebase/firestore/auth/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "Authorization"

    .line 35
    sget-object v1, Lio/grpc/Metadata;->ASCII_STRING_MARSHALLER:Lio/grpc/Metadata$AsciiMarshaller;

    .line 36
    invoke-static {v0, v1}, Lio/grpc/Metadata$Key;->of(Ljava/lang/String;Lio/grpc/Metadata$AsciiMarshaller;)Lio/grpc/Metadata$Key;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->AUTHORIZATION_HEADER:Lio/grpc/Metadata$Key;

    const-string v0, "x-firebase-appcheck"

    .line 38
    sget-object v1, Lio/grpc/Metadata;->ASCII_STRING_MARSHALLER:Lio/grpc/Metadata$AsciiMarshaller;

    .line 39
    invoke-static {v0, v1}, Lio/grpc/Metadata$Key;->of(Ljava/lang/String;Lio/grpc/Metadata$AsciiMarshaller;)Lio/grpc/Metadata$Key;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->X_FIREBASE_APPCHECK:Lio/grpc/Metadata$Key;

    return-void
.end method

.method constructor <init>(Lcom/google/firebase/firestore/auth/CredentialsProvider;Lcom/google/firebase/firestore/auth/CredentialsProvider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Lcom/google/firebase/firestore/auth/User;",
            ">;",
            "Lcom/google/firebase/firestore/auth/CredentialsProvider<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 45
    invoke-direct {p0}, Lio/grpc/CallCredentials;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->authProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    iput-object p2, p0, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->appCheckProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    return-void
.end method

.method static synthetic lambda$applyRequestMetadata$0(Lcom/google/android/gms/tasks/Task;Lio/grpc/CallCredentials$MetadataApplier;Lcom/google/android/gms/tasks/Task;Lcom/google/android/gms/tasks/Task;)V
    .locals 6

    .line 69
    new-instance p3, Lio/grpc/Metadata;

    invoke-direct {p3}, Lio/grpc/Metadata;-><init>()V

    .line 71
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string v3, "FirestoreCallCredentials"

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const-string v0, "Successfully fetched auth token."

    new-array v4, v2, [Ljava/lang/Object;

    .line 73
    invoke-static {v3, v0, v4}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz p0, :cond_2

    sget-object v0, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->AUTHORIZATION_HEADER:Lio/grpc/Metadata$Key;

    .line 75
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Bearer "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p3, v0, p0}, Lio/grpc/Metadata;->put(Lio/grpc/Metadata$Key;Ljava/lang/Object;)V

    goto :goto_0

    .line 78
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    .line 79
    instance-of v0, p0, Lcom/google/firebase/FirebaseApiNotAvailableException;

    if-eqz v0, :cond_1

    const-string p0, "Firebase Auth API not available, not using authentication."

    new-array v0, v2, [Ljava/lang/Object;

    .line 80
    invoke-static {v3, p0, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 82
    :cond_1
    instance-of v0, p0, Lcom/google/firebase/internal/api/FirebaseNoSignedInUserException;

    if-eqz v0, :cond_6

    const-string p0, "No user signed in, not using authentication."

    new-array v0, v2, [Ljava/lang/Object;

    .line 83
    invoke-static {v3, p0, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 91
    :cond_2
    :goto_0
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result p0

    if-eqz p0, :cond_3

    .line 92
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-eqz p0, :cond_4

    .line 93
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_4

    const-string p2, "Successfully fetched AppCheck token."

    new-array v0, v2, [Ljava/lang/Object;

    .line 94
    invoke-static {v3, p2, v0}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object p2, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->X_FIREBASE_APPCHECK:Lio/grpc/Metadata$Key;

    .line 95
    invoke-virtual {p3, p2, p0}, Lio/grpc/Metadata;->put(Lio/grpc/Metadata$Key;Ljava/lang/Object;)V

    goto :goto_1

    .line 98
    :cond_3
    invoke-virtual {p2}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    .line 99
    instance-of p2, p0, Lcom/google/firebase/FirebaseApiNotAvailableException;

    if-eqz p2, :cond_5

    const-string p0, "Firebase AppCheck API not available."

    new-array p2, v2, [Ljava/lang/Object;

    .line 100
    invoke-static {v3, p0, p2}, Lcom/google/firebase/firestore/util/Logger;->debug(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 108
    :cond_4
    :goto_1
    invoke-virtual {p1, p3}, Lio/grpc/CallCredentials$MetadataApplier;->apply(Lio/grpc/Metadata;)V

    return-void

    :cond_5
    new-array p2, v1, [Ljava/lang/Object;

    aput-object p0, p2, v2

    const-string p3, "Failed to get AppCheck token: %s."

    .line 102
    invoke-static {v3, p3, p2}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 103
    sget-object p2, Lio/grpc/Status;->UNAUTHENTICATED:Lio/grpc/Status;

    invoke-virtual {p2, p0}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object p0

    invoke-virtual {p1, p0}, Lio/grpc/CallCredentials$MetadataApplier;->fail(Lio/grpc/Status;)V

    return-void

    :cond_6
    new-array p2, v1, [Ljava/lang/Object;

    aput-object p0, p2, v2

    const-string p3, "Failed to get auth token: %s."

    .line 85
    invoke-static {v3, p3, p2}, Lcom/google/firebase/firestore/util/Logger;->warn(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 86
    sget-object p2, Lio/grpc/Status;->UNAUTHENTICATED:Lio/grpc/Status;

    invoke-virtual {p2, p0}, Lio/grpc/Status;->withCause(Ljava/lang/Throwable;)Lio/grpc/Status;

    move-result-object p0

    invoke-virtual {p1, p0}, Lio/grpc/CallCredentials$MetadataApplier;->fail(Lio/grpc/Status;)V

    return-void
.end method


# virtual methods
.method public applyRequestMetadata(Lio/grpc/CallCredentials$RequestInfo;Ljava/util/concurrent/Executor;Lio/grpc/CallCredentials$MetadataApplier;)V
    .locals 3

    iget-object p1, p0, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->authProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    .line 57
    invoke-virtual {p1}, Lcom/google/firebase/firestore/auth/CredentialsProvider;->getToken()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    iget-object p2, p0, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials;->appCheckProvider:Lcom/google/firebase/firestore/auth/CredentialsProvider;

    .line 58
    invoke-virtual {p2}, Lcom/google/firebase/firestore/auth/CredentialsProvider;->getToken()Lcom/google/android/gms/tasks/Task;

    move-result-object p2

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/gms/tasks/Task;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 60
    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->whenAll([Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    sget-object v1, Lcom/google/firebase/firestore/util/Executors;->DIRECT_EXECUTOR:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1, p3, p2}, Lcom/google/firebase/firestore/remote/FirestoreCallCredentials$$ExternalSyntheticLambda0;-><init>(Lcom/google/android/gms/tasks/Task;Lio/grpc/CallCredentials$MetadataApplier;Lcom/google/android/gms/tasks/Task;)V

    .line 61
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    return-void
.end method

.method public thisUsesUnstableApi()V
    .locals 0

    return-void
.end method
