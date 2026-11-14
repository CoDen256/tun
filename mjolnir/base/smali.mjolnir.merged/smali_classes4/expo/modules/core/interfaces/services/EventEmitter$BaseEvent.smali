.class public abstract Lexpo/modules/core/interfaces/services/EventEmitter$BaseEvent;
.super Ljava/lang/Object;
.source "EventEmitter.java"

# interfaces
.implements Lexpo/modules/core/interfaces/services/EventEmitter$Event;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/core/interfaces/services/EventEmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseEvent"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canCoalesce()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getCoalescingKey()S
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
