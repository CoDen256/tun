.class public final Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;
.super Ljava/lang/Object;
.source "FirebaseFirestoreSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/FirebaseFirestoreSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private cacheSizeBytes:J

.field private host:Ljava/lang/String;

.field private persistenceEnabled:Z

.field private sslEnabled:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "firestore.googleapis.com"

    iput-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->host:Ljava/lang/String;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->sslEnabled:Z

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->persistenceEnabled:Z

    const-wide/32 v0, 0x6400000

    iput-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->cacheSizeBytes:J

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)V
    .locals 2

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Provided settings must not be null."

    .line 56
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->access$000(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->host:Ljava/lang/String;

    .line 58
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->access$100(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->sslEnabled:Z

    .line 59
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->access$200(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->persistenceEnabled:Z

    .line 60
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->access$300(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->cacheSizeBytes:J

    return-void
.end method

.method static synthetic access$500(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Ljava/lang/String;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->host:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$600(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Z
    .locals 0

    .line 37
    iget-boolean p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->sslEnabled:Z

    return p0
.end method

.method static synthetic access$700(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Z
    .locals 0

    .line 37
    iget-boolean p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->persistenceEnabled:Z

    return p0
.end method

.method static synthetic access$800(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)J
    .locals 2

    .line 37
    iget-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->cacheSizeBytes:J

    return-wide v0
.end method


# virtual methods
.method public build()Lcom/google/firebase/firestore/FirebaseFirestoreSettings;
    .locals 2

    iget-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->sslEnabled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->host:Ljava/lang/String;

    const-string v1, "firestore.googleapis.com"

    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 143
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You can\'t set the \'sslEnabled\' setting unless you also set a non-default \'host\'."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    :cond_1
    :goto_0
    new-instance v0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;-><init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;Lcom/google/firebase/firestore/FirebaseFirestoreSettings$1;)V

    return-object v0
.end method

.method public getCacheSizeBytes()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->cacheSizeBytes:J

    return-wide v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->host:Ljava/lang/String;

    return-object v0
.end method

.method public isPersistenceEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->persistenceEnabled:Z

    return v0
.end method

.method public isSslEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->sslEnabled:Z

    return v0
.end method

.method public setCacheSizeBytes(J)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;
    .locals 2

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-eqz v0, :cond_1

    const-wide/32 v0, 0x100000

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    goto :goto_0

    .line 112
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Cache size must be set to at least 1048576 bytes"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    iput-wide p1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->cacheSizeBytes:J

    return-object p0
.end method

.method public setHost(Ljava/lang/String;)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;
    .locals 1

    const-string v0, "Provided host must not be null."

    .line 71
    invoke-static {p1, v0}, Lcom/google/firebase/firestore/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->host:Ljava/lang/String;

    return-object p0
.end method

.method public setPersistenceEnabled(Z)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->persistenceEnabled:Z

    return-object p0
.end method

.method public setSslEnabled(Z)Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->sslEnabled:Z

    return-object p0
.end method
