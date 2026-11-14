.class public final Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests;
.super Ljava/lang/Object;
.source "ReactNativeFeatureFlagsForTests.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0003\u001a\u00020\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests;",
        "",
        "()V",
        "setUp",
        "",
        "ReactAndroid_release"
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
.field public static final INSTANCE:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests;

    invoke-direct {v0}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests;-><init>()V

    sput-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests;->INSTANCE:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final setUp()V
    .locals 2

    .line 12
    sget-object v0, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->INSTANCE:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;

    sget-object v1, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests$setUp$1;->INSTANCE:Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlagsForTests$setUp$1;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0, v1}, Lcom/facebook/react/internal/featureflags/ReactNativeFeatureFlags;->setAccessorProvider$ReactAndroid_release(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method
