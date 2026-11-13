.class public final enum Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;
.super Ljava/lang/Enum;
.source "Index.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firestore/admin/v1/Index$IndexField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ValueModeCase"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

.field public static final enum ARRAY_CONFIG:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

.field public static final enum ORDER:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

.field public static final enum VALUEMODE_NOT_SET:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 672
    new-instance v0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    const-string v1, "ORDER"

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-direct {v0, v1, v2, v3}, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->ORDER:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    .line 673
    new-instance v1, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    const-string v4, "ARRAY_CONFIG"

    const/4 v5, 0x1

    const/4 v6, 0x3

    invoke-direct {v1, v4, v5, v6}, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->ARRAY_CONFIG:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    .line 674
    new-instance v4, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    const-string v7, "VALUEMODE_NOT_SET"

    invoke-direct {v4, v7, v3, v2}, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->VALUEMODE_NOT_SET:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    new-array v6, v6, [Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    aput-object v0, v6, v2

    aput-object v1, v6, v5

    aput-object v4, v6, v3

    sput-object v6, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->$VALUES:[Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 676
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->value:I

    return-void
.end method

.method public static forNumber(I)Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;
    .locals 1

    if-eqz p0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object p0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->ARRAY_CONFIG:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    return-object p0

    :cond_1
    sget-object p0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->ORDER:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    return-object p0

    :cond_2
    sget-object p0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->VALUEMODE_NOT_SET:Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    return-object p0
.end method

.method public static valueOf(I)Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 684
    invoke-static {p0}, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->forNumber(I)Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;
    .locals 1

    const-class v0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    .line 671
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    return-object p0
.end method

.method public static values()[Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;
    .locals 1

    sget-object v0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->$VALUES:[Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    .line 671
    invoke-virtual {v0}, [Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;

    return-object v0
.end method


# virtual methods
.method public getNumber()I
    .locals 1

    iget v0, p0, Lcom/google/firestore/admin/v1/Index$IndexField$ValueModeCase;->value:I

    return v0
.end method
