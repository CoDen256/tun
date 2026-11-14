.class final Lcom/amazon/a/a/o/c/a/g;
.super Ljava/lang/Object;
.source "WildcardClassNameMatcher.java"

# interfaces
.implements Lcom/amazon/a/a/o/c/a/a;


# instance fields
.field private final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/amazon/a/a/o/c/a/g;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/amazon/a/a/o/c/a/g;->a:Ljava/lang/String;

    .line 47
    invoke-static {p1, v0}, Lcom/amazon/a/a/o/c/a/b;->h(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
