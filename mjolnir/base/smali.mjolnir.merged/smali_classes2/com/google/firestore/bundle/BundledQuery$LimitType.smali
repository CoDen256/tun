.class public final enum Lcom/google/firestore/bundle/BundledQuery$LimitType;
.super Ljava/lang/Enum;
.source "BundledQuery.java"

# interfaces
.implements Lcom/google/protobuf/Internal$EnumLite;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/bundle/BundledQuery;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LimitType"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firestore/bundle/BundledQuery$LimitType$LimitTypeVerifier;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/bundle/BundledQuery$LimitType;",
        ">;",
        "Lcom/google/protobuf/Internal$EnumLite;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/bundle/BundledQuery$LimitType;

.field public static final enum FIRST:Lcom/google/firestore/bundle/BundledQuery$LimitType;

.field public static final FIRST_VALUE:I = 0x0

.field public static final enum LAST:Lcom/google/firestore/bundle/BundledQuery$LimitType;

.field public static final LAST_VALUE:I = 0x1

.field public static final enum UNRECOGNIZED:Lcom/google/firestore/bundle/BundledQuery$LimitType;

.field private static final internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/Internal$EnumLiteMap<",
            "Lcom/google/firestore/bundle/BundledQuery$LimitType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 34
    new-instance v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;

    const-string v1, "FIRST"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/google/firestore/bundle/BundledQuery$LimitType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->FIRST:Lcom/google/firestore/bundle/BundledQuery$LimitType;

    .line 38
    new-instance v1, Lcom/google/firestore/bundle/BundledQuery$LimitType;

    const-string v3, "LAST"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/google/firestore/bundle/BundledQuery$LimitType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/bundle/BundledQuery$LimitType;->LAST:Lcom/google/firestore/bundle/BundledQuery$LimitType;

    .line 39
    new-instance v3, Lcom/google/firestore/bundle/BundledQuery$LimitType;

    const/4 v5, -0x1

    const-string v6, "UNRECOGNIZED"

    const/4 v7, 0x2

    invoke-direct {v3, v6, v7, v5}, Lcom/google/firestore/bundle/BundledQuery$LimitType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/google/firestore/bundle/BundledQuery$LimitType;->UNRECOGNIZED:Lcom/google/firestore/bundle/BundledQuery$LimitType;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/google/firestore/bundle/BundledQuery$LimitType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v7

    sput-object v5, Lcom/google/firestore/bundle/BundledQuery$LimitType;->$VALUES:[Lcom/google/firestore/bundle/BundledQuery$LimitType;

    .line 84
    new-instance v0, Lcom/google/firestore/bundle/BundledQuery$LimitType$1;

    invoke-direct {v0}, Lcom/google/firestore/bundle/BundledQuery$LimitType$1;-><init>()V

    sput-object v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 108
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/bundle/BundledQuery$LimitType;
    .locals 1

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->LAST:Lcom/google/firestore/bundle/BundledQuery$LimitType;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->FIRST:Lcom/google/firestore/bundle/BundledQuery$LimitType;

    return-object p0
.end method

.method public static internalGetValueMap()Lcom/google/protobuf/Internal$EnumLiteMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/protobuf/Internal$EnumLiteMap<",
            "Lcom/google/firestore/bundle/BundledQuery$LimitType;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->internalValueMap:Lcom/google/protobuf/Internal$EnumLiteMap;

    return-object v0
.end method

.method public static internalGetVerifier()Lcom/google/protobuf/Internal$EnumVerifier;
    .locals 1

    .line 94
    sget-object v0, Lcom/google/firestore/bundle/BundledQuery$LimitType$LimitTypeVerifier;->INSTANCE:Lcom/google/protobuf/Internal$EnumVerifier;

    return-object v0
.end method

.method public static valueOf(I)Lcom/google/firestore/bundle/BundledQuery$LimitType;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 68
    invoke-static {p0}, Lcom/google/firestore/bundle/BundledQuery$LimitType;->forNumber(I)Lcom/google/firestore/bundle/BundledQuery$LimitType;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/bundle/BundledQuery$LimitType;
    .locals 1

    const-class v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;

    .line 29
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/bundle/BundledQuery$LimitType;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/bundle/BundledQuery$LimitType;
    .locals 1

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->$VALUES:[Lcom/google/firestore/bundle/BundledQuery$LimitType;

    .line 29
    invoke-virtual {v0}, [Lcom/google/firestore/bundle/BundledQuery$LimitType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/bundle/BundledQuery$LimitType;

    return-object v0
.end method


# virtual methods
.method public final getNumber()I
    .locals 2

    sget-object v0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->UNRECOGNIZED:Lcom/google/firestore/bundle/BundledQuery$LimitType;

    if-eq p0, v0, :cond_0

    iget v0, p0, Lcom/google/firestore/bundle/BundledQuery$LimitType;->value:I

    return v0

    .line 55
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Can\'t get the number of an unknown enum value."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
