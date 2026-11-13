.class public final enum Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;
.super Ljava/lang/Enum;
.source "DocumentTransform.java"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLite;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/v1/DocumentTransform$FieldTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ServerValue"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue$ServerValueVerifier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;",
        ">;",
        "Lcom/google/protobuf/Internal$EnumLite;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

.field public static final enum REQUEST_TIME:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

.field public static final REQUEST_TIME_VALUE:I = 0x1

.field public static final enum SERVER_VALUE_UNSPECIFIED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

.field public static final SERVER_VALUE_UNSPECIFIED_VALUE:I

.field public static final enum UNRECOGNIZED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

.field private static final internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap<",
            "Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 292
    new-instance v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    const-string v1, "SERVER_VALUE_UNSPECIFIED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->SERVER_VALUE_UNSPECIFIED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    .line 301
    new-instance v1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    const-string v3, "REQUEST_TIME"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->REQUEST_TIME:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    .line 302
    new-instance v3, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    const/4 v5, -0x1

    const-string v6, "UNRECOGNIZED"

    const/4 v7, 0x2

    invoke-direct {v3, v6, v7, v5}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->UNRECOGNIZED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v7

    sput-object v5, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->$VALUES:[Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    .line 356
    new-instance v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue$1;

    invoke-direct {v0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue$1;-><init>()V

    sput-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 380
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->REQUEST_TIME:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->SERVER_VALUE_UNSPECIFIED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Internal$EnumLiteMap<",
            "Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static internalGetVerifier()Lcom/google/protobuf/Internal$EnumVerifier;
    .locals 1

    .line 366
    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue$ServerValueVerifier;->INSTANCE:Lcom/google/protobuf/Internal$EnumVerifier;

    return-object v0
.end method

.method public static valueOf(I)Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 340
    invoke-static {p0}, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->forNumber(I)Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;
    .locals 1

    const-class v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    .line 283
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;
    .locals 1

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->$VALUES:[Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    .line 283
    invoke-virtual {v0}, [Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 2

    sget-object v0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->UNRECOGNIZED:Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;

    if-eq p0, v0, :cond_0

    iget v0, p0, Lcom/google/firestore/v1/DocumentTransform$FieldTransform$ServerValue;->value:I

    return v0

    .line 327
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t get the number of an unknown enum value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
