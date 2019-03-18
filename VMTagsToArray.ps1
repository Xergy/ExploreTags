
$VMs = Get-AzureRmVm

$UniqueTags = $VMs.Tags | Select-Object -ExpandProperty keys | Select-Object -Unique | Sort-Object

$VMsTags = @()

foreach ($VM in $VMs) {
    $VMTag = New-Object -TypeName PSObject
    Add-Member -InputObject $VMTag -MemberType NoteProperty -Name Name -Value $VM.Name
    
    foreach ($UniqueTag in $UniqueTags) {
        # Write-Host "UniqueTag $UniqueTag"
        # $VM.Tags
        $TagValue = $Null

        if ($VMs[0].Tags.ContainsKey("ProjectName") ) { 
            $TagValue = $VM.Tags.$UniqueTag
        }

        Add-Member -InputObject $VMTag -MemberType NoteProperty -Name $UniqueTag -Value $TagValue
    }
    $VMsTags += $VMTag
}

$VMsTags[0]

$VMsTags | Measure-Object