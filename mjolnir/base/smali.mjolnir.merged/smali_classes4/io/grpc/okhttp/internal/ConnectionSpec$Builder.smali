.class public final Lio/grpc/okhttp/internal/ConnectionSpec$Builder;
.super Ljava/lang/Object;
.source "ConnectionSpec.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/grpc/okhttp/internal/ConnectionSpec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private cipherSuites:[Ljava/lang/String;

.field private supportsTlsExtensions:Z

.field private tls:Z

.field private tlsVersions:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Lio/grpc/okhttp/internal/ConnectionSpec;)V
    .locals 1

    .line 287
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 288
    iget-boolean v0, p1, Lio/grpc/okhttp/internal/ConnectionSpec;->tls:Z

    iput-boolean v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    .line 289
    invoke-static {p1}, Lio/grpc/okhttp/internal/ConnectionSpec;->access$400(Lio/grpc/okhttp/internal/ConnectionSpec;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    .line 290
    invoke-static {p1}, Lio/grpc/okhttp/internal/ConnectionSpec;->access$500(Lio/grpc/okhttp/internal/ConnectionSpec;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    .line 291
    iget-boolean p1, p1, Lio/grpc/okhttp/internal/ConnectionSpec;->supportsTlsExtensions:Z

    iput-boolean p1, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 283
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    return-void
.end method

.method static synthetic access$000(Lio/grpc/okhttp/internal/ConnectionSpec$Builder;)Z
    .locals 0

    .line 277
    iget-boolean p0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    return p0
.end method

.method static synthetic access$100(Lio/grpc/okhttp/internal/ConnectionSpec$Builder;)[Ljava/lang/String;
    .locals 0

    .line 277
    iget-object p0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lio/grpc/okhttp/internal/ConnectionSpec$Builder;)[Ljava/lang/String;
    .locals 0

    .line 277
    iget-object p0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lio/grpc/okhttp/internal/ConnectionSpec$Builder;)Z
    .locals 0

    .line 277
    iget-boolean p0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return p0
.end method


# virtual methods
.method public build()Lio/grpc/okhttp/internal/ConnectionSpec;
    .locals 2

    .line 354
    new-instance v0, Lio/grpc/okhttp/internal/ConnectionSpec;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lio/grpc/okhttp/internal/ConnectionSpec;-><init>(Lio/grpc/okhttp/internal/ConnectionSpec$Builder;Lio/grpc/okhttp/internal/ConnectionSpec$1;)V

    return-object v0
.end method

.method public varargs cipherSuites([Lio/grpc/okhttp/internal/CipherSuite;)Lio/grpc/okhttp/internal/ConnectionSpec$Builder;
    .locals 3

    iget-boolean v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_1

    .line 298
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 299
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 300
    aget-object v2, p1, v1

    iget-object v2, v2, Lio/grpc/okhttp/internal/CipherSuite;->javaName:Ljava/lang/String;

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iput-object v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    return-object p0

    .line 295
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "no cipher suites for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs cipherSuites([Ljava/lang/String;)Lio/grpc/okhttp/internal/ConnectionSpec$Builder;
    .locals 1

    iget-boolean v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    goto :goto_0

    .line 313
    :cond_0
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->cipherSuites:[Ljava/lang/String;

    :goto_0
    return-object p0

    .line 307
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "no cipher suites for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public supportsTlsExtensions(Z)Lio/grpc/okhttp/internal/ConnectionSpec$Builder;
    .locals 1

    iget-boolean v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_0

    iput-boolean p1, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->supportsTlsExtensions:Z

    return-object p0

    .line 348
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "no TLS extensions for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs tlsVersions([Lio/grpc/okhttp/internal/TlsVersion;)Lio/grpc/okhttp/internal/ConnectionSpec$Builder;
    .locals 3

    iget-boolean v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_2

    .line 321
    array-length v0, p1

    if-eqz v0, :cond_1

    .line 326
    array-length v0, p1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 327
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    .line 328
    aget-object v2, p1, v1

    iget-object v2, v2, Lio/grpc/okhttp/internal/TlsVersion;->javaName:Ljava/lang/String;

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iput-object v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    return-object p0

    .line 322
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "At least one TlsVersion is required"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 320
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "no TLS versions for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public varargs tlsVersions([Ljava/lang/String;)Lio/grpc/okhttp/internal/ConnectionSpec$Builder;
    .locals 1

    iget-boolean v0, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tls:Z

    if-eqz v0, :cond_1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    goto :goto_0

    .line 341
    :cond_0
    invoke-virtual {p1}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    iput-object p1, p0, Lio/grpc/okhttp/internal/ConnectionSpec$Builder;->tlsVersions:[Ljava/lang/String;

    :goto_0
    return-object p0

    .line 335
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "no TLS versions for cleartext connections"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
