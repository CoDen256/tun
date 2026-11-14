.class public Lcom/facebook/react/devsupport/InspectorFlags;
.super Ljava/lang/Object;
.source "InspectorFlags.java"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 18
    invoke-static {}, Lcom/facebook/react/devsupport/DevSupportSoLoader;->staticInit()V

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static native getEnableCxxInspectorPackagerConnection()Z
.end method

.method public static native getEnableModernCDPRegistry()Z
.end method
