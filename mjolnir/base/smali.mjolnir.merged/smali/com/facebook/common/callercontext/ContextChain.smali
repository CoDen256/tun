.class public Lcom/facebook/common/callercontext/ContextChain;
.super Ljava/lang/Object;
.source "ContextChain.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/facebook/common/callercontext/ContextChain;",
            ">;"
        }
    .end annotation
.end field

.field private static final PARENT_SEPARATOR:C = '/'

.field public static final TAG_INFRA:Ljava/lang/String; = "i"

.field public static final TAG_PRODUCT:Ljava/lang/String; = "p"

.field public static final TAG_PRODUCT_AND_INFRA:Ljava/lang/String; = "pi"

.field private static sUseConcurrentHashMap:Z = false


# instance fields
.field private mExtraData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mName:Ljava/lang/String;

.field private final mParent:Lcom/facebook/common/callercontext/ContextChain;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mSerializedChainString:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mSerializedNodeString:Ljava/lang/String;

.field private final mTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 211
    new-instance v0, Lcom/facebook/common/callercontext/ContextChain$1;

    invoke-direct {v0}, Lcom/facebook/common/callercontext/ContextChain$1;-><init>()V

    sput-object v0, Lcom/facebook/common/callercontext/ContextChain;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    const-class v0, Lcom/facebook/common/callercontext/ContextChain;

    .line 97
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/facebook/common/callercontext/ContextChain;

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/facebook/common/callercontext/ContextChain;)V
    .locals 3
    .param p2    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const-string v0, "serialized_name"

    const/4 v1, 0x0

    const-string v2, "serialized_tag"

    .line 85
    invoke-direct {p0, v2, v0, v1, p2}, Lcom/facebook/common/callercontext/ContextChain;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/facebook/common/callercontext/ContextChain;)V

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/common/callercontext/ContextChain;)V
    .locals 1
    .param p3    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/facebook/common/callercontext/ContextChain;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/facebook/common/callercontext/ContextChain;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/facebook/common/callercontext/ContextChain;)V
    .locals 1
    .param p3    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/facebook/common/callercontext/ContextChain;",
            ")V"
        }
    .end annotation

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    iput-object p2, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    iput-object p4, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    if-eqz p4, :cond_0

    .line 62
    invoke-virtual {p4}, Lcom/facebook/common/callercontext/ContextChain;->getExtraData()Ljava/util/Map;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    sget-boolean p2, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz p2, :cond_1

    .line 66
    new-instance p2, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p2, p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(Ljava/util/Map;)V

    iput-object p2, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    goto :goto_1

    .line 68
    :cond_1
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object p2, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    :cond_2
    :goto_1
    if-eqz p3, :cond_5

    iget-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    if-nez p1, :cond_4

    sget-boolean p1, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz p1, :cond_3

    .line 75
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    goto :goto_2

    .line 77
    :cond_3
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    .line 80
    invoke-interface {p1, p3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_5
    return-void
.end method

.method public static setUseConcurrentHashMap(Z)V
    .locals 0

    sput-boolean p0, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_3

    .line 183
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    .line 186
    :cond_1
    check-cast p1, Lcom/facebook/common/callercontext/ContextChain;

    .line 187
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/facebook/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    iget-object p1, p1, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    .line 188
    invoke-static {v2, p1}, Lcom/facebook/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    :goto_0
    return v0

    :cond_3
    :goto_1
    return v1
.end method

.method public getExtraData()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    return-object v0
.end method

.method protected getNodeString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lcom/facebook/common/callercontext/ContextChain;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    return-object v0
.end method

.method public getRootContextChain()Lcom/facebook/common/callercontext/ContextChain;
    .locals 1

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    if-nez v0, :cond_0

    move-object v0, p0

    goto :goto_0

    .line 124
    :cond_0
    invoke-virtual {v0}, Lcom/facebook/common/callercontext/ContextChain;->getRootContextChain()Lcom/facebook/common/callercontext/ContextChain;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    sget-boolean v2, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz v2, :cond_1

    if-nez p1, :cond_1

    return-object v1

    .line 135
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_0

    .line 136
    :cond_2
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 193
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 194
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public putObjectExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    sget-boolean v0, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    if-nez v1, :cond_3

    if-eqz v0, :cond_2

    .line 146
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    goto :goto_0

    .line 148
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    .line 151
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 157
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    if-eqz v0, :cond_0

    .line 159
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    invoke-virtual {v1}, Lcom/facebook/common/callercontext/ContextChain;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    return-object v0
.end method

.method public toStringArray()[Ljava/lang/String;
    .locals 2

    .line 175
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    .line 205
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    .line 206
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 207
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    .line 208
    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
