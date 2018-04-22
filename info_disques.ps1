$colDisks = get-wmiobject Win32_LogicalDisk -Filter "DriveType = 3"
foreach ($disk in $coldisks) {
	$drive_name = $disk.DeviceID -Replace(":","")
	$total_volume = [Math]::round($disk.Size / 1GB)
	$disk_freespace = [Math]::round($disk.freespace / 1GB)
		
	$percentfree = [Math]::round((($disk.freespace/$disk.size) * 100))
	$percentused = 100-$percentfree
	
	if (($drive_name -eq "C") -or ($drive_name -eq "F") -or ($drive_name -eq "G") -or ($drive_name -eq "H"))
	{
	
		if ($drive_name -eq "C") {$jeedom_id = 488}
			elseif ($drive_name -eq "G") {$jeedom_id = 490 }
			elseif ($drive_name -eq "F") {$jeedom_id = 1187 }
			elseif ($drive_name -eq "H") {$jeedom_id = 1300 }
			$url = "http://192.168.1.159/core/api/jeeApi.php?apikey=cTS1TscXMHTWgxXcemek9qQBhtyxFFxW&type=virtual&id=$jeedom_id&value=$percentused"
			Invoke-WebRequest -uri $url -DisableKeepAlive -erroraction 'silentlycontinue'	
	}
	
}

$colDisks = get-wmiobject Win32_LogicalDisk -Filter "DriveType = 4"
foreach ($disk in $coldisks) {
	$drive_name = $disk.DeviceID -Replace(":","")
	$total_volume = [Math]::round($disk.Size / 1GB)
	$disk_freespace = [Math]::round($disk.freespace / 1GB)
		
	$percentfree = [Math]::round((($disk.freespace/$disk.size) * 100))
	$percentused = 100-$percentfree
	
	if ($drive_name -eq "M") {$jeedom_id = 568}
		
	$url = "http://192.168.1.159/core/api/jeeApi.php?apikey=cTS1TscXMHTWgxXcemek9qQBhtyxFFxW&type=virtual&id=$jeedom_id&value=$percentused"
	Invoke-WebRequest -uri $url -DisableKeepAlive -erroraction 'silentlycontinue'
	
}