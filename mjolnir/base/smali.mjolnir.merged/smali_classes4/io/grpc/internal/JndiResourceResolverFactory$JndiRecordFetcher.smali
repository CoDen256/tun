.class final Lio/grpc/internal/JndiResourceResolverFactory$JndiRecordFetcher;
.super Ljava/lang/Object;
.source "JndiResourceResolverFactory.java"

# interfaces
.implements Lio/grpc/internal/JndiResourceResolverFactory$RecordFetcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/internal/JndiResourceResolverFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "JndiRecordFetcher"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 195
    const-class v0, Lio/grpc/internal/JndiResourceResolverFactory;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkAvailable()V
    .locals 3

    .line 265
    invoke-static {}, Lio/grpc/internal/JndiResourceResolverFactory;->access$000()Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 266
    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "JNDI is not currently available"

    .line 267
    invoke-static {}, Lio/grpc/internal/JndiResourceResolverFactory;->access$000()Ljava/lang/Throwable;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static closeThenThrow(Ljavax/naming/NamingEnumeration;Ljavax/naming/NamingException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/naming/NamingEnumeration<",
            "*>;",
            "Ljavax/naming/NamingException;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/naming/NamingException;
        }
    .end annotation

    .line 248
    :try_start_0
    invoke-interface {p0}, Ljavax/naming/NamingEnumeration;->close()V
    :try_end_0
    .catch Ljavax/naming/NamingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 252
    :catch_0
    throw p1
.end method

.method private static closeThenThrow(Ljavax/naming/directory/DirContext;Ljavax/naming/NamingException;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/naming/NamingException;
        }
    .end annotation

    .line 257
    :try_start_0
    invoke-interface {p0}, Ljavax/naming/directory/DirContext;->close()V
    :try_end_0
    .catch Ljavax/naming/NamingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 261
    :catch_0
    throw p1
.end method


# virtual methods
.method public getAllRecords(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/naming/NamingException;
        }
    .end annotation

    .line 206
    invoke-static {}, Lio/grpc/internal/JndiResourceResolverFactory$JndiRecordFetcher;->checkAvailable()V

    .line 207
    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    .line 208
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 210
    new-instance v1, Ljava/util/Hashtable;

    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    const-string v2, "com.sun.jndi.ldap.connect.timeout"

    const-string v3, "5000"

    .line 211
    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "com.sun.jndi.ldap.read.timeout"

    .line 212
    invoke-virtual {v1, v2, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    new-instance v2, Ljavax/naming/directory/InitialDirContext;

    invoke-direct {v2, v1}, Ljavax/naming/directory/InitialDirContext;-><init>(Ljava/util/Hashtable;)V

    .line 216
    :try_start_0
    invoke-interface {v2, p2, p1}, Ljavax/naming/directory/DirContext;->getAttributes(Ljava/lang/String;[Ljava/lang/String;)Ljavax/naming/directory/Attributes;

    move-result-object p1

    .line 217
    invoke-interface {p1}, Ljavax/naming/directory/Attributes;->getAll()Ljavax/naming/NamingEnumeration;

    move-result-object p1
    :try_end_0
    .catch Ljavax/naming/NamingException; {:try_start_0 .. :try_end_0} :catch_2

    .line 220
    :goto_0
    :try_start_1
    invoke-interface {p1}, Ljavax/naming/NamingEnumeration;->hasMore()Z

    move-result p2

    if-eqz p2, :cond_1

    .line 221
    invoke-interface {p1}, Ljavax/naming/NamingEnumeration;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljavax/naming/directory/Attribute;

    .line 223
    invoke-interface {p2}, Ljavax/naming/directory/Attribute;->getAll()Ljavax/naming/NamingEnumeration;

    move-result-object p2
    :try_end_1
    .catch Ljavax/naming/NamingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 225
    :goto_1
    :try_start_2
    invoke-interface {p2}, Ljavax/naming/NamingEnumeration;->hasMore()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 226
    invoke-interface {p2}, Ljavax/naming/NamingEnumeration;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljavax/naming/NamingException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 229
    :try_start_3
    invoke-static {p2, v1}, Lio/grpc/internal/JndiResourceResolverFactory$JndiRecordFetcher;->closeThenThrow(Ljavax/naming/NamingEnumeration;Ljavax/naming/NamingException;)V

    .line 231
    :cond_0
    invoke-interface {p2}, Ljavax/naming/NamingEnumeration;->close()V
    :try_end_3
    .catch Ljavax/naming/NamingException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    :catch_1
    move-exception p2

    .line 234
    :try_start_4
    invoke-static {p1, p2}, Lio/grpc/internal/JndiResourceResolverFactory$JndiRecordFetcher;->closeThenThrow(Ljavax/naming/NamingEnumeration;Ljavax/naming/NamingException;)V

    .line 236
    :cond_1
    invoke-interface {p1}, Ljavax/naming/NamingEnumeration;->close()V
    :try_end_4
    .catch Ljavax/naming/NamingException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    :catch_2
    move-exception p1

    .line 238
    invoke-static {v2, p1}, Lio/grpc/internal/JndiResourceResolverFactory$JndiRecordFetcher;->closeThenThrow(Ljavax/naming/directory/DirContext;Ljavax/naming/NamingException;)V

    .line 240
    :goto_2
    invoke-interface {v2}, Ljavax/naming/directory/DirContext;->close()V

    return-object v0
.end method
