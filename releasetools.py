import common
import edify_generator

def AddAssertions(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if ");" in edify.script[i] and ("ro.product.device" in edify.script[i] or "ro.build.product" in edify.script[i]):
            edify.script[i] = 'assert(getprop("ro.product.device") == "LT26i" || getprop("ro.build.product") == "LT26i" || getprop("ro.build.product") == "nozomi" || getprop("ro.product.device") == "nozomi");'
            return
    return

def ReplaceLine(info):
    edify = info.script
    for i in xrange(len(edify.script)):
        if 'mount("ext4", "EMMC", "/dev/block/mmcblk0p14", "/data");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "mount", "/data");'

        elif 'unmount("/data");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "umount", "/data");'

        elif 'mount("ext4", "EMMC", "/dev/block/mmcblk0p12", "/system");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "mount", "/system");'

        elif 'unmount("/system");' in edify.script[i]:
            edify.script[i] = 'run_program("/sbin/busybox", "umount", "/system");'

        elif 'ui_print("Formatting system...");' in edify.script[i]:
            edify.script[i] += '\nrun_program("/sbin/busybox", "mount", "/system");\ndelete_recursive("/system");'

        elif 'format("ext4", "EMMC", "/dev/block/mmcblk0p12", "0");' in edify.script[i]:
            edify.script[i] = ''

def AddWifiLink(info):
    info.script.AppendExtra('symlink("data/misc/audio/wcd9310_anc.bin","system/etc/firmware/wcd9310/wcd9310_anc.bin");')
    info.script.AppendExtra('symlink("data/misc/audio/mbhc.bin","system/etc/firmware/wcd9310/wcd9310_mbhc.bin");')
    return 

def FullOTA_InstallEnd(info):
    AddAssertions(info)
    ReplaceLine(info)
#    AddWifiLink(info)
    return

def IncrementalOTA_InstallEnd(info):
    AddAssertions(info)
    ReplaceLine(info)
#    AddWifiLink(info)
    return
