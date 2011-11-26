#!/sbin/sh
# don't use nfc or tag if the device doesn't support it.
# check for support to see if the base rom has those apks.
if [ ! -f "/system/app/NfcGoogle.apk" -a ! -f "/system/app/Nfc.apk" ]
then
    rm -f /tmp/gapps/system/app/NfcGoogle.apk
    
    # no nfc means no google wallet
    rm -f /system/app/Wallet.apk
    rm -f /system/framework/com.android.nfc_extras.jar
    rm -f /system/vendor/firmware/libpn544_fw.so
fi
if [ ! -f "/system/app/TagGoogle.apk" -a ! -f "/system/app/Tag.apk" ]
then
    rm -f /tmp/gapps/system/app/TagGoogle.apk
fi

# LatinIME.apk vs LatinImeGoogle.apk.. case sensitive
rm -f /system/app/LatinIME.apk

for f in $(ls /tmp/gapps/system/app | sed s/Google//g)
do
    rm /system/app/$f
done

cp -R /tmp/gapps/system/* /system
