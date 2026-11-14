.class public final enum Lcom/amazon/a/a/o/c/a/d;
.super Ljava/lang/Enum;
.source "IOCase.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/amazon/a/a/o/c/a/d;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/amazon/a/a/o/c/a/d;

.field public static final enum b:Lcom/amazon/a/a/o/c/a/d;

.field public static final enum c:Lcom/amazon/a/a/o/c/a/d;

.field private static final d:J = -0x580776bc651386cfL

.field private static final synthetic g:[Lcom/amazon/a/a/o/c/a/d;


# instance fields
.field private final e:Ljava/lang/String;

.field private final transient f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 45
    new-instance v0, Lcom/amazon/a/a/o/c/a/d;

    const-string v1, "SENSITIVE"

    const/4 v2, 0x0

    const-string v3, "Sensitive"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/amazon/a/a/o/c/a/d;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v0, Lcom/amazon/a/a/o/c/a/d;->a:Lcom/amazon/a/a/o/c/a/d;

    .line 50
    new-instance v1, Lcom/amazon/a/a/o/c/a/d;

    const-string v3, "INSENSITIVE"

    const-string v5, "Insensitive"

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/amazon/a/a/o/c/a/d;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v1, Lcom/amazon/a/a/o/c/a/d;->b:Lcom/amazon/a/a/o/c/a/d;

    .line 64
    new-instance v3, Lcom/amazon/a/a/o/c/a/d;

    invoke-static {}, Lcom/amazon/a/a/o/c/a/b;->a()Z

    move-result v5

    xor-int/2addr v5, v4

    const-string v6, "SYSTEM"

    const/4 v7, 0x2

    const-string v8, "System"

    invoke-direct {v3, v6, v7, v8, v5}, Lcom/amazon/a/a/o/c/a/d;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    sput-object v3, Lcom/amazon/a/a/o/c/a/d;->c:Lcom/amazon/a/a/o/c/a/d;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/amazon/a/a/o/c/a/d;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v7

    sput-object v5, Lcom/amazon/a/a/o/c/a/d;->g:[Lcom/amazon/a/a/o/c/a/d;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 101
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lcom/amazon/a/a/o/c/a/d;->e:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/amazon/a/a/o/c/a/d;->f:Z

    return-void
.end method

.method public static a(Ljava/lang/String;)Lcom/amazon/a/a/o/c/a/d;
    .locals 5

    .line 84
    invoke-static {}, Lcom/amazon/a/a/o/c/a/d;->values()[Lcom/amazon/a/a/o/c/a/d;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 86
    invoke-virtual {v3}, Lcom/amazon/a/a/o/c/a/d;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 91
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid IOCase name: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private c()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/d;->e:Ljava/lang/String;

    .line 113
    invoke-static {v0}, Lcom/amazon/a/a/o/c/a/d;->a(Ljava/lang/String;)Lcom/amazon/a/a/o/c/a/d;

    move-result-object v0

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/a/a/o/c/a/d;
    .locals 1

    const-class v0, Lcom/amazon/a/a/o/c/a/d;

    .line 40
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/amazon/a/a/o/c/a/d;

    return-object p0
.end method

.method public static values()[Lcom/amazon/a/a/o/c/a/d;
    .locals 1

    sget-object v0, Lcom/amazon/a/a/o/c/a/d;->g:[Lcom/amazon/a/a/o/c/a/d;

    .line 40
    invoke-virtual {v0}, [Lcom/amazon/a/a/o/c/a/d;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/a/a/o/c/a/d;

    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;ILjava/lang/String;)I
    .locals 2

    .line 219
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    if-lt v0, p2, :cond_1

    :goto_0
    if-gt p2, v0, :cond_1

    .line 222
    invoke-virtual {p0, p1, p2, p3}, Lcom/amazon/a/a/o/c/a/d;->b(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public a(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    iget-boolean v0, p0, Lcom/amazon/a/a/o/c/a/d;->f:Z

    if-eqz v0, :cond_0

    .line 151
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result p1

    :goto_0
    return p1

    .line 149
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "The strings must not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/d;->e:Ljava/lang/String;

    return-object v0
.end method

.method public b()Z
    .locals 1

    iget-boolean v0, p0, Lcom/amazon/a/a/o/c/a/d;->f:Z

    return v0
.end method

.method public b(Ljava/lang/String;ILjava/lang/String;)Z
    .locals 7

    iget-boolean v0, p0, Lcom/amazon/a/a/o/c/a/d;->f:Z

    xor-int/lit8 v2, v0, 0x1

    const/4 v5, 0x0

    .line 243
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v6

    move-object v1, p1

    move v3, p2

    move-object v4, p3

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result p1

    return p1
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    iget-boolean v0, p0, Lcom/amazon/a/a/o/c/a/d;->f:Z

    if-eqz v0, :cond_0

    .line 169
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    :goto_0
    return p1

    .line 167
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "The strings must not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public c(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7

    iget-boolean v0, p0, Lcom/amazon/a/a/o/c/a/d;->f:Z

    xor-int/lit8 v2, v0, 0x1

    const/4 v3, 0x0

    const/4 v5, 0x0

    .line 184
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v6

    move-object v1, p1

    move-object v4, p2

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result p1

    return p1
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6

    .line 199
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    iget-boolean v0, p0, Lcom/amazon/a/a/o/c/a/d;->f:Z

    xor-int/lit8 v1, v0, 0x1

    .line 200
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    sub-int v2, v0, v5

    const/4 v4, 0x0

    move-object v0, p1

    move-object v3, p2

    invoke-virtual/range {v0 .. v5}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/d;->e:Ljava/lang/String;

    return-object v0
.end method
