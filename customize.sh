#!/system/bin/sh

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

ui_print "*******************************"
ui_print "          Fake update          "
ui_print "*******************************"
ui_print "     Sets current date as      "
ui_print "    System and Vendor prop     "
ui_print "         at each boot          "
ui_print "*******************************"

set_perm_recursive  $MODPATH  0  0  0755  0644
