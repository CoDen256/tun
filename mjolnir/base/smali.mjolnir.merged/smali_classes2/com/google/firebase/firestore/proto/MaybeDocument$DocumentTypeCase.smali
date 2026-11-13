.class public final enum Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;
.super Ljava/lang/Enum;
.source "MaybeDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/firestore/proto/MaybeDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "DocumentTypeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

.field public static final enum DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

.field public static final enum DOCUMENTTYPE_NOT_SET:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

.field public static final enum NO_DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

.field public static final enum UNKNOWN_DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 25
    new-instance v0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    const-string v1, "NO_DOCUMENT"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->NO_DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    .line 26
    new-instance v1, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    const-string v4, "DOCUMENT"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    .line 27
    new-instance v4, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    const-string v6, "UNKNOWN_DOCUMENT"

    const/4 v7, 0x3

    invoke-direct {v4, v6, v5, v7}, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->UNKNOWN_DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    .line 28
    new-instance v6, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    const-string v8, "DOCUMENTTYPE_NOT_SET"

    invoke-direct {v6, v8, v7, v2}, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->DOCUMENTTYPE_NOT_SET:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    const/4 v8, 0x4

    new-array v8, v8, [Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    aput-object v0, v8, v2

    aput-object v1, v8, v3

    aput-object v4, v8, v5

    aput-object v6, v8, v7

    sput-object v8, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->$VALUES:[Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

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

    iput p3, p0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;
    .locals 1

    if-eqz p0, :cond_3

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->UNKNOWN_DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->NO_DOCUMENT:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    return-object p0

    :cond_3
    sget-object p0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->DOCUMENTTYPE_NOT_SET:Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 38
    invoke-static {p0}, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->forNumber(I)Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;
    .locals 1

    const-class v0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    .line 24
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;
    .locals 1

    sget-object v0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->$VALUES:[Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    .line 24
    invoke-virtual {v0}, [Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firebase/firestore/proto/MaybeDocument$DocumentTypeCase;->value:I

    return v0
.end method
