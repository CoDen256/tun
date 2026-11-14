.class public final Lcom/google/firebase/firestore/FirebaseFirestoreSettings;
.super Ljava/lang/Object;
.source "FirebaseFirestoreSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;
    }
.end annotation


# static fields
.field public static final CACHE_SIZE_UNLIMITED:J = -0x1L

.field private static final DEFAULT_CACHE_SIZE_BYTES:J = 0x6400000L

.field public static final DEFAULT_HOST:Ljava/lang/String; = "firestore.googleapis.com"

.field private static final MINIMUM_CACHE_BYTES:J = 0x100000L


# instance fields
.field private final cacheSizeBytes:J

.field private final host:Ljava/lang/String;

.field private final persistenceEnabled:Z

.field private final sslEnabled:Z


# direct methods
.method private constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)V
    .locals 2

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$500(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    .line 158
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$600(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    .line 159
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$700(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    .line 160
    invoke-static {p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;->access$800(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;Lcom/google/firebase/firestore/FirebaseFirestoreSettings$1;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;-><init>(Lcom/google/firebase/firestore/FirebaseFirestoreSettings$Builder;)V

    return-void
.end method

.method static synthetic access$000(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Ljava/lang/String;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    return p0
.end method

.method static synthetic access$200(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    return p0
.end method

.method static synthetic access$300(Lcom/google/firebase/firestore/FirebaseFirestoreSettings;)J
    .locals 2

    .line 23
    iget-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    return-wide v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 168
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 172
    :cond_1
    check-cast p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;

    iget-object v2, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    .line 173
    iget-object v3, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    iget-boolean v3, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    if-ne v2, v3, :cond_2

    iget-boolean v2, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    iget-boolean v3, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    if-ne v2, v3, :cond_2

    iget-wide v2, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    iget-wide v4, p1, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getCacheSizeBytes()J
    .locals 2

    iget-wide v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    return-wide v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget-object v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    .line 181
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    long-to-int v1, v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isPersistenceEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    return v0
.end method

.method public isSslEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "FirebaseFirestoreSettings{host="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", sslEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->sslEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", persistenceEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->persistenceEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", cacheSizeBytes="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/google/firebase/firestore/FirebaseFirestoreSettings;->cacheSizeBytes:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
