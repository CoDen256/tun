.class public final enum Lcom/google/firestore/v1/Target$ResumeTypeCase;
.super Ljava/lang/Enum;
.source "Target.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/Target;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResumeTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/Target$ResumeTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/Target$ResumeTypeCase;

.field public static final enum READ_TIME:Lcom/google/firestore/v1/Target$ResumeTypeCase;

.field public static final enum RESUMETYPE_NOT_SET:Lcom/google/firestore/v1/Target$ResumeTypeCase;

.field public static final enum RESUME_TOKEN:Lcom/google/firestore/v1/Target$ResumeTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1250
    new-instance v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const/4 v1, 0x4

    const-string v2, "RESUME_TOKEN"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3, v1}, Lcom/google/firestore/v1/Target$ResumeTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUME_TOKEN:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    .line 1251
    new-instance v1, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const/16 v2, 0xb

    const-string v4, "READ_TIME"

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5, v2}, Lcom/google/firestore/v1/Target$ResumeTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/Target$ResumeTypeCase;->READ_TIME:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    .line 1252
    new-instance v2, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const-string v4, "RESUMETYPE_NOT_SET"

    const/4 v6, 0x2

    invoke-direct {v2, v4, v6, v3}, Lcom/google/firestore/v1/Target$ResumeTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUMETYPE_NOT_SET:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    const/4 v4, 0x3

    new-array v4, v4, [Lcom/google/firestore/v1/Target$ResumeTypeCase;

    aput-object v0, v4, v3

    aput-object v1, v4, v5

    aput-object v2, v4, v6

    sput-object v4, Lcom/google/firestore/v1/Target$ResumeTypeCase;->$VALUES:[Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1254
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/16 v0, 0xb

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->READ_TIME:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUME_TOKEN:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->RESUMETYPE_NOT_SET:Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1262
    invoke-static {p0}, Lcom/google/firestore/v1/Target$ResumeTypeCase;->forNumber(I)Lcom/google/firestore/v1/Target$ResumeTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    .line 1249
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/Target$ResumeTypeCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->$VALUES:[Lcom/google/firestore/v1/Target$ResumeTypeCase;

    .line 1249
    invoke-virtual {v0}, [Lcom/google/firestore/v1/Target$ResumeTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/Target$ResumeTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/Target$ResumeTypeCase;->value:I

    return v0
.end method
