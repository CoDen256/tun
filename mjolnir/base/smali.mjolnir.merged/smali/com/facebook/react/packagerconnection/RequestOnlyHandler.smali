.class public abstract Lcom/facebook/react/packagerconnection/RequestOnlyHandler;
.super Ljava/lang/Object;
.source "RequestOnlyHandler.java"

# interfaces
.implements Lcom/facebook/react/packagerconnection/RequestHandler;


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 16
    const-class v0, Lcom/facebook/react/packagerconnection/JSPackagerClient;

    const-string v0, "JSPackagerClient"

    sput-object v0, Lcom/facebook/react/packagerconnection/RequestOnlyHandler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onNotification(Ljava/lang/Object;)V
    .locals 1

    sget-object p1, Lcom/facebook/react/packagerconnection/RequestOnlyHandler;->TAG:Ljava/lang/String;

    const-string v0, "Notification is not supported"

    .line 21
    invoke-static {p1, v0}, Lcom/facebook/common/logging/FLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public abstract onRequest(Ljava/lang/Object;Lcom/facebook/react/packagerconnection/Responder;)V
.end method
