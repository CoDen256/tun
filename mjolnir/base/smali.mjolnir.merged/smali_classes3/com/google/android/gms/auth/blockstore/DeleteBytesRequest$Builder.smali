.class public final Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-auth-blockstore@@16.4.0"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private zza:Ljava/util/List;

.field private zzb:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->zza:Ljava/util/List;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->zzb:Z

    return-void
.end method


# virtual methods
.method public build()Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest;
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest;

    iget-object v1, p0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->zza:Ljava/util/List;

    iget-boolean v2, p0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->zzb:Z

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest;-><init>(Ljava/util/List;Z)V

    return-object v0
.end method

.method public setDeleteAll(Z)Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->zzb:Z

    return-object p0
.end method

.method public setKeys(Ljava/util/List;)Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;"
        }
    .end annotation

    const-string v0, "Keys cannot be set to null"

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/auth/blockstore/DeleteBytesRequest$Builder;->zza:Ljava/util/List;

    return-object p0
.end method
