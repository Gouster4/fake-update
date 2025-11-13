## What does this module do?
It does basically run two commands.
> resetprop -n ro.build.version.security_patch "$(date +%F)"
> resetprop -n ro.vendor.build.security_patch "$(date +%F)"

And creates security_patch.txt if it didint exist already, and if TrickyStore directory is found.

## How does it work?
resetprop sets ro.build.version.security_patch and ro.vendor.build.security_patch props values to actual date.
It happens on each boot, so while module is enabled, single reboot would "FAKE" update system and vendor.

## What it actually does?
It does change vendor and system patch dates to match current date. It doesnt update vendor nor system itself. Just date displayed.

## How is this usefull?
Older android devices doesnt get stock rom updates, which means, vendor partition isnt updated.
Some EOL devices also doesnt get even custom rom updates
With this script we can get vendor and system date matched to current date,
so vendor and system does appear up-to-date. But its not, system and vendor binaries are not touched by this module.
It does trick LineageOS Trust that system and vendor is up-to-date. If you are aware about system and vendor being outdated,
and you dont want to be notified, because there is nothing we can do about it, you can use this module.

Maybe it can help with play integrity, like with Tricky Store mode, which can spoof system vendor date for attestation based on
pre-set value, which you would need to manually change, or by using prop value, which can be provided by this module.

## Alternative
If you have old device that doesnt get vendor updates, but its supported by developers, and recieves frequent custom rom updates,
consider using https://github.com/Gouster4/vendor-prop which does fake update just vendor to match system security patch prop.
This is targeting mostly devices that doesnt get freqent official or custom rom updates at all. But it doesnt harm even at
up-to-date rom. But potentially can break custom rom OTA updates, as OTA updater can potentially use changed values for actual version identification, even its not likely that updater mechanism uses those props.

## Using with [TrickyStore](https://github.com/5ec1cff/TrickyStore/blob/release/README.md)?
If you created security_patch.txt add/change
> vendor=prop
> system=prop
> 
in /data/adb/tricky_store/security_patch.txt
to let new value be used when spoofing attestation.

If you didnt creted security_patch.txt, this module will create one for you. You dont need to do anything.
