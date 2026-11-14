.class public Lapp/notifee/core/NotifeeConfig$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/notifee/core/NotifeeConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lapp/notifee/core/interfaces/EventListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lapp/notifee/core/NotifeeConfig;
    .locals 4

    .line 1
    new-instance v0, Lapp/notifee/core/NotifeeConfig;

    iget-object v1, p0, Lapp/notifee/core/NotifeeConfig$Builder;->a:Ljava/lang/String;

    iget-object v2, p0, Lapp/notifee/core/NotifeeConfig$Builder;->b:Ljava/lang/String;

    iget-object v3, p0, Lapp/notifee/core/NotifeeConfig$Builder;->c:Lapp/notifee/core/interfaces/EventListener;

    .line 2
    invoke-direct {v0, v1, v2, v3}, Lapp/notifee/core/NotifeeConfig;-><init>(Ljava/lang/String;Ljava/lang/String;Lapp/notifee/core/interfaces/EventListener;)V

    return-object v0
.end method

.method public setEventSubscriber(Lapp/notifee/core/interfaces/EventListener;)V
    .locals 0

    iput-object p1, p0, Lapp/notifee/core/NotifeeConfig$Builder;->c:Lapp/notifee/core/interfaces/EventListener;

    return-void
.end method

.method public setFrameworkVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lapp/notifee/core/NotifeeConfig$Builder;->b:Ljava/lang/String;

    return-void
.end method

.method public setProductVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lapp/notifee/core/NotifeeConfig$Builder;->a:Ljava/lang/String;

    return-void
.end method
