.class public final enum Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;
.super Ljava/lang/Enum;
.source "DocumentSnapshot.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/DocumentSnapshot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ServerTimestampBehavior"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

.field static final DEFAULT:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

.field public static final enum ESTIMATE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

.field public static final enum NONE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

.field public static final enum PREVIOUS:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 52
    new-instance v0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->NONE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 60
    new-instance v1, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    const-string v3, "ESTIMATE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->ESTIMATE:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 66
    new-instance v3, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    const-string v5, "PREVIOUS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->PREVIOUS:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->$VALUES:[Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    sput-object v0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->DEFAULT:Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 47
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->$VALUES:[Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    .line 47
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/DocumentSnapshot$ServerTimestampBehavior;

    return-object v0
.end method
