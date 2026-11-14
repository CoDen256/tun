.class public final Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-auth-blockstore@@16.4.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/auth/blockstore/StoreBytesData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private zza:[B

.field private zzb:Z

.field private zzc:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "com.google.android.gms.auth.blockstore.DEFAULT_BYTES_DATA_KEY"

    iput-object v0, p0, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->zzc:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/auth/blockstore/StoreBytesData;
    .locals 4

    .line 1
    new-instance v0, Lcom/google/android/gms/auth/blockstore/StoreBytesData;

    iget-object v1, p0, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->zza:[B

    iget-boolean v2, p0, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->zzb:Z

    iget-object v3, p0, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->zzc:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3}, Lcom/google/android/gms/auth/blockstore/StoreBytesData;-><init>([BZLjava/lang/String;)V

    return-object v0
.end method

.method public setBytes([B)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->zza:[B

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;
    .locals 1

    const-string v0, "key cannot be null or empty"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    iput-object p1, p0, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->zzc:Ljava/lang/String;

    return-object p0
.end method

.method public setShouldBackupToCloud(Z)Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/auth/blockstore/StoreBytesData$Builder;->zzb:Z

    return-object p0
.end method
