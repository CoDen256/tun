.class public interface abstract Lexpo/modules/core/Promise;
.super Ljava/lang/Object;
.source "Promise.java"


# annotations
.annotation runtime Lkotlin/Deprecated;
    message = "AsyncFunction will crash when called. Use expo.modules.kotlin.Promise instead"
.end annotation


# static fields
.field public static final UNKNOWN_ERROR:Ljava/lang/String; = "E_UNKNOWN_ERROR"


# virtual methods
.method public abstract reject(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract reject(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public abstract reject(Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public abstract reject(Ljava/lang/Throwable;)V
.end method

.method public abstract resolve(Ljava/lang/Object;)V
.end method
