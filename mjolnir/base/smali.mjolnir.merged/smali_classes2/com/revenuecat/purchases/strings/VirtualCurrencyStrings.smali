.class public final Lcom/revenuecat/purchases/strings/VirtualCurrencyStrings;
.super Ljava/lang/Object;
.source "VirtualCurrencyStrings.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0004X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/revenuecat/purchases/strings/VirtualCurrencyStrings;",
        "",
        "()V",
        "ERROR_DECODING_CACHED_VIRTUAL_CURRENCIES",
        "",
        "INVALIDATING_VIRTUAL_CURRENCIES_CACHE",
        "NO_CACHED_VIRTUAL_CURRENCIES",
        "VENDING_FROM_CACHE",
        "VIRTUAL_CURRENCIES_STALE_UPDATING_FROM_NETWORK",
        "VIRTUAL_CURRENCIES_UPDATED_FROM_NETWORK",
        "VIRTUAL_CURRENCIES_UPDATED_FROM_NETWORK_ERROR",
        "purchases_defaultsRelease"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final ERROR_DECODING_CACHED_VIRTUAL_CURRENCIES:Ljava/lang/String; = "Couldn\'t decode cached VirtualCurrencies. Error: %s"

.field public static final INSTANCE:Lcom/revenuecat/purchases/strings/VirtualCurrencyStrings;

.field public static final INVALIDATING_VIRTUAL_CURRENCIES_CACHE:Ljava/lang/String; = "Invalidating VirtualCurrencies cache."

.field public static final NO_CACHED_VIRTUAL_CURRENCIES:Ljava/lang/String; = "There are no cached VirtualCurrencies."

.field public static final VENDING_FROM_CACHE:Ljava/lang/String; = "Vending VirtualCurrencies from cache."

.field public static final VIRTUAL_CURRENCIES_STALE_UPDATING_FROM_NETWORK:Ljava/lang/String; = "VirtualCurrencies cache is stale, updating from network."

.field public static final VIRTUAL_CURRENCIES_UPDATED_FROM_NETWORK:Ljava/lang/String; = "VirtualCurrencies updated from the network."

.field public static final VIRTUAL_CURRENCIES_UPDATED_FROM_NETWORK_ERROR:Ljava/lang/String; = "Attempt to update VirtualCurrencies from network failed. Error: %s"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/revenuecat/purchases/strings/VirtualCurrencyStrings;

    invoke-direct {v0}, Lcom/revenuecat/purchases/strings/VirtualCurrencyStrings;-><init>()V

    sput-object v0, Lcom/revenuecat/purchases/strings/VirtualCurrencyStrings;->INSTANCE:Lcom/revenuecat/purchases/strings/VirtualCurrencyStrings;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
