.class public Lcom/facebook/react/shell/MainReactPackage;
.super Lcom/facebook/react/TurboReactPackage;
.source "MainReactPackage.java"

# interfaces
.implements Lcom/facebook/react/ViewManagerOnDemandReactPackage;


# instance fields
.field private mConfig:Lcom/facebook/react/shell/MainPackageConfig;

.field private mViewManagers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/ModuleSpec;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Lcom/facebook/react/TurboReactPackage;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/react/shell/MainPackageConfig;)V
    .locals 0

    .line 103
    invoke-direct {p0}, Lcom/facebook/react/TurboReactPackage;-><init>()V

    iput-object p1, p0, Lcom/facebook/react/shell/MainReactPackage;->mConfig:Lcom/facebook/react/shell/MainPackageConfig;

    return-void
.end method

.method private static appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/ModuleSpec;",
            ">;",
            "Ljava/lang/String;",
            "Ljavax/inject/Provider<",
            "+",
            "Lcom/facebook/react/bridge/NativeModule;",
            ">;)V"
        }
    .end annotation

    .line 190
    invoke-static {p2}, Lcom/facebook/react/bridge/ModuleSpec;->viewManagerSpec(Ljavax/inject/Provider;)Lcom/facebook/react/bridge/ModuleSpec;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static synthetic lambda$getReactModuleInfoProvider$0(Ljava/util/Map;)Ljava/util/Map;
    .locals 0

    return-object p0
.end method


