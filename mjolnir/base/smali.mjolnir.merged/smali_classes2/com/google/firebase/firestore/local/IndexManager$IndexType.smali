.class public final enum Lcom/google/firebase/firestore/local/IndexManager$IndexType;
.super Ljava/lang/Enum;
.source "IndexManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/local/IndexManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "IndexType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/local/IndexManager$IndexType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/local/IndexManager$IndexType;

.field public static final enum FULL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

.field public static final enum NONE:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

.field public static final enum PARTIAL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 38
    new-instance v0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/local/IndexManager$IndexType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->NONE:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    .line 43
    new-instance v1, Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    const-string v3, "PARTIAL"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/firebase/firestore/local/IndexManager$IndexType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->PARTIAL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    .line 48
    new-instance v3, Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    const-string v5, "FULL"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/firebase/firestore/local/IndexManager$IndexType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->FULL:Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->$VALUES:[Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/local/IndexManager$IndexType;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    .line 36
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/local/IndexManager$IndexType;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/local/IndexManager$IndexType;->$VALUES:[Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    .line 36
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/local/IndexManager$IndexType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/local/IndexManager$IndexType;

    return-object v0
.end method
