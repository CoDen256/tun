.class public final enum Lcom/google/firestore/v1/Target$TargetTypeCase;
.super Ljava/lang/Enum;
.source "Target.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/Target;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TargetTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/Target$TargetTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/Target$TargetTypeCase;

.field public static final enum DOCUMENTS:Lcom/google/firestore/v1/Target$TargetTypeCase;

.field public static final enum QUERY:Lcom/google/firestore/v1/Target$TargetTypeCase;

.field public static final enum TARGETTYPE_NOT_SET:Lcom/google/firestore/v1/Target$TargetTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1207
    new-instance v0, Lcom/google/firestore/v1/Target$TargetTypeCase;

    const-string v1, "QUERY"

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/Target$TargetTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/Target$TargetTypeCase;->QUERY:Lcom/google/firestore/v1/Target$TargetTypeCase;

    .line 1208
    new-instance v1, Lcom/google/firestore/v1/Target$TargetTypeCase;

    const-string v4, "DOCUMENTS"

    const/4 v5, 0x1

    const/4 v6, 0x3

    invoke-direct {v1, v4, v5, v6}, Lcom/google/firestore/v1/Target$TargetTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/Target$TargetTypeCase;->DOCUMENTS:Lcom/google/firestore/v1/Target$TargetTypeCase;

    .line 1209
    new-instance v4, Lcom/google/firestore/v1/Target$TargetTypeCase;

    const-string v7, "TARGETTYPE_NOT_SET"

    invoke-direct {v4, v7, v3, v2}, Lcom/google/firestore/v1/Target$TargetTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firestore/v1/Target$TargetTypeCase;->TARGETTYPE_NOT_SET:Lcom/google/firestore/v1/Target$TargetTypeCase;

    new-array v6, v6, [Lcom/google/firestore/v1/Target$TargetTypeCase;

    aput-object v0, v6, v2

    aput-object v1, v6, v5

    aput-object v4, v6, v3

    sput-object v6, Lcom/google/firestore/v1/Target$TargetTypeCase;->$VALUES:[Lcom/google/firestore/v1/Target$TargetTypeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1211
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/Target$TargetTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/Target$TargetTypeCase;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/Target$TargetTypeCase;->DOCUMENTS:Lcom/google/firestore/v1/Target$TargetTypeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/Target$TargetTypeCase;->QUERY:Lcom/google/firestore/v1/Target$TargetTypeCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/v1/Target$TargetTypeCase;->TARGETTYPE_NOT_SET:Lcom/google/firestore/v1/Target$TargetTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/Target$TargetTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1219
    invoke-static {p0}, Lcom/google/firestore/v1/Target$TargetTypeCase;->forNumber(I)Lcom/google/firestore/v1/Target$TargetTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/Target$TargetTypeCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/Target$TargetTypeCase;

    .line 1206
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$TargetTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/Target$TargetTypeCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Target$TargetTypeCase;->$VALUES:[Lcom/google/firestore/v1/Target$TargetTypeCase;

    .line 1206
    invoke-virtual {v0}, [Lcom/google/firestore/v1/Target$TargetTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/Target$TargetTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/Target$TargetTypeCase;->value:I

    return v0
.end method
