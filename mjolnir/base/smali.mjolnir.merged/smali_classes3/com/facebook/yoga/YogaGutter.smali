.class public final enum Lcom/facebook/yoga/YogaGutter;
.super Ljava/lang/Enum;
.source "YogaGutter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/yoga/YogaGutter;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/yoga/YogaGutter;

.field public static final enum ALL:Lcom/facebook/yoga/YogaGutter;

.field public static final enum COLUMN:Lcom/facebook/yoga/YogaGutter;

.field public static final enum ROW:Lcom/facebook/yoga/YogaGutter;


# instance fields
.field private final mIntValue:I


# direct methods
.method private static synthetic $values()[Lcom/facebook/yoga/YogaGutter;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/facebook/yoga/YogaGutter;

    const/4 v1, 0x0

    sget-object v2, Lcom/facebook/yoga/YogaGutter;->COLUMN:Lcom/facebook/yoga/YogaGutter;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/facebook/yoga/YogaGutter;->ROW:Lcom/facebook/yoga/YogaGutter;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    sget-object v2, Lcom/facebook/yoga/YogaGutter;->ALL:Lcom/facebook/yoga/YogaGutter;

    aput-object v2, v0, v1

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 13
    new-instance v0, Lcom/facebook/yoga/YogaGutter;

    const-string v1, "COLUMN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/YogaGutter;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/YogaGutter;->COLUMN:Lcom/facebook/yoga/YogaGutter;

    .line 14
    new-instance v0, Lcom/facebook/yoga/YogaGutter;

    const-string v1, "ROW"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/YogaGutter;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/YogaGutter;->ROW:Lcom/facebook/yoga/YogaGutter;

    .line 15
    new-instance v0, Lcom/facebook/yoga/YogaGutter;

    const-string v1, "ALL"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2, v2}, Lcom/facebook/yoga/YogaGutter;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/yoga/YogaGutter;->ALL:Lcom/facebook/yoga/YogaGutter;

    .line 12
    invoke-static {}, Lcom/facebook/yoga/YogaGutter;->$values()[Lcom/facebook/yoga/YogaGutter;

    move-result-object v0

    sput-object v0, Lcom/facebook/yoga/YogaGutter;->$VALUES:[Lcom/facebook/yoga/YogaGutter;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/facebook/yoga/YogaGutter;->mIntValue:I

    return-void
.end method

.method public static fromInt(I)Lcom/facebook/yoga/YogaGutter;
    .locals 3

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    if-eq p0, v0, :cond_1

    const/4 v0, 0x2

    if-ne p0, v0, :cond_0

    sget-object p0, Lcom/facebook/yoga/YogaGutter;->ALL:Lcom/facebook/yoga/YogaGutter;

    return-object p0

    .line 32
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unknown enum value: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    sget-object p0, Lcom/facebook/yoga/YogaGutter;->ROW:Lcom/facebook/yoga/YogaGutter;

    return-object p0

    :cond_2
    sget-object p0, Lcom/facebook/yoga/YogaGutter;->COLUMN:Lcom/facebook/yoga/YogaGutter;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/yoga/YogaGutter;
    .locals 1

    const-class v0, Lcom/facebook/yoga/YogaGutter;

    .line 12
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/yoga/YogaGutter;

    return-object p0
.end method

.method public static values()[Lcom/facebook/yoga/YogaGutter;
    .locals 1

    sget-object v0, Lcom/facebook/yoga/YogaGutter;->$VALUES:[Lcom/facebook/yoga/YogaGutter;

    .line 12
    invoke-virtual {v0}, [Lcom/facebook/yoga/YogaGutter;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/yoga/YogaGutter;

    return-object v0
.end method


# virtual methods
.method public intValue()I
    .locals 1

    iget v0, p0, Lcom/facebook/yoga/YogaGutter;->mIntValue:I

    return v0
.end method
