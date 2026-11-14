.class public Lexpo/modules/adapters/react/permissions/PermissionsService;
.super Ljava/lang/Object;
.source "PermissionsService.kt"

# interfaces
.implements Lexpo/modules/core/interfaces/InternalModule;
.implements Lexpo/modules/interfaces/permissions/Permissions;
.implements Lexpo/modules/core/interfaces/LifecycleEventListener;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nPermissionsService.kt\nKotlin\n*S Kotlin\n*F\n+ 1 PermissionsService.kt\nexpo/modules/adapters/react/permissions/PermissionsService\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 ArraysJVM.kt\nkotlin/collections/ArraysKt__ArraysJVMKt\n+ 5 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 6 _Maps.kt\nkotlin/collections/MapsKt___MapsKt\n*L\n1#1,348:1\n13309#2,2:349\n11065#2:351\n11400#2,3:352\n12271#2,2:358\n1#3:355\n37#4,2:356\n1855#5,2:360\n1855#5,2:371\n167#6,3:362\n167#6,3:365\n167#6,3:368\n*S KotlinDebug\n*F\n+ 1 PermissionsService.kt\nexpo/modules/adapters/react/permissions/PermissionsService\n*L\n48#1:349,2\n103#1:351\n103#1:352,3\n157#1:358,2\n122#1:356,2\n215#1:360,2\n278#1:371,2\n66#1:362,3\n67#1:365,3\n68#1:368,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0098\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010$\n\u0002\u0008\u0002\n\u0002\u0010\u0015\n\u0002\u0008\u0002\u0008\u0016\u0018\u00002\u00020\u00012\u00020\u00022\u00020\u0003B\r\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u001d\u0010\u0019\u001a\u00020\u001a2\u000e\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000eH\u0002\u00a2\u0006\u0002\u0010\u001cJ%\u0010\u001d\u001a\u00020\u001a2\u000e\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e2\u0006\u0010\u001e\u001a\u00020\u000cH\u0014\u00a2\u0006\u0002\u0010\u001fJ)\u0010 \u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u000c2\u0012\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e\"\u00020\u000fH\u0016\u00a2\u0006\u0002\u0010\"J)\u0010#\u001a\u00020\u001a2\u0006\u0010$\u001a\u00020%2\u0012\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e\"\u00020\u000fH\u0016\u00a2\u0006\u0002\u0010&J\u0008\u0010\'\u001a\u00020\u001aH\u0002J\u0010\u0010(\u001a\u00020\u00182\u0006\u0010)\u001a\u00020\u000fH\u0002J\u0008\u0010*\u001a\u00020+H\u0002J%\u0010,\u001a\u00020\u001a2\u000e\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e2\u0006\u0010\u001e\u001a\u00020\u000cH\u0004\u00a2\u0006\u0002\u0010\u001fJ\u0010\u0010-\u001a\u00020\u00182\u0006\u0010)\u001a\u00020\u000fH\u0002J\u0016\u0010.\u001a\u0010\u0012\u000c\u0012\n\u0012\u0006\u0008\u0001\u0012\u000201000/H\u0016J\u0010\u00102\u001a\u0002032\u0006\u0010)\u001a\u00020\u000fH\u0002J\u0010\u00104\u001a\u0002032\u0006\u0010)\u001a\u00020\u000fH\u0014J\u0018\u00105\u001a\u0002062\u0006\u0010)\u001a\u00020\u000f2\u0006\u00107\u001a\u000203H\u0002J)\u00108\u001a\u00020\u001a2\u0006\u0010!\u001a\u00020\u000c2\u0012\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e\"\u00020\u000fH\u0016\u00a2\u0006\u0002\u0010\"J)\u00109\u001a\u00020\u001a2\u0006\u0010$\u001a\u00020%2\u0012\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e\"\u00020\u000fH\u0016\u00a2\u0006\u0002\u0010&J!\u0010:\u001a\u00020\u00182\u0012\u0010\u001b\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e\"\u00020\u000fH\u0016\u00a2\u0006\u0002\u0010;J\u0008\u0010<\u001a\u00020\u0018H\u0002J\u0010\u0010=\u001a\u00020\u00182\u0006\u0010)\u001a\u00020\u000fH\u0002J\u0010\u0010>\u001a\u00020\u00182\u0006\u0010)\u001a\u00020\u000fH\u0016J\u0010\u0010?\u001a\u00020\u001a2\u0006\u0010@\u001a\u00020AH\u0016J\u0008\u0010B\u001a\u00020\u001aH\u0016J\u0008\u0010C\u001a\u00020\u001aH\u0016J\u0008\u0010D\u001a\u00020\u001aH\u0016J1\u0010E\u001a\u000e\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u0002060F2\u000e\u0010G\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e2\u0006\u0010H\u001a\u00020IH\u0002\u00a2\u0006\u0002\u0010JR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001a\u0010\r\u001a\u000c\u0012\u0006\u0008\u0001\u0012\u00020\u000f\u0018\u00010\u000eX\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0010R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R(\u0010\u0014\u001a\u001c\u0012\u0018\u0012\u0016\u0012\u000c\u0012\n\u0012\u0006\u0008\u0001\u0012\u00020\u000f0\u000e\u0012\u0004\u0012\u00020\u000c0\u00160\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\u0018X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006K"
    }
    d2 = {
        "Lexpo/modules/adapters/react/permissions/PermissionsService;",
        "Lexpo/modules/core/interfaces/InternalModule;",
        "Lexpo/modules/interfaces/permissions/Permissions;",
        "Lexpo/modules/core/interfaces/LifecycleEventListener;",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "getContext",
        "()Landroid/content/Context;",
        "mActivityProvider",
        "Lexpo/modules/core/interfaces/ActivityProvider;",
        "mAskAsyncListener",
        "Lexpo/modules/interfaces/permissions/PermissionsResponseListener;",
        "mAskAsyncRequestedPermissions",
        "",
        "",
        "[Ljava/lang/String;",
        "mAskedPermissionsCache",
        "Landroid/content/SharedPreferences;",
        "mCurrentPermissionListener",
        "mPendingPermissionCalls",
        "Ljava/util/Queue;",
        "Lkotlin/Pair;",
        "mWriteSettingsPermissionBeingAsked",
        "",
        "addToAskedPermissionsCache",
        "",
        "permissions",
        "([Ljava/lang/String;)V",
        "askForManifestPermissions",
        "listener",
        "([Ljava/lang/String;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V",
        "askForPermissions",
        "responseListener",
        "(Lexpo/modules/interfaces/permissions/PermissionsResponseListener;[Ljava/lang/String;)V",
        "askForPermissionsWithPromise",
        "promise",
        "Lexpo/modules/core/Promise;",
        "(Lexpo/modules/core/Promise;[Ljava/lang/String;)V",
        "askForWriteSettingsPermissionFirst",
        "canAskAgain",
        "permission",
        "createListenerWithPendingPermissionsRequest",
        "Lcom/facebook/react/modules/core/PermissionListener;",
        "delegateRequestToActivity",
        "didAsk",
        "getExportedInterfaces",
        "",
        "Ljava/lang/Class;",
        "",
        "getManifestPermission",
        "",
        "getManifestPermissionFromContext",
        "getPermissionResponseFromNativeResponse",
        "Lexpo/modules/interfaces/permissions/PermissionsResponse;",
        "result",
        "getPermissions",
        "getPermissionsWithPromise",
        "hasGrantedPermissions",
        "([Ljava/lang/String;)Z",
        "hasWriteSettingsPermission",
        "isPermissionGranted",
        "isPermissionPresentInManifest",
        "onCreate",
        "moduleRegistry",
        "Lexpo/modules/core/ModuleRegistry;",
        "onHostDestroy",
        "onHostPause",
        "onHostResume",
        "parseNativeResult",
        "",
        "permissionsString",
        "grantResults",
        "",
        "([Ljava/lang/String;[I)Ljava/util/Map;",
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


# instance fields
.field private final context:Landroid/content/Context;

.field private mActivityProvider:Lexpo/modules/core/interfaces/ActivityProvider;

.field private mAskAsyncListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

.field private mAskAsyncRequestedPermissions:[Ljava/lang/String;

.field private mAskedPermissionsCache:Landroid/content/SharedPreferences;

.field private mCurrentPermissionListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

.field private final mPendingPermissionCalls:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lkotlin/Pair<",
            "[",
            "Ljava/lang/String;",
            "Lexpo/modules/interfaces/permissions/PermissionsResponseListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private mWriteSettingsPermissionBeingAsked:Z


# direct methods
.method public static synthetic $r8$lambda$IQhPR7OGgCr6HTFV_1Oy0PK8tAI(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;Ljava/util/Map;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lexpo/modules/adapters/react/permissions/PermissionsService;->askForPermissions$lambda$10(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic $r8$lambda$JgmIaBeSUerJmGlrdefj1W7qaCY(Lexpo/modules/core/Promise;Ljava/util/Map;)V
    .locals 0

    invoke-static {p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->getPermissionsWithPromise$lambda$6(Lexpo/modules/core/Promise;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic $r8$lambda$Wujjae7pse6pPdGTMR2_DRf1MYI(Lexpo/modules/adapters/react/permissions/PermissionsService;I[Ljava/lang/String;[I)Z
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lexpo/modules/adapters/react/permissions/PermissionsService;->createListenerWithPendingPermissionsRequest$lambda$21(Lexpo/modules/adapters/react/permissions/PermissionsService;I[Ljava/lang/String;[I)Z

    move-result p0

    return p0
.end method

.method public static synthetic $r8$lambda$xF8CkFuPILm03rF_5vHowa7fdKc(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/core/Promise;[Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lexpo/modules/adapters/react/permissions/PermissionsService;->askForPermissionsWithPromise$lambda$7(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/core/Promise;[Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    .line 39
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    check-cast p1, Ljava/util/Queue;

    iput-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mPendingPermissionCalls:Ljava/util/Queue;

    return-void
.end method

.method private final addToAskedPermissionsCache([Ljava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskedPermissionsCache:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    const-string v0, "mAskedPermissionsCache"

    .line 47
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 349
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    const/4 v4, 0x1

    .line 48
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 49
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private static final askForPermissions$lambda$10(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;Ljava/util/Map;)V
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$responseListener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 124
    invoke-direct {p0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->hasWriteSettingsPermission()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    .line 130
    :goto_0
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const-string v1, "android.permission.WRITE_SETTINGS"

    invoke-direct {p0, v1, v0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->getPermissionResponseFromNativeResponse(Ljava/lang/String;I)Lexpo/modules/interfaces/permissions/PermissionsResponse;

    move-result-object p0

    invoke-interface {p2, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    invoke-interface {p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    return-void
.end method

.method private static final askForPermissionsWithPromise$lambda$7(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/core/Promise;[Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    const-string p3, "this$0"

    invoke-static {p0, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p3, "$promise"

    invoke-static {p1, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p3, "$permissions"

    invoke-static {p2, p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    array-length p3, p2

    invoke-static {p2, p3}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lexpo/modules/adapters/react/permissions/PermissionsService;->getPermissionsWithPromise(Lexpo/modules/core/Promise;[Ljava/lang/String;)V

    return-void
.end method

.method private final askForWriteSettingsPermissionFirst()V
    .locals 4

    .line 309
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.action.MANAGE_WRITE_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    .line 310
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "package:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/high16 v1, 0x10000000

    .line 311
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mWriteSettingsPermissionBeingAsked:Z

    iget-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    .line 314
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private final canAskAgain(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mActivityProvider:Lexpo/modules/core/interfaces/ActivityProvider;

    if-eqz v0, :cond_0

    .line 208
    invoke-interface {v0}, Lexpo/modules/core/interfaces/ActivityProvider;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 209
    invoke-static {v0, p1}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private final createListenerWithPendingPermissionsRequest()Lcom/facebook/react/modules/core/PermissionListener;
    .locals 1

    .line 266
    new-instance v0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda0;-><init>(Lexpo/modules/adapters/react/permissions/PermissionsService;)V

    return-object v0
.end method

.method private static final createListenerWithPendingPermissionsRequest$lambda$21(Lexpo/modules/adapters/react/permissions/PermissionsService;I[Ljava/lang/String;[I)Z
    .locals 5

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/16 v1, 0xd

    if-ne p1, v1, :cond_8

    .line 268
    monitor-enter p0

    .line 269
    :try_start_0
    iget-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mCurrentPermissionListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    if-eqz p1, :cond_7

    .line 270
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-static {p3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p0, p2, p3}, Lexpo/modules/adapters/react/permissions/PermissionsService;->parseNativeResult([Ljava/lang/String;[I)Ljava/util/Map;

    move-result-object p2

    invoke-interface {p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    const/4 p1, 0x0

    .line 271
    iput-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mCurrentPermissionListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    .line 273
    iget-object p2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mPendingPermissionCalls:Ljava/util/Queue;

    invoke-interface {p2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlin/Pair;

    if-eqz p2, :cond_6

    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 274
    iget-object p3, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mActivityProvider:Lexpo/modules/core/interfaces/ActivityProvider;

    if-eqz p3, :cond_0

    invoke-interface {p3}, Lexpo/modules/core/interfaces/ActivityProvider;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p3

    goto :goto_0

    :cond_0
    move-object p3, p1

    :goto_0
    instance-of v2, p3, Lcom/facebook/react/modules/core/PermissionAwareActivity;

    if-eqz v2, :cond_1

    move-object p1, p3

    check-cast p1, Lcom/facebook/react/modules/core/PermissionAwareActivity;

    :cond_1
    if-nez p1, :cond_5

    .line 277
    invoke-virtual {p2}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    invoke-virtual {p2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/lang/String;

    invoke-virtual {p2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/Object;

    array-length p2, p2

    new-array v1, p2, [I

    move v2, v0

    :goto_1
    const/4 v3, -0x1

    if-ge v2, p2, :cond_2

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    invoke-direct {p0, p3, v1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->parseNativeResult([Ljava/lang/String;[I)Ljava/util/Map;

    move-result-object p2

    invoke-interface {p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    .line 278
    iget-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mPendingPermissionCalls:Ljava/util/Queue;

    check-cast p1, Ljava/lang/Iterable;

    .line 371
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlin/Pair;

    .line 279
    invoke-virtual {p2}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    invoke-virtual {p2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-virtual {p2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/Object;

    array-length p2, p2

    new-array v2, p2, [I

    move v4, v0

    :goto_3
    if-ge v4, p2, :cond_3

    aput v3, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_3
    invoke-direct {p0, v1, v2}, Lexpo/modules/adapters/react/permissions/PermissionsService;->parseNativeResult([Ljava/lang/String;[I)Ljava/util/Map;

    move-result-object p2

    invoke-interface {p3, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    goto :goto_2

    .line 281
    :cond_4
    iget-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mPendingPermissionCalls:Ljava/util/Queue;

    invoke-interface {p1}, Ljava/util/Queue;->clear()V

    goto :goto_4

    .line 285
    :cond_5
    invoke-virtual {p2}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    iput-object p3, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mCurrentPermissionListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    .line 286
    invoke-virtual {p2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Ljava/lang/String;

    invoke-direct {p0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->createListenerWithPendingPermissionsRequest()Lcom/facebook/react/modules/core/PermissionListener;

    move-result-object p3

    invoke-interface {p1, p2, v1, p3}, Lcom/facebook/react/modules/core/PermissionAwareActivity;->requestPermissions([Ljava/lang/String;ILcom/facebook/react/modules/core/PermissionListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 287
    monitor-exit p0

    return v0

    .line 290
    :cond_6
    :goto_4
    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :cond_7
    :try_start_1
    const-string p1, "Required value was null."

    .line 269
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 290
    monitor-exit p0

    throw p1

    :cond_8
    return v0
.end method

.method private final didAsk(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskedPermissionsCache:Landroid/content/SharedPreferences;

    if-nez v0, :cond_0

    const-string v0, "mAskedPermissionsCache"

    .line 44
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->throwUninitializedPropertyAccessException(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method private final getManifestPermission(Ljava/lang/String;)I
    .locals 2

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mActivityProvider:Lexpo/modules/core/interfaces/ActivityProvider;

    if-eqz v0, :cond_0

    .line 193
    invoke-interface {v0}, Lexpo/modules/core/interfaces/ActivityProvider;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 194
    instance-of v1, v0, Lcom/facebook/react/modules/core/PermissionAwareActivity;

    if-eqz v1, :cond_0

    .line 195
    check-cast v0, Landroid/content/Context;

    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    return p1

    .line 200
    :cond_0
    invoke-virtual {p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->getManifestPermissionFromContext(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method private final getPermissionResponseFromNativeResponse(Ljava/lang/String;I)Lexpo/modules/interfaces/permissions/PermissionsResponse;
    .locals 2

    if-nez p2, :cond_0

    .line 223
    sget-object p2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->GRANTED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    goto :goto_0

    .line 224
    :cond_0
    invoke-direct {p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->didAsk(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    sget-object p2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->DENIED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    goto :goto_0

    .line 225
    :cond_1
    sget-object p2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->UNDETERMINED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    .line 227
    :goto_0
    new-instance v0, Lexpo/modules/interfaces/permissions/PermissionsResponse;

    .line 229
    sget-object v1, Lexpo/modules/interfaces/permissions/PermissionsStatus;->DENIED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    if-ne p2, v1, :cond_2

    .line 230
    invoke-direct {p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->canAskAgain(Ljava/lang/String;)Z

    move-result p1

    goto :goto_1

    :cond_2
    const/4 p1, 0x1

    .line 227
    :goto_1
    invoke-direct {v0, p2, p1}, Lexpo/modules/interfaces/permissions/PermissionsResponse;-><init>(Lexpo/modules/interfaces/permissions/PermissionsStatus;Z)V

    return-object v0
.end method

.method private static final getPermissionsWithPromise$lambda$6(Lexpo/modules/core/Promise;Ljava/util/Map;)V
    .locals 6

    const-string v0, "$promise"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "permissionsMap"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 362
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    :cond_0
    move v0, v2

    goto :goto_1

    .line 363
    :cond_1
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 66
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lexpo/modules/interfaces/permissions/PermissionsResponse;

    invoke-virtual {v3}, Lexpo/modules/interfaces/permissions/PermissionsResponse;->getStatus()Lexpo/modules/interfaces/permissions/PermissionsStatus;

    move-result-object v3

    sget-object v4, Lexpo/modules/interfaces/permissions/PermissionsStatus;->GRANTED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    if-ne v3, v4, :cond_2

    goto :goto_0

    :cond_2
    move v0, v1

    .line 67
    :goto_1
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    xor-int/2addr v3, v2

    if-eqz v3, :cond_5

    .line 365
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_3

    .line 366
    :cond_3
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 67
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lexpo/modules/interfaces/permissions/PermissionsResponse;

    invoke-virtual {v4}, Lexpo/modules/interfaces/permissions/PermissionsResponse;->getStatus()Lexpo/modules/interfaces/permissions/PermissionsStatus;

    move-result-object v4

    sget-object v5, Lexpo/modules/interfaces/permissions/PermissionsStatus;->DENIED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    if-ne v4, v5, :cond_5

    goto :goto_2

    :cond_4
    :goto_3
    move v3, v2

    goto :goto_4

    :cond_5
    move v3, v1

    .line 368
    :goto_4
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_7

    :cond_6
    move v1, v2

    goto :goto_5

    .line 369
    :cond_7
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_8
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 68
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lexpo/modules/interfaces/permissions/PermissionsResponse;

    invoke-virtual {v4}, Lexpo/modules/interfaces/permissions/PermissionsResponse;->getCanAskAgain()Z

    move-result v4

    if-nez v4, :cond_8

    .line 71
    :goto_5
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "expires"

    const-string v4, "never"

    .line 72
    invoke-virtual {p1, v2, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_9

    .line 76
    sget-object v2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->GRANTED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    invoke-virtual {v2}, Lexpo/modules/interfaces/permissions/PermissionsStatus;->getStatus()Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    :cond_9
    if-eqz v3, :cond_a

    .line 77
    sget-object v2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->DENIED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    invoke-virtual {v2}, Lexpo/modules/interfaces/permissions/PermissionsStatus;->getStatus()Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    .line 78
    :cond_a
    sget-object v2, Lexpo/modules/interfaces/permissions/PermissionsStatus;->UNDETERMINED:Lexpo/modules/interfaces/permissions/PermissionsStatus;

    invoke-virtual {v2}, Lexpo/modules/interfaces/permissions/PermissionsStatus;->getStatus()Ljava/lang/String;

    move-result-object v2

    :goto_6
    const-string v3, "status"

    .line 73
    invoke-virtual {p1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "canAskAgain"

    .line 81
    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "granted"

    .line 82
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 70
    invoke-interface {p0, p1}, Lexpo/modules/core/Promise;->resolve(Ljava/lang/Object;)V

    return-void
.end method

.method private final hasWriteSettingsPermission()Z
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    .line 319
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/provider/Settings$System;->canWrite(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method

.method private final isPermissionGranted(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "android.permission.WRITE_SETTINGS"

    .line 182
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->hasWriteSettingsPermission()Z

    move-result p1

    goto :goto_0

    .line 183
    :cond_0
    invoke-direct {p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->getManifestPermission(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private final parseNativeResult([Ljava/lang/String;[I)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lexpo/modules/interfaces/permissions/PermissionsResponse;",
            ">;"
        }
    .end annotation

    .line 214
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 215
    invoke-static {p2, p1}, Lkotlin/collections/ArraysKt;->zip([I[Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    .line 360
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lkotlin/Pair;

    .line 215
    invoke-virtual {p2}, Lkotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {p2}, Lkotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    .line 216
    move-object v2, v0

    check-cast v2, Ljava/util/Map;

    invoke-direct {p0, p2, v1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->getPermissionResponseFromNativeResponse(Ljava/lang/String;I)Lexpo/modules/interfaces/permissions/PermissionsResponse;

    move-result-object v1

    invoke-interface {v2, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 214
    :cond_0
    check-cast v0, Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method protected askForManifestPermissions([Ljava/lang/String;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V
    .locals 1

    const-string v0, "permissions"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 238
    invoke-virtual {p0, p1, p2}, Lexpo/modules/adapters/react/permissions/PermissionsService;->delegateRequestToActivity([Ljava/lang/String;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V

    return-void
.end method

.method public varargs askForPermissions(Lexpo/modules/interfaces/permissions/PermissionsResponseListener;[Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    const-string v0, "responseListener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    array-length v0, p2

    if-nez v0, :cond_0

    .line 117
    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p2, Ljava/util/Map;

    invoke-interface {p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    return-void

    :cond_0
    const-string v0, "android.permission.WRITE_SETTINGS"

    .line 121
    invoke-static {p2, v0}, Lkotlin/collections/ArraysKt;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 122
    invoke-static {p2}, Lkotlin/collections/ArraysKt;->toMutableList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    check-cast p2, Ljava/util/Collection;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    .line 357
    invoke-interface {p2, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p2

    .line 122
    check-cast p2, [Ljava/lang/String;

    .line 123
    new-instance v1, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda3;-><init>(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V

    .line 134
    invoke-direct {p0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->hasWriteSettingsPermission()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskAsyncListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    if-nez p1, :cond_1

    iput-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskAsyncListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    iput-object p2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskAsyncRequestedPermissions:[Ljava/lang/String;

    .line 141
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->addToAskedPermissionsCache([Ljava/lang/String;)V

    .line 142
    invoke-direct {p0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->askForWriteSettingsPermissionFirst()V

    goto :goto_0

    .line 136
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Another permissions request is in progress. Await the old request and then try again."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 145
    :cond_2
    array-length p1, p2

    if-nez p1, :cond_3

    .line 146
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast p1, Ljava/util/Map;

    invoke-interface {v1, p1}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    return-void

    .line 149
    :cond_3
    invoke-virtual {p0, p2, v1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->askForManifestPermissions([Ljava/lang/String;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V

    goto :goto_0

    .line 152
    :cond_4
    invoke-virtual {p0, p2, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->askForManifestPermissions([Ljava/lang/String;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V

    :goto_0
    return-void
.end method

.method public varargs askForPermissionsWithPromise(Lexpo/modules/core/Promise;[Ljava/lang/String;)V
    .locals 1

    const-string v0, "promise"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 91
    new-instance v0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;

    invoke-direct {v0, p0, p1, p2}, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda1;-><init>(Lexpo/modules/adapters/react/permissions/PermissionsService;Lexpo/modules/core/Promise;[Ljava/lang/String;)V

    .line 95
    array-length p1, p2

    invoke-static {p2, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    .line 91
    invoke-virtual {p0, v0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->askForPermissions(Lexpo/modules/interfaces/permissions/PermissionsResponseListener;[Ljava/lang/String;)V

    return-void
.end method

.method protected final delegateRequestToActivity([Ljava/lang/String;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V
    .locals 4

    const-string v0, "permissions"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "listener"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 248
    invoke-direct {p0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->addToAskedPermissionsCache([Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mActivityProvider:Lexpo/modules/core/interfaces/ActivityProvider;

    if-eqz v0, :cond_0

    .line 250
    invoke-interface {v0}, Lexpo/modules/core/interfaces/ActivityProvider;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 251
    :goto_0
    instance-of v1, v0, Lcom/facebook/react/modules/core/PermissionAwareActivity;

    if-eqz v1, :cond_2

    .line 252
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mCurrentPermissionListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mPendingPermissionCalls:Ljava/util/Queue;

    .line 254
    invoke-static {p1, p2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    goto :goto_1

    :cond_1
    iput-object p2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mCurrentPermissionListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    .line 257
    check-cast v0, Lcom/facebook/react/modules/core/PermissionAwareActivity;

    invoke-direct {p0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->createListenerWithPendingPermissionsRequest()Lcom/facebook/react/modules/core/PermissionListener;

    move-result-object p2

    const/16 v1, 0xd

    invoke-interface {v0, p1, v1, p2}, Lcom/facebook/react/modules/core/PermissionAwareActivity;->requestPermissions([Ljava/lang/String;ILcom/facebook/react/modules/core/PermissionListener;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    :goto_1
    monitor-exit p0

    goto :goto_3

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 261
    :cond_2
    array-length v0, p1

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v0, :cond_3

    const/4 v3, -0x1

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    invoke-direct {p0, p1, v1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->parseNativeResult([Ljava/lang/String;[I)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p2, p1}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    :goto_3
    return-void
.end method

.method public final getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    return-object v0
.end method

.method public getExportedInterfaces()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "+",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    const-class v0, Lexpo/modules/interfaces/permissions/Permissions;

    .line 53
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected getManifestPermissionFromContext(Ljava/lang/String;)I
    .locals 1

    const-string v0, "permission"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    .line 204
    invoke-static {v0, p1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public varargs getPermissions(Lexpo/modules/interfaces/permissions/PermissionsResponseListener;[Ljava/lang/String;)V
    .locals 5

    const-string v0, "responseListener"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 351
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v0, Ljava/util/Collection;

    .line 352
    array-length v1, p2

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, p2, v3

    .line 104
    invoke-direct {p0, v4}, Lexpo/modules/adapters/react/permissions/PermissionsService;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    move v4, v2

    goto :goto_1

    :cond_0
    const/4 v4, -0x1

    :goto_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 353
    invoke-interface {v0, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 354
    :cond_1
    check-cast v0, Ljava/util/List;

    .line 351
    check-cast v0, Ljava/util/Collection;

    .line 109
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v0

    .line 101
    invoke-direct {p0, p2, v0}, Lexpo/modules/adapters/react/permissions/PermissionsService;->parseNativeResult([Ljava/lang/String;[I)Ljava/util/Map;

    move-result-object p2

    .line 100
    invoke-interface {p1, p2}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    return-void
.end method

.method public varargs getPermissionsWithPromise(Lexpo/modules/core/Promise;[Ljava/lang/String;)V
    .locals 1

    const-string v0, "promise"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "permissions"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 64
    new-instance v0, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda2;

    invoke-direct {v0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService$$ExternalSyntheticLambda2;-><init>(Lexpo/modules/core/Promise;)V

    .line 86
    array-length p1, p2

    invoke-static {p2, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/String;

    .line 64
    invoke-virtual {p0, v0, p1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->getPermissions(Lexpo/modules/interfaces/permissions/PermissionsResponseListener;[Ljava/lang/String;)V

    return-void
.end method

.method public varargs hasGrantedPermissions([Ljava/lang/String;)Z
    .locals 4

    const-string v0, "permissions"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 358
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 157
    invoke-direct {p0, v3}, Lexpo/modules/adapters/react/permissions/PermissionsService;->isPermissionGranted(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :goto_1
    return v1
.end method

.method public isPermissionPresentInManifest(Ljava/lang/String;)Z
    .locals 4

    const-string v0, "permission"

    .line 165
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x1000

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 166
    iget-object v1, v1, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    const-string v2, "requestedPermissions"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, [Ljava/lang/Object;

    invoke-static {v1, p1}, Lkotlin/collections/ArraysKt;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    :cond_0
    return v0
.end method

.method public onCreate(Lexpo/modules/core/ModuleRegistry;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    const-string v0, "moduleRegistry"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    const-class v0, Lexpo/modules/core/interfaces/ActivityProvider;

    invoke-virtual {p1, v0}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lexpo/modules/core/interfaces/ActivityProvider;

    if-eqz v0, :cond_0

    iput-object v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mActivityProvider:Lexpo/modules/core/interfaces/ActivityProvider;

    .line 59
    const-class v0, Lexpo/modules/core/interfaces/services/UIManager;

    invoke-virtual {p1, v0}, Lexpo/modules/core/ModuleRegistry;->getModule(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lexpo/modules/core/interfaces/services/UIManager;

    move-object v0, p0

    check-cast v0, Lexpo/modules/core/interfaces/LifecycleEventListener;

    invoke-interface {p1, v0}, Lexpo/modules/core/interfaces/services/UIManager;->registerLifecycleEventListener(Lexpo/modules/core/interfaces/LifecycleEventListener;)V

    iget-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->context:Landroid/content/Context;

    .line 60
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "expo.modules.permissions.asked"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "getSharedPreferences(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskedPermissionsCache:Landroid/content/SharedPreferences;

    return-void

    .line 58
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Couldn\'t find implementation for ActivityProvider."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public synthetic onDestroy()V
    .locals 0

    invoke-static {p0}, Lexpo/modules/core/interfaces/RegistryLifecycleListener$-CC;->$default$onDestroy(Lexpo/modules/core/interfaces/RegistryLifecycleListener;)V

    return-void
.end method

.method public onHostDestroy()V
    .locals 0

    return-void
.end method

.method public onHostPause()V
    .locals 0

    return-void
.end method

.method public onHostResume()V
    .locals 5

    iget-boolean v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mWriteSettingsPermissionBeingAsked:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mWriteSettingsPermissionBeingAsked:Z

    iget-object v1, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskAsyncListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    .line 329
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    iget-object v2, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskAsyncRequestedPermissions:[Ljava/lang/String;

    .line 330
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v3, 0x0

    iput-object v3, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskAsyncListener:Lexpo/modules/interfaces/permissions/PermissionsResponseListener;

    iput-object v3, p0, Lexpo/modules/adapters/react/permissions/PermissionsService;->mAskAsyncRequestedPermissions:[Ljava/lang/String;

    .line 335
    array-length v3, v2

    const/4 v4, 0x1

    if-nez v3, :cond_1

    move v0, v4

    :cond_1
    xor-int/2addr v0, v4

    if-eqz v0, :cond_2

    .line 337
    invoke-virtual {p0, v2, v1}, Lexpo/modules/adapters/react/permissions/PermissionsService;->askForManifestPermissions([Ljava/lang/String;Lexpo/modules/interfaces/permissions/PermissionsResponseListener;)V

    goto :goto_0

    .line 340
    :cond_2
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    invoke-interface {v1, v0}, Lexpo/modules/interfaces/permissions/PermissionsResponseListener;->onResult(Ljava/util/Map;)V

    :goto_0
    return-void
.end method
