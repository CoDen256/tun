.class public final enum Lcom/facebook/common/memory/MemoryTrimType;
.super Ljava/lang/Enum;
.source "MemoryTrimType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/common/memory/MemoryTrimType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnAppBackgrounded:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnCloseToDalvikHeapLimit:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnJavaMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnJavaMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemLowMemoryWhileAppInBackgroundLowSeverity:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemLowMemoryWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemMemoryCriticallyLowWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

.field public static final enum OnSystemMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;


# instance fields
.field private mSuggestedTrimRatio:D


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 23
    new-instance v0, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v1, "OnCloseToDalvikHeapLimit"

    const/4 v2, 0x0

    const-wide/high16 v3, 0x3fe0000000000000L    # 0.5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v0, Lcom/facebook/common/memory/MemoryTrimType;->OnCloseToDalvikHeapLimit:Lcom/facebook/common/memory/MemoryTrimType;

    .line 26
    new-instance v1, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v5, "OnSystemMemoryCriticallyLowWhileAppInForeground"

    const/4 v6, 0x1

    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    invoke-direct {v1, v5, v6, v7, v8}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v1, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemMemoryCriticallyLowWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

    .line 29
    new-instance v5, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v9, "OnSystemLowMemoryWhileAppInForeground"

    const/4 v10, 0x2

    invoke-direct {v5, v9, v10, v3, v4}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v5, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemLowMemoryWhileAppInForeground:Lcom/facebook/common/memory/MemoryTrimType;

    .line 32
    new-instance v9, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v11, "OnSystemLowMemoryWhileAppInBackgroundLowSeverity"

    const/4 v12, 0x3

    invoke-direct {v9, v11, v12, v7, v8}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v9, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemLowMemoryWhileAppInBackgroundLowSeverity:Lcom/facebook/common/memory/MemoryTrimType;

    .line 35
    new-instance v11, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v13, "OnAppBackgrounded"

    const/4 v14, 0x4

    invoke-direct {v11, v13, v14, v7, v8}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v11, Lcom/facebook/common/memory/MemoryTrimType;->OnAppBackgrounded:Lcom/facebook/common/memory/MemoryTrimType;

    .line 38
    new-instance v13, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v15, "OnJavaMemoryRed"

    const/4 v14, 0x5

    invoke-direct {v13, v15, v14, v7, v8}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v13, Lcom/facebook/common/memory/MemoryTrimType;->OnJavaMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

    .line 41
    new-instance v15, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v14, "OnJavaMemoryYellow"

    const/4 v12, 0x6

    invoke-direct {v15, v14, v12, v3, v4}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v15, Lcom/facebook/common/memory/MemoryTrimType;->OnJavaMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;

    .line 44
    new-instance v14, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v12, "OnSystemMemoryRed"

    const/4 v10, 0x7

    invoke-direct {v14, v12, v10, v7, v8}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v14, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemMemoryRed:Lcom/facebook/common/memory/MemoryTrimType;

    .line 47
    new-instance v7, Lcom/facebook/common/memory/MemoryTrimType;

    const-string v8, "OnSystemMemoryYellow"

    const/16 v12, 0x8

    invoke-direct {v7, v8, v12, v3, v4}, Lcom/facebook/common/memory/MemoryTrimType;-><init>(Ljava/lang/String;ID)V

    sput-object v7, Lcom/facebook/common/memory/MemoryTrimType;->OnSystemMemoryYellow:Lcom/facebook/common/memory/MemoryTrimType;

    const/16 v3, 0x9

    new-array v3, v3, [Lcom/facebook/common/memory/MemoryTrimType;

    aput-object v0, v3, v2

    aput-object v1, v3, v6

    const/4 v0, 0x2

    aput-object v5, v3, v0

    const/4 v0, 0x3

    aput-object v9, v3, v0

    const/4 v0, 0x4

    aput-object v11, v3, v0

    const/4 v0, 0x5

    aput-object v13, v3, v0

    const/4 v0, 0x6

    aput-object v15, v3, v0

    aput-object v14, v3, v10

    aput-object v7, v3, v12

    sput-object v3, Lcom/facebook/common/memory/MemoryTrimType;->$VALUES:[Lcom/facebook/common/memory/MemoryTrimType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ID)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(D)V"
        }
    .end annotation

    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-wide p3, p0, Lcom/facebook/common/memory/MemoryTrimType;->mSuggestedTrimRatio:D

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/common/memory/MemoryTrimType;
    .locals 1

    const-class v0, Lcom/facebook/common/memory/MemoryTrimType;

    .line 19
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/facebook/common/memory/MemoryTrimType;

    return-object p0
.end method

.method public static values()[Lcom/facebook/common/memory/MemoryTrimType;
    .locals 1

    sget-object v0, Lcom/facebook/common/memory/MemoryTrimType;->$VALUES:[Lcom/facebook/common/memory/MemoryTrimType;

    .line 19
    invoke-virtual {v0}, [Lcom/facebook/common/memory/MemoryTrimType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/common/memory/MemoryTrimType;

    return-object v0
.end method


# virtual methods
.method public getSuggestedTrimRatio()D
    .locals 2

    iget-wide v0, p0, Lcom/facebook/common/memory/MemoryTrimType;->mSuggestedTrimRatio:D

    return-wide v0
.end method
