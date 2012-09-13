.class public Lcom/android/phone/SomcPhoneUtils;
.super Ljava/lang/Object;
.source "SomcPhoneUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/phone/SomcPhoneUtils$1;
    }
.end annotation


# static fields
.field private static final STATUS_PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "contact_id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "status"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "status_ts"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "status_res_package"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "status_icon"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "display_name"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/phone/SomcPhoneUtils;->STATUS_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static doesDualMicNoiseSuppressionExist(Landroid/content/Context;)Z
    .locals 3

    const-string v2, "audio"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const-string v2, "dualmic_enabled"

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "false"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    :cond_0
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static filterNumberPrefix(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    if-nez p0, :cond_1

    const/4 p0, 0x0

    :cond_0
    :goto_0
    return-object p0

    :cond_1
    const/4 v5, 0x2

    new-array v4, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "*31#"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-string v6, "#31#"

    aput-object v6, v4, v5

    move-object v0, v4

    array-length v2, v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    invoke-virtual {p0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method static getCallFailedString(Landroid/content/Context;Lcom/android/internal/telephony/Call;)Ljava/lang/String;
    .locals 7

    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    const/4 v4, 0x0

    if-nez v0, :cond_2

    const v4, 0x7f0b0019

    :cond_0
    :goto_0
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    const v4, 0x7f0b0019

    :cond_1
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    return-object v5

    :cond_2
    invoke-static {}, Lcom/android/phone/PhoneApp;->getInstance()Lcom/android/phone/PhoneApp;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/phone/PhoneApp;->getSettingsParser()Lcom/android/phone/SomcSettingsParser;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v5, "call-failed-raw-cause-code"

    invoke-virtual {v2, v5}, Lcom/android/phone/SomcSettingsParser;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getRawDisconnectCause()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v1

    sget-object v5, Lcom/android/phone/SomcPhoneUtils$1;->$SwitchMap$com$android$internal$telephony$Connection$DisconnectCause:[I

    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection$DisconnectCause;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    const v4, 0x7f0b0019

    goto :goto_0

    :sswitch_0
    const v4, 0x7f0b001a

    goto :goto_0

    :sswitch_1
    const v4, 0x7f0b001b

    goto :goto_0

    :sswitch_2
    const v4, 0x7f0b001c

    goto :goto_0

    :sswitch_3
    const v4, 0x7f0b001d

    goto :goto_0

    :sswitch_4
    const v4, 0x7f0b001e

    goto :goto_0

    :sswitch_5
    const v4, 0x7f0b001f

    goto :goto_0

    :sswitch_6
    const v4, 0x7f0b0020

    goto :goto_0

    :sswitch_7
    const v4, 0x7f0b0021

    goto :goto_0

    :sswitch_8
    const v4, 0x7f0b0022

    goto :goto_0

    :sswitch_9
    const v4, 0x7f0b0023

    goto :goto_0

    :sswitch_a
    const v4, 0x7f0b0024

    goto :goto_0

    :sswitch_b
    const v4, 0x7f0b0025

    goto :goto_0

    :sswitch_c
    const v4, 0x7f0b0026

    goto :goto_0

    :sswitch_d
    const v4, 0x7f0b0027

    goto :goto_0

    :sswitch_e
    const v4, 0x7f0b0028

    goto :goto_0

    :sswitch_f
    const v4, 0x7f0b0029

    goto :goto_0

    :sswitch_10
    const v4, 0x7f0b002a

    goto/16 :goto_0

    :sswitch_11
    const v4, 0x7f0b002b

    goto/16 :goto_0

    :sswitch_12
    const v4, 0x7f0b002c

    goto/16 :goto_0

    :sswitch_13
    const v4, 0x7f0b002d

    goto/16 :goto_0

    :sswitch_14
    const v4, 0x7f0b002e

    goto/16 :goto_0

    :sswitch_15
    const v4, 0x7f0b002f

    goto/16 :goto_0

    :sswitch_16
    const v4, 0x7f0b0030

    goto/16 :goto_0

    :sswitch_17
    const v4, 0x7f0b0031

    goto/16 :goto_0

    :sswitch_18
    const v4, 0x7f0b0032

    goto/16 :goto_0

    :sswitch_19
    const v4, 0x7f0b0033

    goto/16 :goto_0

    :sswitch_1a
    const v4, 0x7f0b0034

    goto/16 :goto_0

    :sswitch_1b
    const v4, 0x7f0b0035

    goto/16 :goto_0

    :sswitch_1c
    const v4, 0x7f0b0036

    goto/16 :goto_0

    :sswitch_1d
    const v4, 0x7f0b0037

    goto/16 :goto_0

    :sswitch_1e
    const v4, 0x7f0b0038

    goto/16 :goto_0

    :sswitch_1f
    const v4, 0x7f0b0039

    goto/16 :goto_0

    :sswitch_20
    const v4, 0x7f0b003a

    goto/16 :goto_0

    :sswitch_21
    const v4, 0x7f0b003b

    goto/16 :goto_0

    :sswitch_22
    const v4, 0x7f0b003c

    goto/16 :goto_0

    :sswitch_23
    const v4, 0x7f0b003d

    goto/16 :goto_0

    :sswitch_24
    const v4, 0x7f0b003e

    goto/16 :goto_0

    :sswitch_25
    const v4, 0x7f0b003f

    goto/16 :goto_0

    :sswitch_26
    const v4, 0x7f0b0040

    goto/16 :goto_0

    :sswitch_27
    const v4, 0x7f0b0041

    goto/16 :goto_0

    :sswitch_28
    const v4, 0x7f0b0042

    goto/16 :goto_0

    :sswitch_29
    const v4, 0x7f0b0043

    goto/16 :goto_0

    :sswitch_2a
    const v4, 0x7f0b0044

    goto/16 :goto_0

    :sswitch_2b
    const v4, 0x7f0b0045

    goto/16 :goto_0

    :sswitch_2c
    const v4, 0x7f0b0046

    goto/16 :goto_0

    :sswitch_2d
    const v4, 0x7f0b0047

    goto/16 :goto_0

    :sswitch_2e
    const v4, 0x7f0b0048

    goto/16 :goto_0

    :sswitch_2f
    const v4, 0x7f0b0049

    goto/16 :goto_0

    :sswitch_30
    const v4, 0x7f0b004a

    goto/16 :goto_0

    :pswitch_0
    const v4, 0x7f0b0016

    goto/16 :goto_0

    :pswitch_1
    const v4, 0x7f0b0017

    goto/16 :goto_0

    :pswitch_2
    const v4, 0x7f0b0015

    goto/16 :goto_0

    :cond_3
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getDisconnectCause()Lcom/android/internal/telephony/Connection$DisconnectCause;

    move-result-object v1

    sget-object v5, Lcom/android/phone/SomcPhoneUtils$1;->$SwitchMap$com$android$internal$telephony$Connection$DisconnectCause:[I

    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection$DisconnectCause;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_1

    const v4, 0x7f0b0019

    goto/16 :goto_0

    :pswitch_3
    const v4, 0x7f0b0018

    goto/16 :goto_0

    :pswitch_4
    const v4, 0x7f0b000c

    goto/16 :goto_0

    :pswitch_5
    const v4, 0x7f0b0014

    goto/16 :goto_0

    :pswitch_6
    const v4, 0x7f0b0013

    goto/16 :goto_0

    :pswitch_7
    const v4, 0x7f0b0016

    goto/16 :goto_0

    :pswitch_8
    const v4, 0x7f0b0017

    goto/16 :goto_0

    :pswitch_9
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/TelephonyManager;->isIccInvalidCard()Z

    move-result v5

    if-eqz v5, :cond_4

    const v4, 0x10400be

    goto/16 :goto_0

    :cond_4
    const v4, 0x7f0b0015

    goto/16 :goto_0

    :pswitch_a
    const v4, 0x7f0b0255

    goto/16 :goto_0

    :pswitch_b
    const v4, 0x7f0b0257

    goto/16 :goto_0

    :pswitch_c
    const v4, 0x7f0b0256

    goto/16 :goto_0

    :pswitch_d
    const v4, 0x7f0b0252

    goto/16 :goto_0

    :pswitch_e
    const v4, 0x7f0b0253

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x3 -> :sswitch_1
        0x6 -> :sswitch_2
        0x8 -> :sswitch_3
        0x10 -> :sswitch_4
        0x11 -> :sswitch_5
        0x12 -> :sswitch_6
        0x13 -> :sswitch_7
        0x15 -> :sswitch_8
        0x16 -> :sswitch_9
        0x19 -> :sswitch_a
        0x1a -> :sswitch_b
        0x1b -> :sswitch_c
        0x1c -> :sswitch_d
        0x1d -> :sswitch_e
        0x1e -> :sswitch_f
        0x1f -> :sswitch_10
        0x22 -> :sswitch_11
        0x26 -> :sswitch_12
        0x29 -> :sswitch_13
        0x2a -> :sswitch_14
        0x2b -> :sswitch_15
        0x2c -> :sswitch_16
        0x2f -> :sswitch_17
        0x31 -> :sswitch_18
        0x32 -> :sswitch_19
        0x37 -> :sswitch_1a
        0x39 -> :sswitch_1b
        0x3a -> :sswitch_1c
        0x3f -> :sswitch_1d
        0x41 -> :sswitch_1e
        0x44 -> :sswitch_1f
        0x45 -> :sswitch_20
        0x46 -> :sswitch_21
        0x4f -> :sswitch_22
        0x51 -> :sswitch_23
        0x57 -> :sswitch_24
        0x58 -> :sswitch_25
        0x5b -> :sswitch_26
        0x5f -> :sswitch_27
        0x60 -> :sswitch_28
        0x61 -> :sswitch_29
        0x62 -> :sswitch_2a
        0x63 -> :sswitch_2b
        0x64 -> :sswitch_2c
        0x65 -> :sswitch_2d
        0x66 -> :sswitch_2e
        0x6f -> :sswitch_2f
        0x7f -> :sswitch_30
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
    .end packed-switch
.end method

.method static getNameFromCallerInfo(Landroid/content/Context;Lcom/android/internal/telephony/CallerInfo;I)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    if-eqz p1, :cond_4

    sget v1, Lcom/android/internal/telephony/Connection;->PRESENTATION_ALLOWED:I

    if-ne p2, v1, :cond_3

    iget v1, p1, Lcom/android/internal/telephony/CallerInfo;->namePresentation:I

    sget v2, Lcom/android/internal/telephony/Connection;->PRESENTATION_RESTRICTED:I

    if-ne v1, v2, :cond_1

    const v1, 0x7f0b0157

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    iget v1, p1, Lcom/android/internal/telephony/CallerInfo;->namePresentation:I

    sget v2, Lcom/android/internal/telephony/Connection;->PRESENTATION_UNKNOWN:I

    if-ne v1, v2, :cond_2

    const v1, 0x7f0b0158

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    iget-object v1, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/CallerInfo;->name:Ljava/lang/String;

    goto :goto_0

    :cond_3
    invoke-static {p0, p2}, Lcom/android/phone/SomcPhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_4
    invoke-static {p0, p2}, Lcom/android/phone/SomcPhoneUtils;->getPresentationString(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static getNumberFromCall(Lcom/android/internal/telephony/Call;)Ljava/lang/String;
    .locals 3

    const/4 v1, 0x0

    if-nez p0, :cond_0

    move-object v0, v1

    :goto_0
    if-nez v0, :cond_2

    :goto_1
    return-object v1

    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->isMultiparty()Z

    move-result v2

    if-eqz v2, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method static getPresentationString(Landroid/content/Context;I)Ljava/lang/String;
    .locals 2

    const v1, 0x7f0b024b

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/android/internal/telephony/Connection;->PRESENTATION_RESTRICTED:I

    if-ne p1, v1, :cond_1

    const v1, 0x7f0b007d

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    :goto_0
    return-object v0

    :cond_1
    sget v1, Lcom/android/internal/telephony/Connection;->PRESENTATION_PAYPHONE:I

    if-ne p1, v1, :cond_0

    const v1, 0x7f0b024d

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method static getSnsInfo(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)Lcom/android/phone/SomcInCallScreen$SnsInfo;
    .locals 14

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v11, 0x0

    const-string v0, "content://com.android.contacts/data"

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v3, "upper(data1)=? AND mimetype=\'vnd.android.cursor.item/sip_address\'"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    :cond_0
    :goto_0
    invoke-static {v11, p0, p1}, Lcom/android/phone/SomcPhoneUtils;->paserContact(Landroid/database/Cursor;Landroid/content/ContentResolver;Landroid/net/Uri;)Lcom/android/phone/SomcInCallScreen$SnsInfo;

    move-result-object v12

    if-eqz v11, :cond_1

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v12

    :cond_2
    const-string v0, "content://com.android.contacts/phone_lookup"

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v5, p0

    move-object v6, p1

    invoke-virtual/range {v5 .. v10}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    goto :goto_0
.end method

.method static isAirplaneModeOn(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method static isDualMicNoiseSuppressionOn(Landroid/content/Context;)Z
    .locals 3

    const-string v2, "audio"

    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const-string v2, "dualmic_enabled"

    invoke-virtual {v0, v2}, Landroid/media/AudioManager;->getParameters(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "true"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static isEmergencyCall(Lcom/android/internal/telephony/Call;)Z
    .locals 3

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/android/phone/SomcPhoneUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v1

    :cond_0
    return v1
.end method

.method static isEmergencyNumber(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-static {p0}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v1, "112"

    invoke-virtual {p0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "911"

    invoke-virtual {p0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method static isInternatioalCallLockOn(Landroid/content/Context;)Z
    .locals 3

    const/4 v2, 0x0

    const-string v1, "international_call_lock_setting_pref"

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "international_call_lock_key"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    return v1
.end method

.method static isNationalRoaming(Landroid/telephony/ServiceState;)Z
    .locals 7

    const/4 v6, 0x0

    const/4 v5, 0x3

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/telephony/ServiceState;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v1

    const-string v3, "gsm.sim.operator.numeric"

    const-string v4, ""

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v5, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v5, :cond_0

    invoke-virtual {v2, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v4, "SomcPhoneUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, " isNationalRoaming returns "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    if-eqz v0, :cond_1

    const-string v3, "same"

    :goto_0
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return v0

    :cond_1
    const-string v3, "different"

    goto :goto_0
.end method

.method public static isSystemOrSmartCardPackage(Landroid/content/Context;I)Z
    .locals 12

    const/4 v7, 0x1

    const/4 v8, 0x0

    const/16 v9, 0x404

    if-ne p1, v9, :cond_1

    :cond_0
    :goto_0
    return v7

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    invoke-virtual {v9, p1}, Landroid/content/pm/PackageManager;->getPackagesForUid(I)[Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    array-length v9, v5

    if-gtz v9, :cond_3

    :cond_2
    move v7, v8

    goto :goto_0

    :cond_3
    move-object v0, v5

    array-length v3, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v3, :cond_0

    aget-object v4, v0, v2

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v4, v10}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    iget-object v9, v6, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v9, v9, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    and-int/lit8 v9, v9, 0x1

    if-nez v9, :cond_4

    move v7, v8

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v9, "SomcPhoneUtils"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Package name not found"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method static isVoiceMailNumber(Ljava/lang/String;)Z
    .locals 6

    const/4 v3, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v4

    invoke-virtual {v4}, Landroid/telephony/TelephonyManager;->getVoiceMailNumber()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    :goto_0
    if-nez v1, :cond_0

    if-eqz v2, :cond_0

    invoke-virtual {p0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3

    :catch_0
    move-exception v0

    const/4 v1, 0x1

    const-string v4, "SomcPhoneUtils"

    const-string v5, "Security exception in isVoiceMailNumber."

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static log(Ljava/lang/String;)V
    .locals 1

    const-string v0, "SomcPhoneUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static final paserContact(Landroid/database/Cursor;Landroid/content/ContentResolver;Landroid/net/Uri;)Lcom/android/phone/SomcInCallScreen$SnsInfo;
    .locals 10

    if-eqz p0, :cond_0

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v8

    if-nez v8, :cond_2

    :cond_0
    const/4 v2, 0x0

    :cond_1
    return-object v2

    :cond_2
    new-instance v2, Lcom/android/phone/SomcInCallScreen$SnsInfo;

    invoke-direct {v2}, Lcom/android/phone/SomcInCallScreen$SnsInfo;-><init>()V

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v0, 0x0

    const-string v8, "content://com.android.contacts/data"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    const-string v8, "contact_id"

    invoke-interface {p0, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    :cond_3
    :goto_0
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8

    if-eqz v8, :cond_1

    iget-object v8, v2, Lcom/android/phone/SomcInCallScreen$SnsInfo;->snsText:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8, p1}, Lcom/android/phone/SomcPhoneUtils;->queryStatus(Ljava/lang/String;Landroid/content/ContentResolver;)Landroid/database/Cursor;

    move-result-object v4

    if-eqz v4, :cond_3

    const-string v8, "status"

    invoke-interface {v4, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v5

    const-string v8, "status_ts"

    invoke-interface {v4, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    const-string v8, "status_res_package"

    invoke-interface {v4, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    const-string v8, "status_icon"

    invoke-interface {v4, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    :goto_1
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v8

    if-eqz v8, :cond_5

    iget-object v8, v2, Lcom/android/phone/SomcInCallScreen$SnsInfo;->snsText:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v2, Lcom/android/phone/SomcInCallScreen$SnsInfo;->snsText:Ljava/lang/String;

    invoke-interface {v4, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v2, Lcom/android/phone/SomcInCallScreen$SnsInfo;->snsPackage:Ljava/lang/String;

    invoke-interface {v4, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    iput v8, v2, Lcom/android/phone/SomcInCallScreen$SnsInfo;->iconRes:I

    invoke-interface {v4, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    iput-wide v8, v2, Lcom/android/phone/SomcInCallScreen$SnsInfo;->timeStamp:J

    goto :goto_1

    :cond_4
    const-string v8, "content://com.android.contacts/phone_lookup"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    const-string v8, "_id"

    invoke-interface {p0, v8}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_5
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method private static final queryStatus(Ljava/lang/String;Landroid/content/ContentResolver;)Landroid/database/Cursor;
    .locals 7

    const/4 v6, 0x0

    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    sget-object v1, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/phone/SomcPhoneUtils;->STATUS_PROJECTION:[Ljava/lang/String;

    const-string v3, "contact_id =? "

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p0, v4, v0

    const-string v5, "display_name DESC"

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    move-object v0, v6

    goto :goto_0
.end method

.method static restoreDualMicNoiseSuppressionUsed(Landroid/content/Context;)V
    .locals 6

    invoke-static {p0}, Lcom/android/phone/SomcPhoneUtils;->doesDualMicNoiseSuppressionExist(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "dual_mic_noise_suppression_pref"

    const/4 v5, 0x0

    invoke-virtual {p0, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-static {}, Lcom/android/phone/PhoneApp;->getInstance()Lcom/android/phone/PhoneApp;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/phone/PhoneApp;->getSettingsParser()Lcom/android/phone/SomcSettingsParser;

    move-result-object v1

    const-string v4, "dual-mic-noise-suppression-enabled"

    invoke-virtual {v1, v4}, Lcom/android/phone/SomcSettingsParser;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const-string v4, "dual_mic_noise_suppression_key"

    invoke-interface {v2, v4, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-static {p0, v3}, Lcom/android/phone/SomcPhoneUtils;->setDualMicNoiseSuppression(Landroid/content/Context;Z)V

    :cond_0
    return-void
.end method

.method static setDualMicNoiseSuppression(Landroid/content/Context;Z)V
    .locals 2

    invoke-static {p0, p1}, Lcom/android/phone/SomcPhoneUtils;->storeDualMicNoiseSuppressionSetting(Landroid/content/Context;Z)V

    const-string v1, "audio"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    if-eqz p1, :cond_0

    const-string v1, "dualmic_enabled=true"

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    const-string v1, "dualmic_enabled=false"

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->setParameters(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static setInternatioalCallLock(Landroid/content/Context;Z)V
    .locals 4

    const-string v2, "international_call_lock_setting_pref"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "international_call_lock_key"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method static silenceRinger()V
    .locals 2

    invoke-static {}, Lcom/android/phone/PhoneApp;->getInstance()Lcom/android/phone/PhoneApp;

    move-result-object v1

    iget-object v0, v1, Lcom/android/phone/PhoneApp;->notifier:Lcom/android/phone/CallNotifier;

    invoke-virtual {v0}, Lcom/android/phone/CallNotifier;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/android/phone/PhoneUtils;->setAudioControlState(I)V

    sget-boolean v1, Lcom/android/phone/PhoneApp;->DBG:Z

    if-eqz v1, :cond_0

    const-string v1, "silence ringer(trigger by VOLUME key or open reject message list and so on)"

    invoke-static {v1}, Lcom/android/phone/SomcPhoneUtils;->log(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {v0}, Lcom/android/phone/CallNotifier;->silenceRinger()V

    :cond_1
    return-void
.end method

.method static startIllumination(Landroid/content/Context;Landroid/os/IPowerManager;)V
    .locals 3

    const/4 v1, 0x1

    const v2, -0xffff01

    :try_start_0
    invoke-interface {p1, v1, v2}, Landroid/os/IPowerManager;->setAttentionLight(ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.sonyericsson.illumination.intent.action.START_LED_PULSE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sonyericsson.illumination.intent.extra.LED_ID"

    const-string v2, "com.sonyericsson.illumination.intent.extra.value.BUTTON_2"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.sonyericsson.illumination.intent.extra.PACKAGE_NAME"

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.sonyericsson.illumination.intent.extra.LED_PULSE_ON_TIME"

    const/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "com.sonyericsson.illumination.intent.extra.LED_PULSE_OFF_TIME"

    const/16 v2, 0x5dc

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "com.sonyericsson.illumination.intent.extra.LED_NO_OF_PULSES"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static stopIllumination(Landroid/content/Context;Landroid/os/IPowerManager;)V
    .locals 3

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-interface {p1, v1, v2}, Landroid/os/IPowerManager;->setAttentionLight(ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.sonyericsson.illumination.intent.action.STOP_LED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.sonyericsson.illumination.intent.extra.LED_ID"

    const-string v2, "com.sonyericsson.illumination.intent.extra.value.BUTTON_2"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.sonyericsson.illumination.intent.extra.PACKAGE_NAME"

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void

    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method static storeDualMicNoiseSuppressionSetting(Landroid/content/Context;Z)V
    .locals 4

    const-string v2, "dual_mic_noise_suppression_pref"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "dual_mic_noise_suppression_key"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
