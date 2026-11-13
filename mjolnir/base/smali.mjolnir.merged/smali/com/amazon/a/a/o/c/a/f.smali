.class public Lcom/amazon/a/a/o/c/a/f;
.super Ljava/io/ObjectInputStream;
.source "ValidatingObjectInputStream.java"


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/amazon/a/a/o/c/a/a;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/amazon/a/a/o/c/a/a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    invoke-direct {p0, p1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 49
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/amazon/a/a/o/c/a/f;->a:Ljava/util/List;

    .line 50
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/amazon/a/a/o/c/a/f;->b:Ljava/util/List;

    return-void
.end method

.method private b(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InvalidClassException;
        }
    .end annotation

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/f;->b:Ljava/util/List;

    .line 73
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/a/a/o/c/a/a;

    .line 74
    invoke-interface {v1, p1}, Lcom/amazon/a/a/o/c/a/a;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 75
    invoke-virtual {p0, p1}, Lcom/amazon/a/a/o/c/a/f;->a(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/f;->a:Ljava/util/List;

    .line 80
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/a/a/o/c/a/a;

    .line 81
    invoke-interface {v1, p1}, Lcom/amazon/a/a/o/c/a/a;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_1

    .line 87
    :cond_3
    invoke-virtual {p0, p1}, Lcom/amazon/a/a/o/c/a/f;->a(Ljava/lang/String;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public a(Lcom/amazon/a/a/o/c/a/a;)Lcom/amazon/a/a/o/c/a/f;
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/f;->a:Ljava/util/List;

    .line 199
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public a(Ljava/util/regex/Pattern;)Lcom/amazon/a/a/o/c/a/f;
    .locals 2

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/f;->a:Ljava/util/List;

    .line 175
    new-instance v1, Lcom/amazon/a/a/o/c/a/e;

    invoke-direct {v1, p1}, Lcom/amazon/a/a/o/c/a/e;-><init>(Ljava/util/regex/Pattern;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public varargs a([Ljava/lang/Class;)Lcom/amazon/a/a/o/c/a/f;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/amazon/a/a/o/c/a/f;"
        }
    .end annotation

    .line 117
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    iget-object v3, p0, Lcom/amazon/a/a/o/c/a/f;->a:Ljava/util/List;

    .line 118
    new-instance v4, Lcom/amazon/a/a/o/c/a/c;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Lcom/amazon/a/a/o/c/a/c;-><init>([Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public varargs a([Ljava/lang/String;)Lcom/amazon/a/a/o/c/a/f;
    .locals 5

    .line 146
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    iget-object v3, p0, Lcom/amazon/a/a/o/c/a/f;->a:Ljava/util/List;

    .line 147
    new-instance v4, Lcom/amazon/a/a/o/c/a/g;

    invoke-direct {v4, v2}, Lcom/amazon/a/a/o/c/a/g;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method protected a(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InvalidClassException;
        }
    .end annotation

    .line 100
    new-instance v0, Ljava/io/InvalidClassException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Class name not accepted: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/InvalidClassException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public b(Lcom/amazon/a/a/o/c/a/a;)Lcom/amazon/a/a/o/c/a/f;
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/f;->b:Ljava/util/List;

    .line 211
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public b(Ljava/util/regex/Pattern;)Lcom/amazon/a/a/o/c/a/f;
    .locals 2

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/f;->b:Ljava/util/List;

    .line 187
    new-instance v1, Lcom/amazon/a/a/o/c/a/e;

    invoke-direct {v1, p1}, Lcom/amazon/a/a/o/c/a/e;-><init>(Ljava/util/regex/Pattern;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public varargs b([Ljava/lang/Class;)Lcom/amazon/a/a/o/c/a/f;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/amazon/a/a/o/c/a/f;"
        }
    .end annotation

    .line 131
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    iget-object v3, p0, Lcom/amazon/a/a/o/c/a/f;->b:Ljava/util/List;

    .line 132
    new-instance v4, Lcom/amazon/a/a/o/c/a/c;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Lcom/amazon/a/a/o/c/a/c;-><init>([Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public varargs b([Ljava/lang/String;)Lcom/amazon/a/a/o/c/a/f;
    .locals 5

    .line 161
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    iget-object v3, p0, Lcom/amazon/a/a/o/c/a/f;->b:Ljava/util/List;

    .line 162
    new-instance v4, Lcom/amazon/a/a/o/c/a/g;

    invoke-direct {v4, v2}, Lcom/amazon/a/a/o/c/a/g;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method protected resolveClass(Ljava/io/ObjectStreamClass;)Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/ObjectStreamClass;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 105
    invoke-virtual {p1}, Ljava/io/ObjectStreamClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazon/a/a/o/c/a/f;->b(Ljava/lang/String;)V

    .line 106
    invoke-super {p0, p1}, Ljava/io/ObjectInputStream;->resolveClass(Ljava/io/ObjectStreamClass;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
