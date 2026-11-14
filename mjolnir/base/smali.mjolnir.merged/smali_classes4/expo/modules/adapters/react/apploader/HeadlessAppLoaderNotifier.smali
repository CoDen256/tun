.class public final Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;
.super Ljava/lang/Object;
.source "HeadlessAppLoaderNotifier.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nHeadlessAppLoaderNotifier.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HeadlessAppLoaderNotifier.kt\nexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,32:1\n1855#2,2:33\n1855#2,2:35\n*S KotlinDebug\n*F\n+ 1 HeadlessAppLoaderNotifier.kt\nexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier\n*L\n22#1:33,2\n28#1:35,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010#\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\t\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cJ\u0010\u0010\r\u001a\u00020\n2\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000cJ\u000e\u0010\u000e\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\u0006R\u001d\u0010\u0003\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00060\u00050\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\u0010"
    }
    d2 = {
        "Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;",
        "",
        "()V",
        "listeners",
        "",
        "Ljava/lang/ref/WeakReference;",
        "Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;",
        "getListeners",
        "()Ljava/util/Set;",
        "notifyAppDestroyed",
        "",
        "appScopeKey",
        "",
        "notifyAppLoaded",
        "registerListener",
        "listener",
        "expo-modules-core_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;

.field private static final listeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;

    invoke-direct {v0}, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;-><init>()V

    sput-object v0, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->INSTANCE:Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;

    .line 14
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    sput-object v0, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->listeners:Ljava/util/Set;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getListeners()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/ref/WeakReference<",
            "Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;",
            ">;>;"
        }
    .end annotation

    sget-object v0, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->listeners:Ljava/util/Set;

    return-object v0
.end method

.method public final notifyAppDestroyed(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_1

    sget-object v0, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->listeners:Ljava/util/Set;

    .line 28
    check-cast v0, Ljava/lang/Iterable;

    .line 35
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 28
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;

    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;->appDestroyed(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final notifyAppLoaded(Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_1

    sget-object v0, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->listeners:Ljava/util/Set;

    .line 22
    check-cast v0, Ljava/lang/Iterable;

    .line 33
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 22
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;

    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;->appLoaded(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public final registerListener(Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderListener;)V
    .locals 2

    const-string v0, "listener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Lexpo/modules/adapters/react/apploader/HeadlessAppLoaderNotifier;->listeners:Ljava/util/Set;

    .line 17
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method
