# Reads a plain-text work log and tallies hours per responsibility code, per day.

$sLogFile = ".\worklog_2022.txt"

$hWork = @{}

Get-Content $sLogFile | Where-Object { $_ -ne '' } | ForEach-Object {
	if ( $_ -match '^(\d{4})-(\d{2})-(\d{2})' ) {
		$nYear = $matches[ 1 ]
		$nMonth = $matches[ 2 ]
		$nDay = $matches[ 3 ]
		$sDate = "$nYear-$nMonth-$nDay"
		$hWork[ $sDate ] = @{}
	}
	elseif ( $_ -match '^(\d{2}\.\d{2}): \[(\w{2})\|(\w{4})\|(\w{3})\|(.{6})\]: (.+).\s?\(?([\w\s,]+)?\)?' ) {
		if ( !( $hWork[ $sDate ].ContainsKey( $matches[ 5 ] ))) {
			$hWork[ $sDate ].Add( $matches[ 5 ], [decimal]$matches[ 1 ])
		}
		else {
			$hWork[ $sDate ][ $matches[ 5 ] ] = $hWork[ $sDate ][ $matches[ 5 ] ] + [decimal]$matches[ 1 ]
		}
	}
	elseif ( $_ -match '^(\d{2}\.\d{2}): \[(\w{2})\|(\w{4})\|(\w{3})\|(.{6})\|(.{1})\]: (.+).\s?\(?([\w\s,]+)?\)?' ) {
		if ( !( $hWork[ $sDate ].ContainsKey( $matches[ 5 ] ))) {
			$hWork[ $sDate ].Add( $matches[ 5 ], [decimal]$matches[ 1 ])
		}
		else {
			$hWork[ $sDate ][ $matches[ 5 ] ] = $hWork[ $sDate ][ $matches[ 5 ] ] + [decimal]$matches[ 1 ]
		}
	}
}
$hWork.GetEnumerator() | Sort-Object Name | ForEach-Object {
	$_.Name
	$_.Value.GetEnumerator() | Sort-Object Name
}