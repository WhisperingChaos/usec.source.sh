#!/bin/bash
###############################################################################
#
#	Purpose:
#		Provide user security functions.
#
#	Notes:
#		>	Important conventions when modifying this file:
#			https://github.com/WhisperingChaos/SOLID_Bash/blob/master/README.md#source-file-conventions
#
###############################################################################
###############################################################################
#
#  Purpose:
#    Generate GID list for specified user.
#
#  Outputs:
#    STDOUT - Space separated list of GIDs assigned to account running this script.
#
###############################################################################
usec_GID_list_gen (){
  declare GID_name
  declare GID_list
  for GID_name in $( groups )
  do
    GID="`getent group "$GID_name" | cut -d: -f3`"
    if [ -z "$GID" ]; then Abort "$LINENO" "Failed to generate GID for group name: '$GID_name' associated to: '$USER'."; fi
    GID_list+="$GID "
  done
  echo "$GID_list"
}
