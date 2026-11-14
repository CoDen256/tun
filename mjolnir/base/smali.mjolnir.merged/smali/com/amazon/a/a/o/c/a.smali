.class public Lcom/amazon/a/a/o/c/a;
.super Ljava/lang/Object;
.source "Serializer.java"


# static fields
.field private static final a:Lcom/amazon/a/a/o/c;

.field private static final b:[Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 22
    new-instance v0, Lcom/amazon/a/a/o/c;

    const-string v1, "Serializer"

    invoke-direct {v0, v1}, Lcom/amazon/a/a/o/c;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/amazon/a/a/o/c/a;->a:Lcom/amazon/a/a/o/c;

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    .line 27
    const-class v2, Lcom/amazon/a/a/b/c;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-class v2, Ljava/util/HashMap;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljava/util/LinkedHashMap;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/a/a/o/c/a;->b:[Ljava/lang/Class;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    const-string v0, "Could not read object from string: "

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    .line 69
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    goto :goto_3

    .line 75
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/c/a/a/c;->c([B)[B

    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 86
    :try_start_1
    new-instance v3, Lcom/amazon/a/a/o/c/a/f;

    new-instance v4, Ljava/io/ByteArrayInputStream;

    invoke-direct {v4, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v3, v4}, Lcom/amazon/a/a/o/c/a/f;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    sget-object v2, Lcom/amazon/a/a/o/c/a;->b:[Ljava/lang/Class;

    .line 89
    invoke-virtual {v3, v2}, Lcom/amazon/a/a/o/c/a/f;->a([Ljava/lang/Class;)Lcom/amazon/a/a/o/c/a/f;

    .line 93
    invoke-virtual {v3}, Lcom/amazon/a/a/o/c/a/f;->readObject()Ljava/lang/Object;

    move-result-object v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    :catch_0
    move-exception v2

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_1
    move-exception v2

    move-object v3, v1

    .line 95
    :goto_0
    :try_start_3
    sget-boolean v4, Lcom/amazon/a/a/o/c;->b:Z

    if-eqz v4, :cond_1

    sget-object v4, Lcom/amazon/a/a/o/c/a;->a:Lcom/amazon/a/a/o/c;

    .line 96
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0, v2}, Lcom/amazon/a/a/o/c;->b(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 100
    :cond_1
    :goto_1
    invoke-static {v3}, Lcom/amazon/a/a/o/a;->a(Ljava/io/InputStream;)V

    return-object v1

    :catchall_1
    move-exception p0

    move-object v1, v3

    :goto_2
    invoke-static {v1}, Lcom/amazon/a/a/o/a;->a(Ljava/io/InputStream;)V

    .line 101
    throw p0

    :catch_2
    move-exception p0

    .line 77
    sget-boolean v0, Lcom/amazon/a/a/o/c;->b:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/amazon/a/a/o/c/a;->a:Lcom/amazon/a/a/o/c;

    const-string v2, "Could not decode string"

    .line 78
    invoke-virtual {v0, v2, p0}, Lcom/amazon/a/a/o/c;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_3
    return-object v1
.end method

.method public static a(Ljava/io/Serializable;)Ljava/lang/String;
    .locals 6

    const-string v0, "Could not serialize object: "

    const/4 v1, 0x0

    if-nez p0, :cond_0

    return-object v1

    .line 42
    :cond_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 45
    :try_start_0
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-direct {v3, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :try_start_1
    invoke-virtual {v3, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 48
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lcom/amazon/c/a/a/c;->a([B)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 55
    invoke-static {v3}, Lcom/amazon/a/a/o/a;->a(Ljava/io/OutputStream;)V

    return-object p0

    :catch_0
    move-exception v2

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception v2

    move-object v3, v1

    .line 50
    :goto_0
    :try_start_2
    sget-boolean v4, Lcom/amazon/a/a/o/c;->b:Z

    if-eqz v4, :cond_1

    sget-object v4, Lcom/amazon/a/a/o/c/a;->a:Lcom/amazon/a/a/o/c;

    .line 51
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0, v2}, Lcom/amazon/a/a/o/c;->b(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 55
    :cond_1
    invoke-static {v3}, Lcom/amazon/a/a/o/a;->a(Ljava/io/OutputStream;)V

    return-object v1

    :catchall_1
    move-exception p0

    move-object v1, v3

    :goto_1
    invoke-static {v1}, Lcom/amazon/a/a/o/a;->a(Ljava/io/OutputStream;)V

    .line 56
    throw p0
.end method
