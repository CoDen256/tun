.class public final Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfoKt;
.super Ljava/lang/Object;
.source "DownloadableFontInfo.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\u001a\u0018\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\u0004H\u0000\u00a8\u0006\u0005"
    }
    d2 = {
        "toDownloadableFontInfo",
        "Lcom/revenuecat/purchases/utils/Result;",
        "Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;",
        "",
        "Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;",
        "purchases_defaultsRelease"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic toDownloadableFontInfo(Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;)Lcom/revenuecat/purchases/utils/Result;
    .locals 8

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 26
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getUrl()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    const-string v1, ". Cannot download font. Please try to re-upload your font in the RevenueCat dashboard."

    if-eqz v0, :cond_7

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getHash()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_6

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto/16 :goto_1

    .line 38
    :cond_1
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getFamily()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_5

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getWeight()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_3

    .line 45
    new-instance v0, Lcom/revenuecat/purchases/utils/Result$Error;

    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Font weight is null for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 45
    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/utils/Result$Error;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lcom/revenuecat/purchases/utils/Result;

    return-object v0

    .line 50
    :cond_3
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getStyle()Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    move-result-object v0

    if-nez v0, :cond_4

    .line 51
    new-instance v0, Lcom/revenuecat/purchases/utils/Result$Error;

    .line 52
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Font style is null for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 51
    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/utils/Result$Error;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lcom/revenuecat/purchases/utils/Result;

    return-object v0

    .line 56
    :cond_4
    new-instance v0, Lcom/revenuecat/purchases/utils/Result$Success;

    .line 57
    new-instance v7, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;

    .line 58
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getUrl()Ljava/lang/String;

    move-result-object v2

    .line 59
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getHash()Ljava/lang/String;

    move-result-object v3

    .line 60
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getFamily()Ljava/lang/String;

    move-result-object v4

    .line 61
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getWeight()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v5

    .line 62
    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getStyle()Lcom/revenuecat/purchases/paywalls/components/properties/FontStyle;

    move-result-object v6

    move-object v1, v7

    .line 57
    invoke-direct/range {v1 .. v6}, Lcom/revenuecat/purchases/paywalls/fonts/DownloadableFontInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILcom/revenuecat/purchases/paywalls/components/properties/FontStyle;)V

    .line 56
    invoke-direct {v0, v7}, Lcom/revenuecat/purchases/utils/Result$Success;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lcom/revenuecat/purchases/utils/Result;

    return-object v0

    .line 39
    :cond_5
    :goto_0
    new-instance v0, Lcom/revenuecat/purchases/utils/Result$Error;

    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Font family is empty for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 39
    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/utils/Result$Error;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lcom/revenuecat/purchases/utils/Result;

    return-object v0

    .line 33
    :cond_6
    :goto_1
    new-instance v0, Lcom/revenuecat/purchases/utils/Result$Error;

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Font hash is empty for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ". Cannot validate downloaded font. Please try to re-upload your font in the RevenueCat dashboard."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 33
    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/utils/Result$Error;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lcom/revenuecat/purchases/utils/Result;

    return-object v0

    .line 27
    :cond_7
    :goto_2
    new-instance v0, Lcom/revenuecat/purchases/utils/Result$Error;

    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Font URL is empty for "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/revenuecat/purchases/UiConfig$AppConfig$FontsConfig$FontInfo$Name;->getValue()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 27
    invoke-direct {v0, p0}, Lcom/revenuecat/purchases/utils/Result$Error;-><init>(Ljava/lang/Object;)V

    check-cast v0, Lcom/revenuecat/purchases/utils/Result;

    return-object v0
.end method
