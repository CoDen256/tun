.class public final enum Lcom/google/firebase/firestore/core/DocumentViewChange$Type;
.super Ljava/lang/Enum;
.source "DocumentViewChange.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/core/DocumentViewChange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/core/DocumentViewChange$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

.field public static final enum ADDED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

.field public static final enum METADATA:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

.field public static final enum MODIFIED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

.field public static final enum REMOVED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 26
    new-instance v0, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    const-string v1, "REMOVED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->REMOVED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 27
    new-instance v1, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    const-string v3, "ADDED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->ADDED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 28
    new-instance v3, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    const-string v5, "MODIFIED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->MODIFIED:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 29
    new-instance v5, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    const-string v7, "METADATA"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->METADATA:Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    sput-object v7, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->$VALUES:[Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/core/DocumentViewChange$Type;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 25
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/core/DocumentViewChange$Type;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->$VALUES:[Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    .line 25
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/core/DocumentViewChange$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/core/DocumentViewChange$Type;

    return-object v0
.end method
