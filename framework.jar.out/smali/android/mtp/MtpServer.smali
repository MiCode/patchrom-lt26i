.class public Landroid/mtp/MtpServer;
.super Ljava/lang/Object;
.source "MtpServer.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final LAST_COMMAND:I = 0x10001

.field public static final MTP_SERVER_DESTROYED:I = 0x10001

.field private static final SERVER_TIMEOUT:J = 0x4L

.field private static final TAG:Ljava/lang/String; = "MtpServer"

.field private static mMtpStatus:I

.field private static final sServerStartedLock:Ljava/util/concurrent/Semaphore;


# instance fields
.field private final MTP_UI_NOTIFY_CONNECTED:I

.field private final MTP_UI_NOTIFY_DISCONNECTED:I

.field private final MTP_UI_NOTIFY_EMPTY_UUID:I

.field private final MTP_UI_NOTIFY_NOTRESPONDING:I

.field private mContext:Landroid/content/Context;

.field private mHostEui64:[Ljava/lang/String;

.field private mHostId:I

.field private mHostName:Ljava/lang/String;

.field private mMtpServiceHandler:Landroid/os/Handler;

.field private mNativeContext:I

.field private mUseIp:Z

.field private mUuid:Ljava/lang/String;

.field private mVendorHandler:Landroid/mtp/MtpVendorHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 45
    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    sput-object v0, Landroid/mtp/MtpServer;->sServerStartedLock:Ljava/util/concurrent/Semaphore;

    .line 57
    const/4 v0, 0x7

    sput v0, Landroid/mtp/MtpServer;->mMtpStatus:I

    .line 64
    const-string/jumbo v0, "media_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Landroid/mtp/MtpDatabase;Z)V
    .locals 2
    .parameter "database"
    .parameter "usePtp"

    .prologue
    const/4 v1, 0x0

    .line 67
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x1

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_CONNECTED:I

    .line 54
    const/4 v0, 0x2

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_NOTRESPONDING:I

    .line 55
    const/4 v0, 0x3

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_DISCONNECTED:I

    .line 56
    const/4 v0, 0x4

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_EMPTY_UUID:I

    .line 59
    iput-object v1, p0, Landroid/mtp/MtpServer;->mMtpServiceHandler:Landroid/os/Handler;

    .line 68
    invoke-direct {p0, p1, p2, v1}, Landroid/mtp/MtpServer;->native_setup(Landroid/mtp/MtpDatabase;ZLandroid/mtp/MtpVendorHandler;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/mtp/MtpDatabase;ZLandroid/content/Context;)V
    .locals 2
    .parameter "database"
    .parameter "usePtp"
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    .line 71
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 53
    const/4 v0, 0x1

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_CONNECTED:I

    .line 54
    const/4 v0, 0x2

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_NOTRESPONDING:I

    .line 55
    const/4 v0, 0x3

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_DISCONNECTED:I

    .line 56
    const/4 v0, 0x4

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_EMPTY_UUID:I

    .line 59
    iput-object v1, p0, Landroid/mtp/MtpServer;->mMtpServiceHandler:Landroid/os/Handler;

    .line 72
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/mtp/MtpServer;->mUseIp:Z

    .line 73
    iput-object v1, p0, Landroid/mtp/MtpServer;->mUuid:Ljava/lang/String;

    .line 74
    iput-object v1, p0, Landroid/mtp/MtpServer;->mHostEui64:[Ljava/lang/String;

    .line 75
    const/4 v0, -0x1

    iput v0, p0, Landroid/mtp/MtpServer;->mHostId:I

    .line 76
    const-string v0, ""

    iput-object v0, p0, Landroid/mtp/MtpServer;->mHostName:Ljava/lang/String;

    .line 77
    const/16 v0, 0x8

    sput v0, Landroid/mtp/MtpServer;->mMtpStatus:I

    .line 78
    iput-object p3, p0, Landroid/mtp/MtpServer;->mContext:Landroid/content/Context;

    .line 79
    new-instance v0, Landroid/mtp/MtpVendorHandler;

    invoke-direct {v0, p3}, Landroid/mtp/MtpVendorHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    .line 80
    iget-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    invoke-direct {p0, p1, p2, v0}, Landroid/mtp/MtpServer;->native_setup(Landroid/mtp/MtpDatabase;ZLandroid/mtp/MtpVendorHandler;)V

    .line 81
    return-void
.end method

.method public constructor <init>(Landroid/mtp/MtpDatabase;ZLandroid/content/Context;ILjava/lang/String;)V
    .locals 3
    .parameter "database"
    .parameter "usePtp"
    .parameter "context"
    .parameter "hostId"
    .parameter "hostName"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 84
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput v2, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_CONNECTED:I

    .line 54
    const/4 v0, 0x2

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_NOTRESPONDING:I

    .line 55
    const/4 v0, 0x3

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_DISCONNECTED:I

    .line 56
    const/4 v0, 0x4

    iput v0, p0, Landroid/mtp/MtpServer;->MTP_UI_NOTIFY_EMPTY_UUID:I

    .line 59
    iput-object v1, p0, Landroid/mtp/MtpServer;->mMtpServiceHandler:Landroid/os/Handler;

    .line 85
    if-lez p4, :cond_1

    .line 86
    iput-boolean v2, p0, Landroid/mtp/MtpServer;->mUseIp:Z

    .line 87
    invoke-virtual {p1}, Landroid/mtp/MtpDatabase;->getDeviceUuid()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/mtp/MtpServer;->mUuid:Ljava/lang/String;

    .line 88
    iget-object v0, p0, Landroid/mtp/MtpServer;->mUuid:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    iput-object v1, p0, Landroid/mtp/MtpServer;->mUuid:Ljava/lang/String;

    .line 91
    :cond_0
    invoke-virtual {p1, p4}, Landroid/mtp/MtpDatabase;->getHostIdsAsArray(I)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroid/mtp/MtpServer;->mHostEui64:[Ljava/lang/String;

    .line 92
    iput p4, p0, Landroid/mtp/MtpServer;->mHostId:I

    .line 93
    iput-object p5, p0, Landroid/mtp/MtpServer;->mHostName:Ljava/lang/String;

    .line 94
    const/4 v0, 0x5

    sput v0, Landroid/mtp/MtpServer;->mMtpStatus:I

    .line 95
    iput-object v1, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    .line 105
    :goto_0
    iput-object p3, p0, Landroid/mtp/MtpServer;->mContext:Landroid/content/Context;

    .line 107
    iget-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    invoke-direct {p0, p1, p2, v0}, Landroid/mtp/MtpServer;->native_setup(Landroid/mtp/MtpDatabase;ZLandroid/mtp/MtpVendorHandler;)V

    .line 108
    return-void

    .line 97
    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/mtp/MtpServer;->mUseIp:Z

    .line 98
    iput-object v1, p0, Landroid/mtp/MtpServer;->mUuid:Ljava/lang/String;

    .line 99
    iput-object v1, p0, Landroid/mtp/MtpServer;->mHostEui64:[Ljava/lang/String;

    .line 100
    const/4 v0, -0x1

    iput v0, p0, Landroid/mtp/MtpServer;->mHostId:I

    .line 101
    const-string v0, ""

    iput-object v0, p0, Landroid/mtp/MtpServer;->mHostName:Ljava/lang/String;

    .line 102
    const/16 v0, 0x8

    sput v0, Landroid/mtp/MtpServer;->mMtpStatus:I

    .line 103
    new-instance v0, Landroid/mtp/MtpVendorHandler;

    invoke-direct {v0, p3}, Landroid/mtp/MtpVendorHandler;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    goto :goto_0
.end method

.method public static getMtpStatus()I
    .locals 1

    .prologue
    .line 198
    sget v0, Landroid/mtp/MtpServer;->mMtpStatus:I

    return v0
.end method

.method private final native native_abort()V
.end method

.method private final native native_add_storage(Landroid/mtp/MtpStorage;)V
.end method

.method private final native native_cleanup()V
.end method

.method private final native native_remove_storage(I)V
.end method

.method private final native native_run()V
.end method

.method private final native native_send_object_added(I)V
.end method

.method private final native native_send_object_removed(I)V
.end method

.method private final native native_setup(Landroid/mtp/MtpDatabase;ZLandroid/mtp/MtpVendorHandler;)V
.end method

.method private notifyMtpService(I)V
    .locals 2
    .parameter "msgId"

    .prologue
    .line 209
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 210
    .local v0, msg:Landroid/os/Message;
    iput p1, v0, Landroid/os/Message;->what:I

    .line 211
    iget-object v1, p0, Landroid/mtp/MtpServer;->mMtpServiceHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 212
    return-void
.end method

.method private sendNotification(I)V
    .locals 4
    .parameter "errCode"

    .prologue
    .line 215
    const/4 v1, 0x1

    .line 217
    .local v1, status:I
    packed-switch p1, :pswitch_data_0

    .line 243
    :goto_0
    return-void

    .line 219
    :pswitch_0
    const/4 v2, 0x0

    sput v2, Landroid/mtp/MtpServer;->mMtpStatus:I

    .line 236
    :goto_1
    new-instance v0, Landroid/content/Intent;

    const-string v2, "com.sonymobile.mtpwifi.NOTIFY"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 237
    .local v0, response:Landroid/content/Intent;
    const-string/jumbo v2, "value_0"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 238
    const-string/jumbo v2, "value_1"

    iget v3, p0, Landroid/mtp/MtpServer;->mHostId:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 239
    const-string/jumbo v2, "value_2"

    sget v3, Landroid/mtp/MtpServer;->mMtpStatus:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 240
    const-string/jumbo v2, "value_3"

    iget-object v3, p0, Landroid/mtp/MtpServer;->mHostName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 241
    const-string v2, "is_response_to"

    const-string v3, ""

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 242
    iget-object v2, p0, Landroid/mtp/MtpServer;->mContext:Landroid/content/Context;

    const-string v3, "com.sonymobile.mtp.permission.CONTROL_MTP_STACK"

    invoke-virtual {v2, v0, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0

    .line 222
    .end local v0           #response:Landroid/content/Intent;
    :pswitch_1
    const/4 v2, 0x4

    sput v2, Landroid/mtp/MtpServer;->mMtpStatus:I

    goto :goto_1

    .line 225
    :pswitch_2
    const/4 v1, 0x0

    .line 226
    const/4 v2, 0x7

    sput v2, Landroid/mtp/MtpServer;->mMtpStatus:I

    goto :goto_1

    .line 229
    :pswitch_3
    const/4 v1, 0x0

    .line 230
    const/4 v2, 0x6

    sput v2, Landroid/mtp/MtpServer;->mMtpStatus:I

    goto :goto_1

    .line 217
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private declared-synchronized stopVendorHandler()V
    .locals 1

    .prologue
    .line 202
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    invoke-virtual {v0}, Landroid/mtp/MtpVendorHandler;->stop()V

    .line 204
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    :cond_0
    monitor-exit p0

    return-void

    .line 202
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static waitForServerStarted()V
    .locals 5

    .prologue
    .line 156
    :try_start_0
    sget-object v1, Landroid/mtp/MtpServer;->sServerStartedLock:Ljava/util/concurrent/Semaphore;

    const-wide/16 v2, 0x4

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/Semaphore;->tryAcquire(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 157
    const-string v1, "MtpServer"

    const-string v2, "MtpServer takes too much time to start."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    .local v0, exception:Ljava/lang/InterruptedException;
    :cond_0
    :goto_0
    return-void

    .line 159
    .end local v0           #exception:Ljava/lang/InterruptedException;
    :catch_0
    move-exception v0

    .line 160
    .restart local v0       #exception:Ljava/lang/InterruptedException;
    const-string v1, "MtpServer"

    const-string v2, "InterruptedException while tryAcquire() in waitForServerStarted"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public addStorage(Landroid/mtp/MtpStorage;)V
    .locals 0
    .parameter "storage"

    .prologue
    .line 177
    invoke-direct {p0, p1}, Landroid/mtp/MtpServer;->native_add_storage(Landroid/mtp/MtpStorage;)V

    .line 178
    return-void
.end method

.method public removeStorage(Landroid/mtp/MtpStorage;)V
    .locals 2
    .parameter "storage"

    .prologue
    .line 181
    invoke-virtual {p1}, Landroid/mtp/MtpStorage;->getStorageId()I

    move-result v1

    invoke-direct {p0, v1}, Landroid/mtp/MtpServer;->native_remove_storage(I)V

    .line 183
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, extMntPath:Ljava/lang/String;
    iget-boolean v1, p0, Landroid/mtp/MtpServer;->mUseIp:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/mtp/MtpStorage;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    .line 193
    invoke-direct {p0}, Landroid/mtp/MtpServer;->native_abort()V

    .line 195
    :cond_0
    return-void
.end method

.method public run()V
    .locals 3

    .prologue
    const v2, 0x10001

    .line 117
    iget-boolean v0, p0, Landroid/mtp/MtpServer;->mUseIp:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/mtp/MtpServer;->mUuid:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 118
    const/4 v0, 0x4

    invoke-direct {p0, v0}, Landroid/mtp/MtpServer;->sendNotification(I)V

    .line 120
    invoke-direct {p0, v2}, Landroid/mtp/MtpServer;->notifyMtpService(I)V

    .line 136
    :goto_0
    return-void

    .line 123
    :cond_0
    iget-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    if-eqz v0, :cond_1

    .line 124
    iget-object v0, p0, Landroid/mtp/MtpServer;->mVendorHandler:Landroid/mtp/MtpVendorHandler;

    iget v1, p0, Landroid/mtp/MtpServer;->mNativeContext:I

    invoke-virtual {v0, v1}, Landroid/mtp/MtpVendorHandler;->start(I)V

    .line 126
    :cond_1
    sget-object v0, Landroid/mtp/MtpServer;->sServerStartedLock:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0}, Ljava/util/concurrent/Semaphore;->release()V

    .line 127
    invoke-direct {p0}, Landroid/mtp/MtpServer;->native_run()V

    .line 128
    invoke-direct {p0}, Landroid/mtp/MtpServer;->native_cleanup()V

    .line 129
    iget-boolean v0, p0, Landroid/mtp/MtpServer;->mUseIp:Z

    if-eqz v0, :cond_2

    .line 130
    const/4 v0, 0x3

    invoke-direct {p0, v0}, Landroid/mtp/MtpServer;->sendNotification(I)V

    .line 132
    :cond_2
    const/4 v0, 0x7

    sput v0, Landroid/mtp/MtpServer;->mMtpStatus:I

    .line 133
    invoke-direct {p0}, Landroid/mtp/MtpServer;->stopVendorHandler()V

    .line 135
    invoke-direct {p0, v2}, Landroid/mtp/MtpServer;->notifyMtpService(I)V

    goto :goto_0
.end method

.method public sendObjectAdded(I)V
    .locals 0
    .parameter "handle"

    .prologue
    .line 169
    invoke-direct {p0, p1}, Landroid/mtp/MtpServer;->native_send_object_added(I)V

    .line 170
    return-void
.end method

.method public sendObjectRemoved(I)V
    .locals 0
    .parameter "handle"

    .prologue
    .line 173
    invoke-direct {p0, p1}, Landroid/mtp/MtpServer;->native_send_object_removed(I)V

    .line 174
    return-void
.end method

.method public setMtpServiceHandler(Landroid/os/Handler;)V
    .locals 0
    .parameter "aHandler"

    .prologue
    .line 165
    iput-object p1, p0, Landroid/mtp/MtpServer;->mMtpServiceHandler:Landroid/os/Handler;

    .line 166
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 111
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "MtpServer"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 112
    .local v0, thread:Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 113
    return-void
.end method

.method public stop()V
    .locals 0

    .prologue
    .line 142
    invoke-direct {p0}, Landroid/mtp/MtpServer;->native_abort()V

    .line 143
    invoke-direct {p0}, Landroid/mtp/MtpServer;->stopVendorHandler()V

    .line 144
    return-void
.end method
