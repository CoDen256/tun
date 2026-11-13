.class final Lcom/google/android/gms/internal/firebase-auth-api/zzgf;
.super Lcom/google/android/gms/internal/firebase-auth-api/zzbn;
.source "com.google.firebase:firebase-auth@@21.1.0"


# instance fields
.field private final zza:Ljava/lang/String;

.field private final zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzoy;


# direct methods
.method synthetic constructor <init>(Ljava/lang/String;Lcom/google/android/gms/internal/firebase-auth-api/zzoy;Lcom/google/android/gms/internal/firebase-auth-api/zzge;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/firebase-auth-api/zzbn;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgf;->zza:Ljava/lang/String;

    iput-object p2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .locals 4

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgf;->zza:Ljava/lang/String;

    aput-object v3, v1, v2

    iget-object v2, p0, Lcom/google/android/gms/internal/firebase-auth-api/zzgf;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    .line 1
    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zznr;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zznr;

    sget-object v3, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_3

    if-eq v2, v0, :cond_2

    const/4 v0, 0x3

    if-eq v2, v0, :cond_1

    const/4 v0, 0x4

    if-eq v2, v0, :cond_0

    const-string v0, "UNKNOWN"

    goto :goto_0

    :cond_0
    const-string v0, "CRUNCHY"

    goto :goto_0

    :cond_1
    const-string v0, "RAW"

    goto :goto_0

    :cond_2
    const-string v0, "LEGACY"

    goto :goto_0

    :cond_3
    const-string v0, "TINK"

    :goto_0
    aput-object v0, v1, v3

    const-string v0, "(typeUrl=%s, outputPrefixType=%s)"

    .line 2
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
