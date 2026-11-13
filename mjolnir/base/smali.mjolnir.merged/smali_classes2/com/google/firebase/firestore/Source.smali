.class public final enum Lcom/google/firebase/firestore/Source;
.super Ljava/lang/Enum;
.source "Source.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/Source;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/Source;

.field public static final enum CACHE:Lcom/google/firebase/firestore/Source;

.field public static final enum DEFAULT:Lcom/google/firebase/firestore/Source;

.field public static final enum SERVER:Lcom/google/firebase/firestore/Source;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 28
    new-instance v0, Lcom/google/firebase/firestore/Source;

    const-string v1, "DEFAULT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/Source;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/firestore/Source;->DEFAULT:Lcom/google/firebase/firestore/Source;

    .line 36
    new-instance v1, Lcom/google/firebase/firestore/Source;

    const-string v3, "SERVER"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/firebase/firestore/Source;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/firebase/firestore/Source;->SERVER:Lcom/google/firebase/firestore/Source;

    .line 45
    new-instance v3, Lcom/google/firebase/firestore/Source;

    const-string v5, "CACHE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/firebase/firestore/Source;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/firebase/firestore/Source;->CACHE:Lcom/google/firebase/firestore/Source;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firebase/firestore/Source;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/google/firebase/firestore/Source;->$VALUES:[Lcom/google/firebase/firestore/Source;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/Source;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/Source;

    .line 23
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/Source;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/Source;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/Source;->$VALUES:[Lcom/google/firebase/firestore/Source;

    .line 23
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/Source;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/Source;

    return-object v0
.end method
