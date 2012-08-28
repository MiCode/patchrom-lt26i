.class Lcom/android/internal/telephony/gsm/VoiceMailConstants;
.super Ljava/lang/Object;
.source "VoiceMailConstants.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "GSM"

.field static final NAME:I = 0x0

.field static final NUMBER:I = 0x1

.field static final PARTNER_VOICEMAIL_PATH:Ljava/lang/String; = "etc/voicemail-conf.xml"

.field static final SIZE:I = 0x3

.field static final TAG:I = 0x2


# instance fields
.field private CarrierVmMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 54
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/gsm/VoiceMailConstants;->CarrierVmMap:Ljava/util/HashMap;

    .line 56
    invoke-direct {p0}, Lcom/android/internal/telephony/gsm/VoiceMailConstants;->loadVoiceMail()V

    .line 57
    return-void
.end method

.method private loadVoiceMail()V
    .locals 12

    .prologue
    .line 81
    new-instance v6, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v8

    const-string v9, "etc/voicemail-conf.xml"

    invoke-direct {v6, v8, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    .local v6, vmFile:Ljava/io/File;
    :try_start_0
    new-instance v7, Ljava/io/FileReader;

    invoke-direct {v7, v6}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .local v7, vmReader:Ljava/io/FileReader;
    const/4 v5, 0x0

    .line 94
    .local v5, parser:Lorg/xmlpull/v1/XmlPullParser;
    :try_start_1
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v5

    .line 95
    invoke-interface {v5, v7}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    .line 97
    const-string/jumbo v8, "voicemail"

    invoke-static {v5, v8}, Lcom/android/internal/util/XmlUtils;->beginDocument(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)V

    .line 100
    :goto_0
    invoke-static {v5}, Lcom/android/internal/util/XmlUtils;->nextElement(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 102
    invoke-interface {v5}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 103
    .local v3, name:Ljava/lang/String;
    const-string/jumbo v8, "voicemail"

    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    move-result v8

    if-nez v8, :cond_1

    .line 121
    :try_start_2
    instance-of v8, v5, Ljava/io/Closeable;

    if-eqz v8, :cond_0

    .line 122
    move-object v0, v5

    check-cast v0, Ljava/io/Closeable;

    move-object v8, v0

    invoke-interface {v8}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 128
    .end local v3           #name:Ljava/lang/String;
    .end local v5           #parser:Lorg/xmlpull/v1/XmlPullParser;
    .end local v7           #vmReader:Ljava/io/FileReader;
    :cond_0
    :goto_1
    return-void

    .line 86
    :catch_0
    move-exception v2

    .line 87
    .local v2, e:Ljava/io/FileNotFoundException;
    const-string v8, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Can\'t open "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {}, Landroid/os/Environment;->getRootDirectory()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "/"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "etc/voicemail-conf.xml"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 107
    .end local v2           #e:Ljava/io/FileNotFoundException;
    .restart local v3       #name:Ljava/lang/String;
    .restart local v5       #parser:Lorg/xmlpull/v1/XmlPullParser;
    .restart local v7       #vmReader:Ljava/io/FileReader;
    :cond_1
    const/4 v8, 0x3

    :try_start_3
    new-array v1, v8, [Ljava/lang/String;

    .line 108
    .local v1, data:[Ljava/lang/String;
    const/4 v8, 0x0

    const-string/jumbo v9, "numeric"

    invoke-interface {v5, v8, v9}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 109
    .local v4, numeric:Ljava/lang/String;
    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "carrier"

    invoke-interface {v5, v9, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v8

    .line 110
    const/4 v8, 0x1

    const/4 v9, 0x0

    const-string/jumbo v10, "vmnumber"

    invoke-interface {v5, v9, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v8

    .line 111
    const/4 v8, 0x2

    const/4 v9, 0x0

    const-string/jumbo v10, "vmtag"

    invoke-interface {v5, v9, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v1, v8

    .line 113
    iget-object v8, p0, Lcom/android/internal/telephony/gsm/VoiceMailConstants;->CarrierVmMap:Ljava/util/HashMap;

    invoke-virtual {v8, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_0

    .line 115
    .end local v1           #data:[Ljava/lang/String;
    .end local v3           #name:Ljava/lang/String;
    .end local v4           #numeric:Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 116
    .local v2, e:Lorg/xmlpull/v1/XmlPullParserException;
    :try_start_4
    const-string v8, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception in Voicemail parser "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 121
    :try_start_5
    instance-of v8, v5, Ljava/io/Closeable;

    if-eqz v8, :cond_0

    .line 122
    move-object v0, v5

    check-cast v0, Ljava/io/Closeable;

    move-object v8, v0

    invoke-interface {v8}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_1

    .line 124
    :catch_2
    move-exception v2

    .line 125
    .local v2, e:Ljava/io/IOException;
    const-string v8, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception in Voicemail parser when close parser"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 124
    .end local v2           #e:Ljava/io/IOException;
    .restart local v3       #name:Ljava/lang/String;
    :catch_3
    move-exception v2

    .line 125
    .restart local v2       #e:Ljava/io/IOException;
    const-string v8, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception in Voicemail parser when close parser"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 117
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #name:Ljava/lang/String;
    :catch_4
    move-exception v2

    .line 118
    .restart local v2       #e:Ljava/io/IOException;
    :try_start_6
    const-string v8, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception in Voicemail parser "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 121
    :try_start_7
    instance-of v8, v5, Ljava/io/Closeable;

    if-eqz v8, :cond_0

    .line 122
    move-object v0, v5

    check-cast v0, Ljava/io/Closeable;

    move-object v8, v0

    invoke-interface {v8}, Ljava/io/Closeable;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto/16 :goto_1

    .line 124
    :catch_5
    move-exception v2

    .line 125
    const-string v8, "GSM"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Exception in Voicemail parser when close parser"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 120
    .end local v2           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v8

    .line 121
    :try_start_8
    instance-of v9, v5, Ljava/io/Closeable;

    if-eqz v9, :cond_2

    .line 122
    check-cast v5, Ljava/io/Closeable;

    .end local v5           #parser:Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v5}, Ljava/io/Closeable;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    .line 126
    :cond_2
    :goto_2
    throw v8

    .line 124
    :catch_6
    move-exception v2

    .line 125
    .restart local v2       #e:Ljava/io/IOException;
    const-string v9, "GSM"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Exception in Voicemail parser when close parser"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2
.end method


# virtual methods
.method containsCarrier(Ljava/lang/String;)Z
    .locals 1
    .parameter "carrier"

    .prologue
    .line 60
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/VoiceMailConstants;->CarrierVmMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method getCarrierName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "carrier"

    .prologue
    .line 64
    iget-object v1, p0, Lcom/android/internal/telephony/gsm/VoiceMailConstants;->CarrierVmMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 65
    .local v0, data:[Ljava/lang/String;
    const/4 v1, 0x0

    aget-object v1, v0, v1

    return-object v1
.end method

.method getVoiceMailNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "carrier"

    .prologue
    .line 69
    iget-object v1, p0, Lcom/android/internal/telephony/gsm/VoiceMailConstants;->CarrierVmMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 70
    .local v0, data:[Ljava/lang/String;
    const/4 v1, 0x1

    aget-object v1, v0, v1

    return-object v1
.end method

.method getVoiceMailTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "carrier"

    .prologue
    .line 74
    iget-object v1, p0, Lcom/android/internal/telephony/gsm/VoiceMailConstants;->CarrierVmMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 75
    .local v0, data:[Ljava/lang/String;
    const/4 v1, 0x2

    aget-object v1, v0, v1

    return-object v1
.end method
