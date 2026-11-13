.class public final synthetic Lcom/google/android/gms/internal/firebase-auth-api/zzhz;
.super Ljava/lang/Object;
.source "com.google.firebase:firebase-auth@@21.1.0"

# interfaces
.implements Lcom/google/android/gms/internal/firebase-auth-api/zzft;


# static fields
.field public static final synthetic zza:Lcom/google/android/gms/internal/firebase-auth-api/zzhz;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhz;

    invoke-direct {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhz;-><init>()V

    sput-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzhz;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzhz;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzha;Lcom/google/android/gms/internal/firebase-auth-api/zzca;)Lcom/google/android/gms/internal/firebase-auth-api/zzaw;
    .locals 7

    const-string v0, "Unable to parse OutputPrefixType: "

    sget v1, Lcom/google/android/gms/internal/firebase-auth-api/zzia;->zza:I

    move-object v1, p1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;

    .line 1
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;->zzg()Ljava/lang/String;

    move-result-object v1

    const-string v2, "type.googleapis.com/google.crypto.tink.AesCmacKey"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 2
    :try_start_0
    move-object v1, p1

    check-cast v1, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzacc;

    move-result-object v1

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/firebase-auth-api/zzacs;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzacs;

    move-result-object v2

    .line 4
    invoke-static {v1, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzjn;->zzd(Lcom/google/android/gms/internal/firebase-auth-api/zzacc;Lcom/google/android/gms/internal/firebase-auth-api/zzacs;)Lcom/google/android/gms/internal/firebase-auth-api/zzjn;

    move-result-object v1

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjn;->zza()I

    move-result v2

    if-nez v2, :cond_4

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzhs;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzhs;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzhr;)V

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjn;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzacc;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzacc;->zzd()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzhs;->zza(I)Lcom/google/android/gms/internal/firebase-auth-api/zzhs;

    .line 7
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjn;->zze()Lcom/google/android/gms/internal/firebase-auth-api/zzjt;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzjt;->zza()I

    move-result v4

    invoke-virtual {v2, v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzhs;->zzb(I)Lcom/google/android/gms/internal/firebase-auth-api/zzhs;

    move-object v4, p1

    check-cast v4, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;->zzc()Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    move-result-object v4

    .line 8
    sget-object v5, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzoy;

    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->ordinal()I

    move-result v5

    const/4 v6, 0x1

    if-eq v5, v6, :cond_3

    const/4 v6, 0x2

    if-eq v5, v6, :cond_2

    const/4 v6, 0x3

    if-eq v5, v6, :cond_1

    const/4 v6, 0x4

    if-ne v5, v6, :cond_0

    .line 17
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzht;->zzb:Lcom/google/android/gms/internal/firebase-auth-api/zzht;

    goto :goto_0

    .line 15
    :cond_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 16
    invoke-virtual {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzoy;->zza()I

    move-result p2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 14
    :cond_1
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzht;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzht;

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzht;->zzc:Lcom/google/android/gms/internal/firebase-auth-api/zzht;

    goto :goto_0

    .line 8
    :cond_3
    sget-object v0, Lcom/google/android/gms/internal/firebase-auth-api/zzht;->zza:Lcom/google/android/gms/internal/firebase-auth-api/zzht;

    .line 9
    :goto_0
    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhs;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzht;)Lcom/google/android/gms/internal/firebase-auth-api/zzhs;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzhs;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzhv;

    move-result-object v0

    new-instance v2, Lcom/google/android/gms/internal/firebase-auth-api/zzhl;

    invoke-direct {v2, v3}, Lcom/google/android/gms/internal/firebase-auth-api/zzhl;-><init>(Lcom/google/android/gms/internal/firebase-auth-api/zzhk;)V

    .line 10
    invoke-virtual {v2, v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzhl;->zzc(Lcom/google/android/gms/internal/firebase-auth-api/zzhv;)Lcom/google/android/gms/internal/firebase-auth-api/zzhl;

    .line 11
    invoke-virtual {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzjn;->zzf()Lcom/google/android/gms/internal/firebase-auth-api/zzacc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/firebase-auth-api/zzacc;->zzt()[B

    move-result-object v0

    .line 12
    invoke-static {v0, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzqw;->zzb([BLcom/google/android/gms/internal/firebase-auth-api/zzca;)Lcom/google/android/gms/internal/firebase-auth-api/zzqw;

    move-result-object p2

    invoke-virtual {v2, p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzhl;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzqw;)Lcom/google/android/gms/internal/firebase-auth-api/zzhl;

    check-cast p1, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzgy;->zzf()Ljava/lang/Integer;

    move-result-object p1

    .line 13
    invoke-virtual {v2, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzhl;->zzb(Ljava/lang/Integer;)Lcom/google/android/gms/internal/firebase-auth-api/zzhl;

    .line 14
    invoke-virtual {v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzhl;->zzd()Lcom/google/android/gms/internal/firebase-auth-api/zzhn;

    move-result-object p1

    return-object p1

    .line 17
    :cond_4
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Only version 0 keys are accepted"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzadn; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    :catch_0
    new-instance p1, Ljava/security/GeneralSecurityException;

    const-string p2, "Parsing AesCmacKey failed"

    invoke-direct {p1, p2}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Wrong type URL in call to AesCmacParameters.parseParameters"

    .line 2
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
