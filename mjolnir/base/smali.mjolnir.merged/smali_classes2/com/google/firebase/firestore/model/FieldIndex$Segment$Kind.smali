.class public final enum Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;
.super Ljava/lang/Enum;
.source "FieldIndex.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/model/FieldIndex$Segment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Kind"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

.field public static final enum ASCENDING:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

.field public static final enum CONTAINS:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

.field public static final enum DESCENDING:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 73
    new-instance v0, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    const-string v1, "ASCENDING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->ASCENDING:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    .line 75
    new-instance v1, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    const-string v3, "DESCENDING"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->DESCENDING:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    .line 77
    new-instance v3, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    const-string v5, "CONTAINS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->CONTAINS:Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    sput-object v5, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->$VALUES:[Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 71
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    .line 71
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->$VALUES:[Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    .line 71
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/model/FieldIndex$Segment$Kind;

    return-object v0
.end method
