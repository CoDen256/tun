.class synthetic Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$1;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseFirestoreModule.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$google$firebase$firestore$LoadBundleTaskProgress$TaskState:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 173
    invoke-static {}, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->values()[Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$1;->$SwitchMap$com$google$firebase$firestore$LoadBundleTaskProgress$TaskState:[I

    :try_start_0
    sget-object v1, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->RUNNING:Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$1;->$SwitchMap$com$google$firebase$firestore$LoadBundleTaskProgress$TaskState:[I

    sget-object v1, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->SUCCESS:Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreModule$1;->$SwitchMap$com$google$firebase$firestore$LoadBundleTaskProgress$TaskState:[I

    sget-object v1, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->ERROR:Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;

    invoke-virtual {v1}, Lcom/google/firebase/firestore/LoadBundleTaskProgress$TaskState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    return-void
.end method
