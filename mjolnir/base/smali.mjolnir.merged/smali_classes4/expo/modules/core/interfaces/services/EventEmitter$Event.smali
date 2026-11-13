.class public interface abstract Lexpo/modules/core/interfaces/services/EventEmitter$Event;
.super Ljava/lang/Object;
.source "EventEmitter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lexpo/modules/core/interfaces/services/EventEmitter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Event"
.end annotation


# virtual methods
.method public abstract canCoalesce()Z
.end method

.method public abstract getCoalescingKey()S
.end method

.method public abstract getEventBody()Landroid/os/Bundle;
.end method

.method public abstract getEventName()Ljava/lang/String;
.end method
