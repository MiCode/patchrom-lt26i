#
# Makefile for lt26i 
#
local-previous-target-dir := ~/workspace/ota_base/lt26i

# The original zip file, MUST be specified by each product
local-zip-file     := stockrom.zip

# The output zip file of MIUI rom, the default is porting_miui.zip if not specified
local-out-zip-file := MIUI_lt26i.zip

# All apps from original ZIP, but has smali files chanded
local-modified-apps := CustomizedSettings MediaProvider

local-modified-jars := 

local-miui-modified-apps := MiuiHome Mms Settings Phone ThemeManager MiuiGallery Music

local-miui-removed-apps  := MediaProvider

# All apps need to be removed from original ZIP file

include phoneapps.mk

# To include the local targets before and after zip the final ZIP file, 
# and the local-targets should:
# (1) be defined after including porting.mk if using any global variable(see porting.mk)
# (2) the name should be leaded with local- to prevent any conflict with global targets
local-pre-zip := local-zip-misc
local-after-zip:= local-test

# The local targets after the zip file is generated, could include 'zip2sd' to 
# deliver the zip file to phone, or to customize other actions

include $(PORT_BUILD)/porting.mk

# To define any local-target
local-zip-misc:
	@echo Replace build.prop
	cp other/build-6.1.A.1.58.prop $(ZIP_DIR)/system/build.prop
	rm $(ZIP_DIR)/system/vendor/overlay -rf
	rm $(ZIP_DIR)/system/etc/customization/content/com/sonyericsson/wallpaperpicker/wallpapers -rf
	touch $(ZIP_DIR)/system/autorooted
	rm $(ZIP_DIR)/system/app/Superuser.apk -f
	touch $(ZIP_DIR)/system/app/Superuser.apk
	#cp other/ics11.elf $(ZIP_DIR)/boot.img
	cp other/Lt26iSettings.apk $(ZIP_DIR)/system/app/Lt26iSettings.apk
	rm $(ZIP_DIR)/system/etc/product/applications/ -rf

	@echo update bootanimation
	rm $(ZIP_DIR)/system/bin/bootanimation
	cp other/bootanimation $(ZIP_DIR)/system/bin/bootanimation


local-test:
	echo "an example action"