# virtual methods
.method public createViewManager(Lcom/facebook/react/bridge/ReactApplicationContext;Ljava/lang/String;)Lcom/facebook/react/uimanager/ViewManager;
    .locals 0

    .line 247
    invoke-virtual {p0}, Lcom/facebook/react/shell/MainReactPackage;->getViewManagersMap()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/bridge/ModuleSpec;

    if-eqz p1, :cond_0

    .line 248
    invoke-virtual {p1}, Lcom/facebook/react/bridge/ModuleSpec;->getProvider()Ljavax/inject/Provider;

    move-result-object p1

    invoke-interface {p1}, Ljavax/inject/Provider;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/facebook/react/uimanager/ViewManager;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public createViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/uimanager/ViewManager;",
            ">;"
        }
    .end annotation

    .line 163
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 165
    new-instance v0, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;

    invoke-direct {v0}, Lcom/facebook/react/views/drawer/ReactDrawerLayoutManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    new-instance v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    new-instance v0, Lcom/facebook/react/views/scroll/ReactHorizontalScrollContainerViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/scroll/ReactHorizontalScrollContainerViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    new-instance v0, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/progressbar/ReactProgressBarViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    new-instance v0, Lcom/facebook/react/views/scroll/ReactScrollViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/scroll/ReactScrollViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    new-instance v0, Lcom/facebook/react/views/switchview/ReactSwitchManager;

    invoke-direct {v0}, Lcom/facebook/react/views/switchview/ReactSwitchManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v0, Lcom/facebook/react/views/swiperefresh/SwipeRefreshLayoutManager;

    invoke-direct {v0}, Lcom/facebook/react/views/swiperefresh/SwipeRefreshLayoutManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 174
    new-instance v0, Lcom/facebook/react/views/text/frescosupport/FrescoBasedReactTextInlineImageViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/text/frescosupport/FrescoBasedReactTextInlineImageViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 175
    new-instance v0, Lcom/facebook/react/views/image/ReactImageManager;

    invoke-direct {v0}, Lcom/facebook/react/views/image/ReactImageManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    new-instance v0, Lcom/facebook/react/views/modal/ReactModalHostManager;

    invoke-direct {v0}, Lcom/facebook/react/views/modal/ReactModalHostManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    new-instance v0, Lcom/facebook/react/views/text/ReactRawTextManager;

    invoke-direct {v0}, Lcom/facebook/react/views/text/ReactRawTextManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    new-instance v0, Lcom/facebook/react/views/textinput/ReactTextInputManager;

    invoke-direct {v0}, Lcom/facebook/react/views/textinput/ReactTextInputManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    new-instance v0, Lcom/facebook/react/views/text/ReactTextViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/text/ReactTextViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    new-instance v0, Lcom/facebook/react/views/view/ReactViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/view/ReactViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 181
    new-instance v0, Lcom/facebook/react/views/text/ReactVirtualTextViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/text/ReactVirtualTextViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 183
    new-instance v0, Lcom/facebook/react/views/unimplementedview/ReactUnimplementedViewManager;

    invoke-direct {v0}, Lcom/facebook/react/views/unimplementedview/ReactUnimplementedViewManager;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public getModule(Ljava/lang/String;Lcom/facebook/react/bridge/ReactApplicationContext;)Lcom/facebook/react/bridge/NativeModule;
    .locals 3

    .line 109
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, -0x1

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v0, "Vibration"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v2, 0x16

    goto/16 :goto_0

    :sswitch_1
    const-string v0, "NativeAnimatedModule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto/16 :goto_0

    :cond_1
    const/16 v2, 0x15

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "ShareModule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto/16 :goto_0

    :cond_2
    const/16 v2, 0x14

    goto/16 :goto_0

    :sswitch_3
    const-string v0, "BlobModule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto/16 :goto_0

    :cond_3
    const/16 v2, 0x13

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "Networking"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto/16 :goto_0

    :cond_4
    const/16 v2, 0x12

    goto/16 :goto_0

    :sswitch_5
    const-string v0, "AppState"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto/16 :goto_0

    :cond_5
    const/16 v2, 0x11

    goto/16 :goto_0

    :sswitch_6
    const-string v0, "IntentAndroid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto/16 :goto_0

    :cond_6
    const/16 v2, 0x10

    goto/16 :goto_0

    :sswitch_7
    const-string v0, "DevToolsSettingsManager"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    goto/16 :goto_0

    :cond_7
    const/16 v2, 0xf

    goto/16 :goto_0

    :sswitch_8
    const-string v0, "Clipboard"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    goto/16 :goto_0

    :cond_8
    const/16 v2, 0xe

    goto/16 :goto_0

    :sswitch_9
    const-string v0, "FrescoModule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v2, 0xd

    goto/16 :goto_0

    :sswitch_a
    const-string v0, "DevLoadingView"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v2, 0xc

    goto/16 :goto_0

    :sswitch_b
    const-string v0, "WebSocketModule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v2, 0xb

    goto/16 :goto_0

    :sswitch_c
    const-string v0, "StatusBarManager"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v2, 0xa

    goto/16 :goto_0

    :sswitch_d
    const-string v0, "AccessibilityInfo"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v2, 0x9

    goto/16 :goto_0

    :sswitch_e
    const-string v0, "Appearance"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v2, 0x8

    goto/16 :goto_0

    :sswitch_f
    const-string v0, "I18nManager"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_f

    goto :goto_0

    :cond_f
    const/4 v2, 0x7

    goto :goto_0

    :sswitch_10
    const-string v0, "ImageLoader"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    goto :goto_0

    :cond_10
    const/4 v2, 0x6

    goto :goto_0

    :sswitch_11
    const-string v0, "PermissionsAndroid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    goto :goto_0

    :cond_11
    const/4 v2, 0x5

    goto :goto_0

    :sswitch_12
    const-string v0, "FileReaderModule"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_12

    goto :goto_0

    :cond_12
    const/4 v2, 0x4

    goto :goto_0

    :sswitch_13
    const-string v0, "DialogManagerAndroid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    goto :goto_0

    :cond_13
    const/4 v2, 0x3

    goto :goto_0

    :sswitch_14
    const-string v0, "SoundManager"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_14

    goto :goto_0

    :cond_14
    const/4 v2, 0x2

    goto :goto_0

    :sswitch_15
    const-string v0, "ImageStoreManager"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    goto :goto_0

    :cond_15
    move v2, v1

    goto :goto_0

    :sswitch_16
    const-string v0, "ToastAndroid"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_16

    goto :goto_0

    :cond_16
    const/4 v2, 0x0

    :goto_0
    const/4 p1, 0x0

    packed-switch v2, :pswitch_data_0

    return-object p1

    .line 151
    :pswitch_0
    new-instance p1, Lcom/facebook/react/modules/vibration/VibrationModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/vibration/VibrationModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 137
    :pswitch_1
    new-instance p1, Lcom/facebook/react/animated/NativeAnimatedModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/animated/NativeAnimatedModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 143
    :pswitch_2
    new-instance p1, Lcom/facebook/react/modules/share/ShareModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/share/ShareModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 117
    :pswitch_3
    new-instance p1, Lcom/facebook/react/modules/blob/BlobModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/blob/BlobModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 139
    :pswitch_4
    new-instance p1, Lcom/facebook/react/modules/network/NetworkingModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/network/NetworkingModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 115
    :pswitch_5
    new-instance p1, Lcom/facebook/react/modules/appstate/AppStateModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/appstate/AppStateModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 135
    :pswitch_6
    new-instance p1, Lcom/facebook/react/modules/intent/IntentModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/intent/IntentModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 155
    :pswitch_7
    new-instance p1, Lcom/facebook/react/modules/devtoolssettings/DevToolsSettingsManagerModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/devtoolssettings/DevToolsSettingsManagerModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 123
    :pswitch_8
    new-instance p1, Lcom/facebook/react/modules/clipboard/ClipboardModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/clipboard/ClipboardModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 127
    :pswitch_9
    new-instance v0, Lcom/facebook/react/modules/fresco/FrescoModule;

    iget-object v2, p0, Lcom/facebook/react/shell/MainReactPackage;->mConfig:Lcom/facebook/react/shell/MainPackageConfig;

    if-eqz v2, :cond_17

    invoke-virtual {v2}, Lcom/facebook/react/shell/MainPackageConfig;->getFrescoConfig()Lcom/facebook/imagepipeline/core/ImagePipelineConfig;

    move-result-object p1

    :cond_17
    invoke-direct {v0, p2, v1, p1}, Lcom/facebook/react/modules/fresco/FrescoModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;ZLcom/facebook/imagepipeline/core/ImagePipelineConfig;)V

    return-object v0

    .line 119
    :pswitch_a
    new-instance p1, Lcom/facebook/react/modules/devloading/DevLoadingModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/devloading/DevLoadingModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 153
    :pswitch_b
    new-instance p1, Lcom/facebook/react/modules/websocket/WebSocketModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/websocket/WebSocketModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 145
    :pswitch_c
    new-instance p1, Lcom/facebook/react/modules/statusbar/StatusBarModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/statusbar/StatusBarModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 111
    :pswitch_d
    new-instance p1, Lcom/facebook/react/modules/accessibilityinfo/AccessibilityInfoModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/accessibilityinfo/AccessibilityInfoModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 113
    :pswitch_e
    new-instance p1, Lcom/facebook/react/modules/appearance/AppearanceModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/appearance/AppearanceModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 129
    :pswitch_f
    new-instance p1, Lcom/facebook/react/modules/i18nmanager/I18nManagerModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/i18nmanager/I18nManagerModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 131
    :pswitch_10
    new-instance p1, Lcom/facebook/react/modules/image/ImageLoaderModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/image/ImageLoaderModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 141
    :pswitch_11
    new-instance p1, Lcom/facebook/react/modules/permissions/PermissionsModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/permissions/PermissionsModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 121
    :pswitch_12
    new-instance p1, Lcom/facebook/react/modules/blob/FileReaderModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/blob/FileReaderModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 125
    :pswitch_13
    new-instance p1, Lcom/facebook/react/modules/dialog/DialogModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/dialog/DialogModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 147
    :pswitch_14
    new-instance p1, Lcom/facebook/react/modules/sound/SoundManagerModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/sound/SoundManagerModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 133
    :pswitch_15
    new-instance p1, Lcom/facebook/react/modules/camera/ImageStoreManager;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/camera/ImageStoreManager;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    .line 149
    :pswitch_16
    new-instance p1, Lcom/facebook/react/modules/toast/ToastModule;

    invoke-direct {p1, p2}, Lcom/facebook/react/modules/toast/ToastModule;-><init>(Lcom/facebook/react/bridge/ReactApplicationContext;)V

    return-object p1

    :sswitch_data_0
    .sparse-switch
        -0x7e115d98 -> :sswitch_16
        -0x74ffd399 -> :sswitch_15
        -0x6e4e4c42 -> :sswitch_14
        -0x629eae76 -> :sswitch_13
        -0x501dbf35 -> :sswitch_12
        -0x3f4dc695 -> :sswitch_11
        -0x272d42d2 -> :sswitch_10
        -0x21ff2871 -> :sswitch_f
        -0x1e16677c -> :sswitch_e
        -0x1b4a7d04 -> :sswitch_d
        -0x16ced634 -> :sswitch_c
        -0xf2876ed -> :sswitch_b
        -0x5ea6d34 -> :sswitch_a
        0x9baee92 -> :sswitch_9
        0x180dfd76 -> :sswitch_8
        0x1a6bde44 -> :sswitch_7
        0x219d6013 -> :sswitch_6
        0x48cceb10 -> :sswitch_5
        0x5a50c314 -> :sswitch_4
        0x5c43b489 -> :sswitch_3
        0x5cb5e70b -> :sswitch_2
        0x66989206 -> :sswitch_1
        0x72911272 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getReactModuleInfoProvider()Lcom/facebook/react/module/model/ReactModuleInfoProvider;
    .locals 15

    const-string v0, "No ReactModuleInfoProvider for com.facebook.react.shell.MainReactPackage$$ReactModuleInfoProvider"

    :try_start_0
    const-string v1, "com.facebook.react.shell.MainReactPackage$$ReactModuleInfoProvider"

    .line 255
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 256
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/react/module/model/ReactModuleInfoProvider;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    .line 308
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_1
    move-exception v1

    .line 304
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_2
    const/16 v0, 0x17

    new-array v1, v0, [Ljava/lang/Class;

    .line 260
    const-class v2, Lcom/facebook/react/modules/accessibilityinfo/AccessibilityInfoModule;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lcom/facebook/react/modules/appearance/AppearanceModule;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-class v4, Lcom/facebook/react/modules/appstate/AppStateModule;

    aput-object v4, v1, v2

    const/4 v2, 0x3

    const-class v4, Lcom/facebook/react/modules/blob/BlobModule;

    aput-object v4, v1, v2

    const/4 v2, 0x4

    const-class v4, Lcom/facebook/react/modules/devloading/DevLoadingModule;

    aput-object v4, v1, v2

    const/4 v2, 0x5

    const-class v4, Lcom/facebook/react/modules/blob/FileReaderModule;

    aput-object v4, v1, v2

    const/4 v2, 0x6

    const-class v4, Lcom/facebook/react/modules/clipboard/ClipboardModule;

    aput-object v4, v1, v2

    const/4 v2, 0x7

    const-class v4, Lcom/facebook/react/modules/dialog/DialogModule;

    aput-object v4, v1, v2

    const/16 v2, 0x8

    const-class v4, Lcom/facebook/react/modules/fresco/FrescoModule;

    aput-object v4, v1, v2

    const/16 v2, 0x9

    const-class v4, Lcom/facebook/react/modules/i18nmanager/I18nManagerModule;

    aput-object v4, v1, v2

    const/16 v2, 0xa

    const-class v4, Lcom/facebook/react/modules/image/ImageLoaderModule;

    aput-object v4, v1, v2

    const/16 v2, 0xb

    const-class v4, Lcom/facebook/react/modules/camera/ImageStoreManager;

    aput-object v4, v1, v2

    const/16 v2, 0xc

    const-class v4, Lcom/facebook/react/modules/intent/IntentModule;

    aput-object v4, v1, v2

    const/16 v2, 0xd

    const-class v4, Lcom/facebook/react/animated/NativeAnimatedModule;

    aput-object v4, v1, v2

    const/16 v2, 0xe

    const-class v4, Lcom/facebook/react/modules/network/NetworkingModule;

    aput-object v4, v1, v2

    const/16 v2, 0xf

    const-class v4, Lcom/facebook/react/modules/permissions/PermissionsModule;

    aput-object v4, v1, v2

    const/16 v2, 0x10

    const-class v4, Lcom/facebook/react/modules/devtoolssettings/DevToolsSettingsManagerModule;

    aput-object v4, v1, v2

    const/16 v2, 0x11

    const-class v4, Lcom/facebook/react/modules/share/ShareModule;

    aput-object v4, v1, v2

    const/16 v2, 0x12

    const-class v4, Lcom/facebook/react/modules/statusbar/StatusBarModule;

    aput-object v4, v1, v2

    const/16 v2, 0x13

    const-class v4, Lcom/facebook/react/modules/sound/SoundManagerModule;

    aput-object v4, v1, v2

    const/16 v2, 0x14

    const-class v4, Lcom/facebook/react/modules/toast/ToastModule;

    aput-object v4, v1, v2

    const/16 v2, 0x15

    const-class v4, Lcom/facebook/react/modules/vibration/VibrationModule;

    aput-object v4, v1, v2

    const/16 v2, 0x16

    const-class v4, Lcom/facebook/react/modules/websocket/WebSocketModule;

    aput-object v4, v1, v2

    .line 287
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    :goto_0
    if-ge v3, v0, :cond_1

    .line 288
    aget-object v4, v1, v3

    .line 289
    const-class v5, Lcom/facebook/react/module/annotations/ReactModule;

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/facebook/react/module/annotations/ReactModule;

    if-eqz v5, :cond_0

    .line 292
    invoke-interface {v5}, Lcom/facebook/react/module/annotations/ReactModule;->name()Ljava/lang/String;

    move-result-object v6

    new-instance v14, Lcom/facebook/react/module/model/ReactModuleInfo;

    .line 294
    invoke-interface {v5}, Lcom/facebook/react/module/annotations/ReactModule;->name()Ljava/lang/String;

    move-result-object v8

    .line 295
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    .line 296
    invoke-interface {v5}, Lcom/facebook/react/module/annotations/ReactModule;->canOverrideExistingModule()Z

    move-result v10

    .line 297
    invoke-interface {v5}, Lcom/facebook/react/module/annotations/ReactModule;->needsEagerInit()Z

    move-result v11

    .line 298
    invoke-interface {v5}, Lcom/facebook/react/module/annotations/ReactModule;->isCxxModule()Z

    move-result v12

    .line 299
    invoke-static {v4}, Lcom/facebook/react/module/model/ReactModuleInfo;->classIsTurboModule(Ljava/lang/Class;)Z

    move-result v13

    move-object v7, v14

    invoke-direct/range {v7 .. v13}, Lcom/facebook/react/module/model/ReactModuleInfo;-><init>(Ljava/lang/String;Ljava/lang/String;ZZZZ)V

    .line 291
    invoke-interface {v2, v6, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 302
    :cond_1
    new-instance v0, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda7;

    invoke-direct {v0, v2}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda7;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getViewManagerNames(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/Collection;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 241
    invoke-virtual {p0}, Lcom/facebook/react/shell/MainReactPackage;->getViewManagersMap()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    return-object p1
.end method

.method public getViewManagers(Lcom/facebook/react/bridge/ReactApplicationContext;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/react/bridge/ReactApplicationContext;",
            ")",
            "Ljava/util/List<",
            "Lcom/facebook/react/bridge/ModuleSpec;",
            ">;"
        }
    .end annotation

    .line 236
    new-instance p1, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/facebook/react/shell/MainReactPackage;->getViewManagersMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p1
.end method

.method public getViewManagersMap()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/react/bridge/ModuleSpec;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/facebook/react/shell/MainReactPackage;->mViewManagers:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 197
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 198
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda0;-><init>()V

    const-string v2, "AndroidDrawerLayout"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 199
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda14;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda14;-><init>()V

    const-string v2, "AndroidHorizontalScrollView"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 203
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda15;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda15;-><init>()V

    const-string v2, "AndroidHorizontalScrollContentView"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 207
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda16;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda16;-><init>()V

    const-string v2, "AndroidProgressBar"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 209
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda1;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda1;-><init>()V

    const-string v2, "RCTScrollView"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 210
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda2;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda2;-><init>()V

    const-string v2, "AndroidSwitch"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 211
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda3;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda3;-><init>()V

    const-string v2, "AndroidSwipeRefreshLayout"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 213
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda4;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda4;-><init>()V

    const-string v2, "RCTTextInlineImage"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 217
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda5;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda5;-><init>()V

    const-string v2, "RCTImageView"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 218
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda6;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda6;-><init>()V

    const-string v2, "RCTModalHostView"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 219
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda8;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda8;-><init>()V

    const-string v2, "RCTRawText"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 220
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda9;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda9;-><init>()V

    const-string v2, "AndroidTextInput"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 221
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda10;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda10;-><init>()V

    const-string v2, "RCTText"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 222
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda11;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda11;-><init>()V

    const-string v2, "RCTView"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 223
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda12;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda12;-><init>()V

    const-string v2, "RCTVirtualText"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    .line 225
    new-instance v1, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda13;

    invoke-direct {v1}, Lcom/facebook/react/shell/MainReactPackage$$ExternalSyntheticLambda13;-><init>()V

    const-string v2, "UnimplementedNativeView"

    invoke-static {v0, v2, v1}, Lcom/facebook/react/shell/MainReactPackage;->appendMap(Ljava/util/Map;Ljava/lang/String;Ljavax/inject/Provider;)V

    iput-object v0, p0, Lcom/facebook/react/shell/MainReactPackage;->mViewManagers:Ljava/util/Map;

    :cond_0
    iget-object v0, p0, Lcom/facebook/react/shell/MainReactPackage;->mViewManagers:Ljava/util/Map;

    return-object v0
.end method
