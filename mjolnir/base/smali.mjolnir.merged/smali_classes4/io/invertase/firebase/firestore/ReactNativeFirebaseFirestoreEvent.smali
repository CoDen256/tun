.class public Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;
.super Ljava/lang/Object;
.source "ReactNativeFirebaseFirestoreEvent.java"

# interfaces
.implements Lio/invertase/firebase/interfaces/NativeEvent;


# static fields
.field static final COLLECTION_EVENT_SYNC:Ljava/lang/String; = "firestore_collection_sync_event"

.field static final DOCUMENT_EVENT_SYNC:Ljava/lang/String; = "firestore_document_sync_event"

.field private static final KEY_APP_NAME:Ljava/lang/String; = "appName"

.field private static final KEY_BODY:Ljava/lang/String; = "body"

.field private static final KEY_EVENT_NAME:Ljava/lang/String; = "eventName"

.field private static final KEY_ID:Ljava/lang/String; = "listenerId"

.field static final TRANSACTION_EVENT_SYNC:Ljava/lang/String; = "firestore_transaction_event"


# instance fields
.field private appName:Ljava/lang/String;

.field private eventBody:Lcom/facebook/react/bridge/WritableMap;

.field private eventName:Ljava/lang/String;

.field private listenerId:I


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/facebook/react/bridge/WritableMap;Ljava/lang/String;I)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->eventName:Ljava/lang/String;

    iput-object p2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->eventBody:Lcom/facebook/react/bridge/WritableMap;

    iput-object p3, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->appName:Ljava/lang/String;

    iput p4, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->listenerId:I

    return-void
.end method


# virtual methods
.method public getEventBody()Lcom/facebook/react/bridge/WritableMap;
    .locals 3

    .line 53
    invoke-static {}, Lcom/facebook/react/bridge/Arguments;->createMap()Lcom/facebook/react/bridge/WritableMap;

    move-result-object v0

    const-string v1, "listenerId"

    iget v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->listenerId:I

    .line 54
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putInt(Ljava/lang/String;I)V

    const-string v1, "body"

    iget-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->eventBody:Lcom/facebook/react/bridge/WritableMap;

    .line 55
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putMap(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V

    const-string v1, "appName"

    iget-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->appName:Ljava/lang/String;

    .line 56
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "eventName"

    iget-object v2, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->eventName:Ljava/lang/String;

    .line 57
    invoke-interface {v0, v1, v2}, Lcom/facebook/react/bridge/WritableMap;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->eventName:Ljava/lang/String;

    return-object v0
.end method

.method public getFirebaseAppName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lio/invertase/firebase/firestore/ReactNativeFirebaseFirestoreEvent;->appName:Ljava/lang/String;

    return-object v0
.end method
