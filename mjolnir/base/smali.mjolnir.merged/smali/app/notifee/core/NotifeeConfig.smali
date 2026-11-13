.class public Lapp/notifee/core/NotifeeConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/notifee/core/NotifeeConfig$Builder;
    }
.end annotation


# instance fields
.field public a:Lapp/notifee/core/interfaces/EventListener;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lapp/notifee/core/interfaces/EventListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lapp/notifee/core/NotifeeConfig;->a:Lapp/notifee/core/interfaces/EventListener;

    return-void
.end method
