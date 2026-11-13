.class public Lio/invertase/firebase/app/ReactNativeFirebaseApp;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseApp.java"


# static fields
.field private static applicationContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApplicationContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lio/invertase/firebase/app/ReactNativeFirebaseApp;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public static initializeSecondaryApp(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lio/invertase/firebase/app/ReactNativeFirebaseApp;->applicationContext:Landroid/content/Context;

    .line 38
    invoke-static {v0}, Lcom/google/firebase/FirebaseOptions;->fromResource(Landroid/content/Context;)Lcom/google/firebase/FirebaseOptions;

    move-result-object v0

    sget-object v1, Lio/invertase/firebase/app/ReactNativeFirebaseApp;->applicationContext:Landroid/content/Context;

    .line 39
    invoke-static {v1, v0, p0}, Lcom/google/firebase/FirebaseApp;->initializeApp(Landroid/content/Context;Lcom/google/firebase/FirebaseOptions;Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    return-void
.end method

.method public static initializeSecondaryApp(Ljava/lang/String;Landroid/content/Context;)V
    .locals 1

    .line 43
    invoke-static {p1}, Lcom/google/firebase/FirebaseOptions;->fromResource(Landroid/content/Context;)Lcom/google/firebase/FirebaseOptions;

    move-result-object v0

    .line 44
    invoke-static {p1, v0, p0}, Lcom/google/firebase/FirebaseApp;->initializeApp(Landroid/content/Context;Lcom/google/firebase/FirebaseOptions;Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    return-void
.end method

.method public static setApplicationContext(Landroid/content/Context;)V
    .locals 2

    const-string v0, "ReactNativeFirebaseApp"

    const-string v1, "received application context."

    .line 33
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sput-object p0, Lio/invertase/firebase/app/ReactNativeFirebaseApp;->applicationContext:Landroid/content/Context;

    return-void
.end method
