.class final Lcom/google/android/gms/internal/firebase-auth-api/zzfs;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzfv;
.source "com.google.firebase:firebase-auth@@21.1.0"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzft;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqv;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzft;)V
    .locals 0

    iput-object p3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzfs;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzft;

    const/4 p3, 0x0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/gms/internal/firebase-auth-api/zzfv;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzqv;Ljava/lang/Class;Lcom/google/android/gms/internal/firebase-auth-api/zzfu;)V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzha;Lcom/google/android/gms/internal/firebase-auth-api/zzca;)Lcom/google/android/gms/internal/firebase-auth-api/zzaw;
    .locals 1
    .param p2    # Lcom/google/android/gms/internal/firebase-auth-api/zzca;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzfs;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzft;

    .line 1
    invoke-interface {v0, p1, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzft;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzha;Lcom/google/android/gms/internal/firebase-auth-api/zzca;)Lcom/google/android/gms/internal/firebase-auth-api/zzaw;

    move-result-object p1

    return-object p1
.end method
