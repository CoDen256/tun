.class public final enum Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;
.super Ljava/lang/Enum;
.source "ListenResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/ListenResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResponseTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

.field public static final enum DOCUMENT_CHANGE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

.field public static final enum DOCUMENT_DELETE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

.field public static final enum DOCUMENT_REMOVE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

.field public static final enum FILTER:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

.field public static final enum RESPONSETYPE_NOT_SET:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

.field public static final enum TARGET_CHANGE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 23
    new-instance v0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    const-string v1, "TARGET_CHANGE"

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->TARGET_CHANGE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    .line 24
    new-instance v1, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    const-string v4, "DOCUMENT_CHANGE"

    const/4 v5, 0x1

    const/4 v6, 0x3

    invoke-direct {v1, v4, v5, v6}, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->DOCUMENT_CHANGE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    .line 25
    new-instance v4, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    const-string v7, "DOCUMENT_DELETE"

    const/4 v8, 0x4

    invoke-direct {v4, v7, v3, v8}, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->DOCUMENT_DELETE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    .line 26
    new-instance v7, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    const-string v9, "DOCUMENT_REMOVE"

    const/4 v10, 0x6

    invoke-direct {v7, v9, v6, v10}, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->DOCUMENT_REMOVE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    .line 27
    new-instance v9, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    const-string v11, "FILTER"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v8, v12}, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->FILTER:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    .line 28
    new-instance v11, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    const-string v13, "RESPONSETYPE_NOT_SET"

    invoke-direct {v11, v13, v12, v2}, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->RESPONSETYPE_NOT_SET:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    new-array v10, v10, [Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    aput-object v0, v10, v2

    aput-object v1, v10, v5

    aput-object v4, v10, v3

    aput-object v7, v10, v6

    aput-object v9, v10, v8

    aput-object v11, v10, v12

    sput-object v10, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->$VALUES:[Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;
    .locals 1

    if-eqz p0, :cond_5

    const/4 v0, 0x2

    if-eq p0, v0, :cond_4

    const/4 v0, 0x3

    if-eq p0, v0, :cond_3

    const/4 v0, 0x4

    if-eq p0, v0, :cond_2

    const/4 v0, 0x5

    if-eq p0, v0, :cond_1

    const/4 v0, 0x6

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->DOCUMENT_REMOVE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->FILTER:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->DOCUMENT_DELETE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object p0

    :cond_3
    sget-object p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->DOCUMENT_CHANGE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object p0

    :cond_4
    sget-object p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->TARGET_CHANGE:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object p0

    :cond_5
    sget-object p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->RESPONSETYPE_NOT_SET:Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 38
    invoke-static {p0}, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->forNumber(I)Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    .line 22
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->$VALUES:[Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    .line 22
    invoke-virtual {v0}, [Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/v1/ListenResponse$ResponseTypeCase;->value:I

    return v0
.end method
